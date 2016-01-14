//
//  GoalieFaceLayer.swift
//  Goalie
//
//  Created by Gregory Klein on 1/11/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class CharacterFaceLayer: CALayer
{
   internal var _currentPriority: TaskPriority = .Unknown
   func updateWithPriority(priority: TaskPriority) {}
   func animateForPriority(priority: TaskPriority) {}
}

class GoalieFaceLayer: CharacterFaceLayer
{
   private let _leftEyeLayer = CAShapeLayer()
   private let _rightEyeLayer = CAShapeLayer()
   private let _mouthLayer = CAShapeLayer()
   private let _teethLayer = CAShapeLayer()
   
   private let _pathProvider = GoalieFacePathProvider()
   private var _currentlyAnimating = false
   
   // MARK: - Init
   private func _commonInit()
   {
      addSublayer(_leftEyeLayer)
      addSublayer(_rightEyeLayer)
      addSublayer(_mouthLayer)
      addSublayer(_teethLayer)
      
      _leftEyeLayer.path = _pathProvider.normalLeftEyePath
      _rightEyeLayer.path = _pathProvider.normalRightEyePath
      _mouthLayer.fillColor = UIColor.whiteColor().CGColor
      
      // HACK FOR NOW! Only show this for ASAP
      _teethLayer.fillColor = UIColor(red: 0.825, green: 0.803, blue: 0.765, alpha: 0.800).CGColor
      _teethLayer.path = _pathProvider.angryTeethPath
      
      updateWithPriority(.Unknown)
   }

   required init?(coder aDecoder: NSCoder)
   {
      super.init(coder: aDecoder)
      _commonInit()
   }
   
   override init()
   {
      super.init()
      _commonInit()
   }
   
   override init(layer: AnyObject)
   {
      super.init(layer: layer)
      _commonInit()
   }
   
   // MARK: - Public
   override func updateWithPriority(priority: TaskPriority)
   {
      _currentPriority = priority
      
      _performBlockWithoutAnimations { () -> Void in
         self._leftEyeLayer.hidden = priority == .Ages || priority == .Unknown
         self._rightEyeLayer.hidden = priority == .Ages || priority == .Unknown
         self._mouthLayer.hidden = false
         self._teethLayer.hidden = true
      }
      
      _performBlockWithoutAnimations { () -> Void in
         self._leftEyeLayer.removeAllAnimations()
         self._rightEyeLayer.removeAllAnimations()
         self._mouthLayer.removeAllAnimations()
         self._currentlyAnimating = false
      }
      
      _updateLayersForPriority(priority)
      animateForPriority(priority)
   }
   
   override func animateForPriority(priority: TaskPriority)
   {
      if _currentlyAnimating == false {
         _currentlyAnimating = true
         switch priority
         {
         case .Ages:
            _animateHappyMouthGrow()
         case .Later:
            if Int.randRange(0, upper: 1) == 0 {
               _happyWinkEye()
            }
            else {
               _happySquint()
            }
         case .Soon:
            _surprise()
            _animateWorriedMouthShrink()
         case .ASAP:
            _angryBlink()
         case .Unknown:
            _currentlyAnimating = false
         }
      }
   }
   
   // MARK: - Private
   private func _updateLayersForPriority(priority: TaskPriority)
   {
      let eyeColor = UIColor.eyeColorForPriority(priority)
      _leftEyeLayer.fillColor = eyeColor.CGColor
      _rightEyeLayer.fillColor = eyeColor.CGColor
      _mouthLayer.path = _pathProvider.mouthPathForPriority(priority)
      
      switch priority
      {
      case .Unknown:
         _performBlockWithoutAnimations({ () -> Void in
            self._leftEyeLayer.hidden = true
            self._rightEyeLayer.hidden = true
            self._mouthLayer.hidden = true
         })
      case .Ages:
         _performBlockWithoutAnimations({ () -> Void in
            self._leftEyeLayer.hidden = true
            self._rightEyeLayer.hidden = true
         })
      case .ASAP:
         _teethLayer.hidden = false
      default:
         break
      }
   }
   
   private func _happyWinkEye()
   {
      let oneOrZero = Int.randRange(0, upper: 1)
      if oneOrZero == 0 {
         _animateLeftEyeWithPath(_pathProvider.happyWinkingLeftEyePath)
      }
      else {
         _animateRightEyeWithPath(_pathProvider.happyWinkingRightEyePath)
      }
   }
   
   private func _happySquint()
   {
      _animateLeftEyeWithPath(_pathProvider.happyLeftEyePath)
      _animateRightEyeWithPath(_pathProvider.happyRightEyePath)
      _animateHappyMouthShrink()
   }
   
   private func _angryBlink()
   {
      _animateLeftEyeWithPath(_pathProvider.angrySquintingLeftEyePath)
      _animateRightEyeWithPath(_pathProvider.angrySquintingRightEyePath)
   }
   
   private func _surprise()
   {
      _animateLeftEyeWithPath(_pathProvider.leftSurprisedEyePath)
      _animateRightEyeWithPath(_pathProvider.rightSurprisedEyePath)
   }
   
   // not used (for now?)
   private func _worry()
   {
      _animateLeftEyeWithPath(_pathProvider.leftWorriedEyePath)
      _animateRightEyeWithPath(_pathProvider.rightWorriedEyePath)
   }
   
   private func _animateLeftEyeWithPath(path: CGPathRef)
   {
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
      openEyeAnimation.toValue = _pathProvider.normalLeftEyePath
      
      animationGroup.animations = [closeEyeAnimation, openEyeAnimation]
      
      animationGroup.delegate = self
      _leftEyeLayer.addAnimation(animationGroup, forKey: "blinkLeftEye")
   }
   
   private func _animateRightEyeWithPath(path: CGPathRef)
   {
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
      openEyeAnimation.toValue = _pathProvider.normalRightEyePath
      
      animationGroup.animations = [closeEyeAnimation, openEyeAnimation]
      animationGroup.delegate = self
      _rightEyeLayer.addAnimation(animationGroup, forKey: "blinkRightEye")
   }
   
   
   private func _animateHappyMouthShrink()
   {
      let animationGroup = CAAnimationGroup()
      animationGroup.duration = 1
      
      let closeEyeAnimation = CABasicAnimation(keyPath: "path")
      closeEyeAnimation.duration = 0.2
      closeEyeAnimation.fillMode = kCAFillModeForwards
      closeEyeAnimation.removedOnCompletion = false
      closeEyeAnimation.toValue = _pathProvider.smallHappyMouthPath
      
      let openEyeAnimation = CABasicAnimation(keyPath: "path")
      openEyeAnimation.beginTime = 0.9
      openEyeAnimation.duration = 0.1
      openEyeAnimation.fillMode = kCAFillModeForwards
      openEyeAnimation.removedOnCompletion = false
      openEyeAnimation.toValue = _pathProvider.happyMouthPath
      
      animationGroup.animations = [closeEyeAnimation, openEyeAnimation]
      animationGroup.delegate = self
      _mouthLayer.addAnimation(animationGroup, forKey: "shrinkMouth")
   }
   
   private func _animateHappyMouthGrow()
   {
      let animationGroup = CAAnimationGroup()
      animationGroup.duration = 1
      
      let closeEyeAnimation = CABasicAnimation(keyPath: "path")
      closeEyeAnimation.duration = 0.2
      closeEyeAnimation.fillMode = kCAFillModeForwards
      closeEyeAnimation.removedOnCompletion = false
      closeEyeAnimation.toValue = _pathProvider.bigHappyMouthPath
      
      let openEyeAnimation = CABasicAnimation(keyPath: "path")
      openEyeAnimation.beginTime = 0.9
      openEyeAnimation.duration = 0.1
      openEyeAnimation.fillMode = kCAFillModeForwards
      openEyeAnimation.removedOnCompletion = false
      openEyeAnimation.toValue = _pathProvider.happyMouthPath
      
      animationGroup.animations = [closeEyeAnimation, openEyeAnimation]
      animationGroup.delegate = self
      _mouthLayer.addAnimation(animationGroup, forKey: "growMouth")
   }
   
   private func _animateWorriedMouthShrink()
   {
      let animationGroup = CAAnimationGroup()
      animationGroup.duration = 1
      
      let closeEyeAnimation = CABasicAnimation(keyPath: "path")
      closeEyeAnimation.duration = 0.2
      closeEyeAnimation.fillMode = kCAFillModeForwards
      closeEyeAnimation.removedOnCompletion = false
      closeEyeAnimation.toValue = _pathProvider.flatScaredMouthPath
      
      let openEyeAnimation = CABasicAnimation(keyPath: "path")
      openEyeAnimation.beginTime = 0.9
      openEyeAnimation.duration = 0.1
      openEyeAnimation.fillMode = kCAFillModeForwards
      openEyeAnimation.removedOnCompletion = false
      openEyeAnimation.toValue = _pathProvider.scaredMouthPath
      
      animationGroup.animations = [closeEyeAnimation, openEyeAnimation]
      animationGroup.delegate = self
      _mouthLayer.addAnimation(animationGroup, forKey: "scaredMouthShrink")
   }
   
   private func _performBlockWithoutAnimations(block: (() -> Void))
   {
      CATransaction.begin()
      CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
      block()
      CATransaction.commit()
   }
   
   internal override func animationDidStop(anim: CAAnimation, finished flag: Bool)
   {
      self._currentlyAnimating = false
   }
}
