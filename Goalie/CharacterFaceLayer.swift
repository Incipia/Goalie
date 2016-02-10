//
//  CharacterFaceLayer.swift
//  Goalie
//
//  Created by Gregory Klein on 2/9/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class CharacterFaceLayer: CALayer
{
   internal var _currentPriority: TaskPriority = .Unknown
   internal var _currentlyAnimating = false
   
   internal var _leftEyeLayer = CAShapeLayer()
   internal var _rightEyeLayer = CAShapeLayer()
   internal var _mouthLayer = CAShapeLayer()
   
   internal var _pathProvider: CharacterFacePathProvider = GoalieFacePathProvider()
   internal var _shapeLayers: [CAShapeLayer] = []
   
   internal func commonInit()
   {
      _shapeLayers = [_leftEyeLayer, _rightEyeLayer, _mouthLayer]
      
      addSublayer(_leftEyeLayer)
      addSublayer(_rightEyeLayer)
      addSublayer(_mouthLayer)
      
      _mouthLayer.fillColor = UIColor.whiteColor().CGColor
   }
   
   required init?(coder aDecoder: NSCoder)
   {
      super.init(coder: aDecoder)
      commonInit()
   }
   
   override init()
   {
      super.init()
      commonInit()
   }
   
   override init(layer: AnyObject)
   {
      super.init(layer: layer)
      commonInit()
   }
   
   func updateWithPriority(priority: TaskPriority)
   {
      _currentPriority = priority
      
      performBlockWithoutAnimations { () -> Void in
         self._currentlyAnimating = false
         for layer in self._shapeLayers {
            layer.removeAllAnimations()
         }
      }
      
      let eyeColor = UIColor.eyeColorForPriority(priority)
      _leftEyeLayer.fillColor = eyeColor.CGColor
      _rightEyeLayer.fillColor = eyeColor.CGColor
      
      _leftEyeLayer.path = priority == .ASAP ? _pathProvider.angryLeftEyePath : _pathProvider.normalLeftEyePath
      _rightEyeLayer.path = priority == .ASAP ? _pathProvider.angryRightEyePath : _pathProvider.normalRightEyePath
      
      _mouthLayer.path = _pathProvider.mouthPathForPriority(priority)
      
      performBlockWithoutAnimations { () -> Void in
         switch priority
         {
         case .Unknown:
            self._leftEyeLayer.hidden = true
            self._rightEyeLayer.hidden = true
            self._mouthLayer.hidden = true
            break
         case .Ages:
            self._leftEyeLayer.hidden = true
            self._rightEyeLayer.hidden = true
            self._mouthLayer.hidden = false
            break
         case .Soon, .Later:
            self._leftEyeLayer.hidden = false
            self._rightEyeLayer.hidden = false
            self._mouthLayer.hidden = false
            break
         case .ASAP:
            self._leftEyeLayer.hidden = false
            self._rightEyeLayer.hidden = false
            self._mouthLayer.hidden = false
            break
         }
      }
   }
   
   func animateForPriority(priority: TaskPriority)
   {
      if _currentlyAnimating == false {
         _currentlyAnimating = true
         switch priority
         {
         case .Ages:
            animateHappyMouthGrow()
         case .Later:
            if Int.randRange(0, upper: 1) == 0 {
               happyWinkEye()
            }
            else {
               happySquint()
            }
         case .Soon:
            surprise()
            animateWorriedMouthShrink()
         case .ASAP:
            angryBlink()
         case .Unknown:
            _currentlyAnimating = false
         }
      }
   }
   
   // MARK: - Private
   internal func happyWinkEye()
   {
      let oneOrZero = Int.randRange(0, upper: 1)
      if oneOrZero == 0 {
         _animateLeftEyeWithPath(_pathProvider.happyWinkingLeftEyePath)
      }
      else {
         _animateRightEyeWithPath(_pathProvider.happyWinkingRightEyePath)
      }
   }
   
   internal func happySquint()
   {
      _animateLeftEyeWithPath(_pathProvider.happyLeftEyePath)
      _animateRightEyeWithPath(_pathProvider.happyRightEyePath)
      animateHappyMouthShrink()
   }
   
   internal func angryBlink()
   {
      _animateLeftEyeWithPath(_pathProvider.angrySquintingLeftEyePath)
      _animateRightEyeWithPath(_pathProvider.angrySquintingRightEyePath)
   }
   
   internal func surprise()
   {
      _animateLeftEyeWithPath(_pathProvider.leftSurprisedEyePath)
      _animateRightEyeWithPath(_pathProvider.rightSurprisedEyePath)
   }
   
   private func _animateLeftEyeWithPath(path: CGPathRef)
   {
      let startingPath = _currentPriority == .ASAP ? _pathProvider.angryLeftEyePath : _pathProvider.normalLeftEyePath
      
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
      _leftEyeLayer.addAnimation(animationGroup, forKey: "blinkLeftEye")
   }
   
   private func _animateRightEyeWithPath(path: CGPathRef)
   {
      let startingPath = _currentPriority == .ASAP ? _pathProvider.angryRightEyePath : _pathProvider.normalRightEyePath
      
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
      _rightEyeLayer.addAnimation(animationGroup, forKey: "blinkRightEye")
   }
   
   
   internal func animateHappyMouthShrink()
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
   
   internal func animateHappyMouthGrow()
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
   
   internal func animateWorriedMouthShrink()
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
   
   internal override func animationDidStop(anim: CAAnimation, finished flag: Bool)
   {
      self._currentlyAnimating = false
   }
   
   internal func performBlockWithoutAnimations(block: (() -> Void))
   {
      CATransaction.begin()
      CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
      block()
      CATransaction.commit()
   }
}