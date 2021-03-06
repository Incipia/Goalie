//
//  BizeeBeeFaceLayer.swift
//  Goalie
//
//  Created by Gregory Klein on 2/9/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class BizeeBeeFaceLayer: CharacterFaceLayer
{
   fileprivate let _wingsLayer = CAShapeLayer()
   fileprivate var _wingsAreAnimating = false
   
   override func commonInit()
   {
      super.commonInit()
      
      _pathProvider = BizeeBeeFacePathProvider()
      
      let wingsSize = CGSize(width: 80, height: 28.5)
      _wingsLayer.frame = CGRect(origin: CGPoint.zero, size: wingsSize)
      
      let wingColor = UIColor(red: 0.965, green: 0.753, blue: 0.843, alpha: 0.302)
      _wingsLayer.backgroundColor = wingColor.cgColor
      _wingsLayer.cornerRadius = wingsSize.height * 0.5
      
      let layersToBeAdjusted = [_mouthLayer, _leftEyeLayer, _rightEyeLayer]
      for layer in layersToBeAdjusted {
         layer.frame.origin.y += 5
         layer.frame.origin.x += 4
      }
   }
   
   override var backingContainerLayer: CALayer? {
      didSet {
         backingContainerLayer?.insertSublayer(_wingsLayer, at: 0)
         _updateWingsPosition()
      }
   }
   
   fileprivate func _updateWingsPosition()
   {
      let backingContainerBounds = backingContainerLayer?.bounds ?? CGRect.zero
      _wingsLayer.position = CGPoint(x: backingContainerBounds.midX, y: backingContainerBounds.midY)
   }
   
   override func layoutSublayers()
   {
      super.layoutSublayers()
      _updateWingsPosition()
   }
   
   override func reset()
   {
      super.reset()
      
      _wingsLayer.removeAllAnimations()
      _wingsLayer.removeFromSuperlayer()
      _wingsAreAnimating = false
   }
   
   override func animateForPriority(_ priority: TaskPriority)
   {
      super.animateForPriority(priority)
      
      if priority == .unknown {
         _wingsLayer.removeAllAnimations()
         _wingsAreAnimating = false
      }
      else if !_wingsAreAnimating {
         _wingsAreAnimating = true
         _startFlutteringAniation()
      }
   }
   
   fileprivate func _startFlutteringAniation()
   {
      let animationGroup = CAAnimationGroup()
      animationGroup.duration = 0.8
      animationGroup.repeatCount = Float.infinity
      
      let firstWingRotation = CABasicAnimation(keyPath: "transform.rotation.z")
      firstWingRotation.duration = 0.2
      firstWingRotation.fillMode = kCAFillModeForwards
      firstWingRotation.isRemovedOnCompletion = false
      firstWingRotation.toValue = M_PI / 18.0
      
      let secondWingRotation = CABasicAnimation(keyPath: "transform.rotation.z")
      secondWingRotation.beginTime = 0.2
      secondWingRotation.duration = 0.1
      secondWingRotation.fillMode = kCAFillModeForwards
      secondWingRotation.isRemovedOnCompletion = false
      secondWingRotation.toValue = -M_PI / 18.0
      
      let thirdWingRotation = CABasicAnimation(keyPath: "transform.rotation.z")
      thirdWingRotation.beginTime = 0.4
      thirdWingRotation.duration = 0.1
      thirdWingRotation.fillMode = kCAFillModeForwards
      thirdWingRotation.isRemovedOnCompletion = false
      thirdWingRotation.toValue = 0
      
      animationGroup.animations = [firstWingRotation, secondWingRotation, thirdWingRotation]
      animationGroup.delegate = self
      _wingsLayer.add(animationGroup, forKey: "flutter")
   }
}
