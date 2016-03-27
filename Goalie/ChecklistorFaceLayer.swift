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
   private var _eyePathProvider = ChecklistorEyePathProvider()
   
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
      
      updateWithPriority(.Unknown)
   }
   
   // MARK: - Public
   override func updateWithPriority(priority: TaskPriority)
   {
      super.updateWithPriority(priority)
      
      performBlockWithoutAnimations { () -> Void in
         self._eyeLayer.hidden = priority == .Unknown
         self._eyeLayer.fillColor = UIColor.eyeColorForPriority(priority).CGColor
      }
   }
   
   override func animateForPriority(priority: TaskPriority)
   {
      if _currentlyAnimating == false {
         _currentlyAnimating = true
         switch priority
         {
         case .Ages: break
         case .Later: _animateEyeWithPath(_eyePathProvider.gushyEyePath)
         case .Soon: break
         case .ASAP: break
         case .Unknown:
            _currentlyAnimating = false
         }
      }
   }
   
   private func _animateEyeWithPath(path: CGPathRef)
   {
      let startingPath = _eyePathProvider.normalEyePath
      
      let animationGroup = CAAnimationGroup()
      animationGroup.duration = 1
      
      let closeEyeAnimation = CABasicAnimation(keyPath: "path")
      closeEyeAnimation.duration = 0.2
      closeEyeAnimation.fillMode = kCAFillModeForwards
      closeEyeAnimation.removedOnCompletion = false
      closeEyeAnimation.toValue = path
      
      let openEyeAnimation = CABasicAnimation(keyPath: "path")
      openEyeAnimation.beginTime = 0.9
      openEyeAnimation.duration = 0.1
      openEyeAnimation.fillMode = kCAFillModeForwards
      openEyeAnimation.removedOnCompletion = false
      openEyeAnimation.toValue = startingPath
      
      animationGroup.animations = [closeEyeAnimation, openEyeAnimation]
      
      animationGroup.delegate = self
      _eyeLayer.addAnimation(animationGroup, forKey: "eyeAnimation")
   }
   
   internal override func animationDidStop(anim: CAAnimation, finished flag: Bool)
   {
      self._currentlyAnimating = false
   }
}
