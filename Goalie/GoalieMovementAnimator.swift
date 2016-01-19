//
//  GoalieMovementAnimator.swift
//  Goalie
//
//  Created by Gregory Klein on 1/12/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

let TotalDuration: Double = 6

class GoalieMovementAnimator
{
   private var _startingCenter: CGPoint
   private let _goalieView: UIView
   private var _isAnimating = false
   
   init(view: UIView)
   {
      _goalieView = view
      _startingCenter = _goalieView.center
   }
   
   func startAnimating()
   {
      if !_isAnimating {
         _isAnimating = true
         _startTranslateAndRotationAnimations()
         _goalieView.layer.addAnimation(_mainGroupAnimation(), forKey: "goalieAnimation")
      }
   }
   
   func stopAnimating()
   {
      _goalieView.layer.removeAllAnimations()
      _isAnimating = false
   }
   
   private func _startTranslateAnimations()
   {
      let delay = 0.0
      let raw = UIViewKeyframeAnimationOptions.Repeat.rawValue |
         UIViewAnimationOptions.CurveLinear.rawValue |
         UIViewKeyframeAnimationOptions.AllowUserInteraction.rawValue
      let options = UIViewKeyframeAnimationOptions(rawValue: raw)
      
      UIView.animateKeyframesWithDuration(TotalDuration, delay: delay, options: options, animations: {
         UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.25, animations: {
            self._goalieView.transform = CGAffineTransformMakeTranslation(5, 0)
         })
         UIView.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.5, animations: {
            self._goalieView.transform = CGAffineTransformMakeTranslation(-5, 0)
         })
         UIView.addKeyframeWithRelativeStartTime(0.75, relativeDuration: 0.25, animations: {
            self._goalieView.transform = CGAffineTransformMakeTranslation(0, 0)
         })
         
         }, completion: nil)
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
   
   private func _mainGroupAnimation() -> CAAnimationGroup
   {
      let scaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
      scaleYAnimation.values = [1, 0.95, 1]
      scaleYAnimation.keyTimes = [0, 0.5, 1]
      scaleYAnimation.duration = TotalDuration * 0.25
      scaleYAnimation.repeatCount = Float(TotalDuration)
      
      let scaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
      scaleXAnimation.values = [1, 1.05, 1]
      scaleXAnimation.keyTimes = [0, 0.5, 1]
      scaleXAnimation.duration = TotalDuration * 0.25
      scaleXAnimation.repeatCount = Float(TotalDuration)
      
      let group = CAAnimationGroup()
      group.animations = [scaleXAnimation, scaleYAnimation]
      group.duration = TotalDuration
      group.repeatCount = Float.infinity
      
      return group
   }
}
