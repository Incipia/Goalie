//
//  ChecklistorFaceLayer.swift
//  Goalie
//
//  Created by Gregory Klein on 3/25/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class ChecklistorFaceLayer: CharacterFaceLayer
{
   internal var _eyeLayer = CAShapeLayer()
   fileprivate var _eyePathProvider = ChecklistorEyePathProvider()
   
   // MARK: - Init
   override func commonInit()
   {
      super.commonInit()
      
      _mouthLayer.removeFromSuperlayer()
      
      _leftEyeLayer.removeFromSuperlayer()
      _rightEyeLayer.removeFromSuperlayer()
      
      addSublayer(_eyeLayer)
      _eyeLayer.path = _eyePathProvider.normalEyePath
      
      _shapeLayers.append(_eyeLayer)
      
      updateWithPriority(.unknown)
   }
   
   // MARK: - Public
   override func updateWithPriority(_ priority: TaskPriority)
   {
      super.updateWithPriority(priority)
      
      performBlockWithoutAnimations { () -> Void in
         self._eyeLayer.isHidden = priority == .unknown
         self._eyeLayer.fillColor = UIColor.eyeColorForPriority(priority).cgColor
      }
   }
   
   override func animateForPriority(_ priority: TaskPriority)
   {
      if _currentlyAnimating == false {
         _currentlyAnimating = true
         switch priority
         {
         case .ages: _animateEyeWithPath(_eyePathProvider.bigEyePath)
         case .later:
            if Int.randRange(0, upper: 1) == 1 {
               _animateEyeWithPath(_eyePathProvider.gushyEyePath)
            }
            else {
               _animateEyeWithPath(_eyePathProvider.bigEyePath)
            }
         case .soon:
            if Int.randRange(0, upper: 1) == 1 {
               _animateEyeWithPath(_eyePathProvider.bigVerticalEyePath)
            }
            else {
               _animateEyeWithPath(_eyePathProvider.lookingDownEyePath)
            }
         case .asap: _animateEyeWithPath(_eyePathProvider.thinHorizontalEyePath)
         case .unknown:
            _currentlyAnimating = false
         }
      }
   }
   
   fileprivate func _animateEyeWithPath(_ path: CGPath)
   {
      let startingPath = _eyePathProvider.normalEyePath
      
      let animationGroup = CAAnimationGroup()
      animationGroup.duration = 1
      
      let closeEyeAnimation = CABasicAnimation(keyPath: "path")
      closeEyeAnimation.duration = 0.2
      closeEyeAnimation.fillMode = kCAFillModeForwards
      closeEyeAnimation.isRemovedOnCompletion = false
      closeEyeAnimation.toValue = path
      
      let openEyeAnimation = CABasicAnimation(keyPath: "path")
      openEyeAnimation.beginTime = 0.9
      openEyeAnimation.duration = 0.1
      openEyeAnimation.fillMode = kCAFillModeForwards
      openEyeAnimation.isRemovedOnCompletion = false
      openEyeAnimation.toValue = startingPath
      
      animationGroup.animations = [closeEyeAnimation, openEyeAnimation]
      
      animationGroup.delegate = self
      _eyeLayer.add(animationGroup, forKey: "eyeAnimation")
   }
   
   internal override func animationDidStop(_ anim: CAAnimation, finished flag: Bool)
   {
      self._currentlyAnimating = false
   }
}
