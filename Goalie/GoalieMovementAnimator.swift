//
//  GoalieMovementAnimator.swift
//  Goalie
//
//  Created by Gregory Klein on 1/12/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

extension CGAffineTransform
{
   var xScale: CGFloat {
      return sqrt(a * a + c * c)
   }
   
   var yScale: CGFloat {
      return sqrt(b * b + d * d)
   }
}

let TotalDuration: Double = 6

class GoalieMovementAnimator
{
   private var _startingCenter: CGPoint
   private let _goalieView: UIView
   private var _isAnimating = false
   
   private var _initialScale: (x: CGFloat, y: CGFloat) = (1, 1)
   
   init(view: UIView)
   {
      _goalieView = view
      _initialScale.x = view.transform.xScale
      _initialScale.y = view.transform.yScale
      
      _startingCenter = _goalieView.center
   }
   
   func startAnimating()
   {
      if !_isAnimating {
         _isAnimating = true
         _startTranslateAndRotationAnimations()
         _startScalingAnimations()
      }
   }
   
   func startScalingAnimation()
   {
      if !_isAnimating {
         _isAnimating = true
         _startScalingAnimations()
      }
   }
   
   func stopAnimating()
   {
      _goalieView.layer.removeAllAnimations()
      _isAnimating = false
   }
   
   private func _startTranslateAndRotationAnimations()
   {
      let delay = 0.0
      let raw = UIViewKeyframeAnimationOptions.Repeat.rawValue |
         UIViewAnimationOptions.CurveLinear.rawValue |
         UIViewKeyframeAnimationOptions.AllowUserInteraction.rawValue
      let options = UIViewKeyframeAnimationOptions(rawValue: raw)
      let rotation: CGFloat = 0.0872665
      
      UIView.animateKeyframesWithDuration(TotalDuration, delay: delay, options: options, animations: {
         UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.25, animations: {
            
            let rotatedTransform = CGAffineTransformMakeRotation(rotation)
            let translatedTransform = CGAffineTransformMakeTranslation(5, 0)
            self._goalieView.transform = CGAffineTransformConcat(rotatedTransform, translatedTransform)
         })
         UIView.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.5, animations: {
            
            let rotatedTransform = CGAffineTransformMakeRotation(-rotation)
            let translatedTransform = CGAffineTransformMakeTranslation(-5, 0)
            self._goalieView.transform = CGAffineTransformConcat(rotatedTransform, translatedTransform)
         })
         UIView.addKeyframeWithRelativeStartTime(0.75, relativeDuration: 0.25, animations: {
            
            let rotatedTransform = CGAffineTransformMakeRotation(0)
            let translatedTransform = CGAffineTransformMakeTranslation(0, 0)
            self._goalieView.transform = CGAffineTransformConcat(rotatedTransform, translatedTransform)
         })
         
         }, completion: nil)
   }
   
   private func _startScalingAnimations()
   {
      let scaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
      scaleYAnimation.values = [_initialScale.y, _initialScale.y * 0.95, _initialScale.y]
      scaleYAnimation.keyTimes = [0, 0.5, 1]
      scaleYAnimation.duration = TotalDuration * 0.25
      scaleYAnimation.repeatCount = Float(TotalDuration)
      
      let scaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
      scaleXAnimation.values = [_initialScale.x, _initialScale.x * 1.05, _initialScale.x]
      scaleXAnimation.keyTimes = [0, 0.5, 1]
      scaleXAnimation.duration = TotalDuration * 0.25
      scaleXAnimation.repeatCount = Float(TotalDuration)
      
      let group = CAAnimationGroup()
      group.animations = [scaleXAnimation, scaleYAnimation]
      group.duration = TotalDuration
      group.repeatCount = Float.infinity
      
      _goalieView.layer.addAnimation(group, forKey: "goalieAnimation")
   }
}
