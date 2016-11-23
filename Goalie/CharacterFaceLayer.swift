//
//  CharacterFaceLayer.swift
//  Goalie
//
//  Created by Gregory Klein on 2/9/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class CharacterFaceLayer: CALayer, CAAnimationDelegate
{
   var backingContainerLayer: CALayer?
   
   internal var _currentPriority: TaskPriority = .unknown
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
      
      _mouthLayer.fillColor = UIColor.white.cgColor
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
   
   override init(layer: Any)
   {
      super.init(layer: layer)
      commonInit()
   }
   
   func updateWithPriority(_ priority: TaskPriority)
   {
      _currentPriority = priority
      
      performBlockWithoutAnimations { () -> Void in
         self._currentlyAnimating = false
         for layer in self._shapeLayers {
            layer.removeAllAnimations()
         }
      }
      
      let eyeColor = UIColor.eyeColorForPriority(priority)
      _leftEyeLayer.fillColor = eyeColor.cgColor
      _rightEyeLayer.fillColor = eyeColor.cgColor
      
      _leftEyeLayer.path = priority == .asap ? _pathProvider.angryLeftEyePath : _pathProvider.normalLeftEyePath
      _rightEyeLayer.path = priority == .asap ? _pathProvider.angryRightEyePath : _pathProvider.normalRightEyePath
      
      _mouthLayer.path = _pathProvider.mouthPathForPriority(priority)
      
      performBlockWithoutAnimations { () -> Void in
         switch priority
         {
         case .unknown:
            self._leftEyeLayer.isHidden = true
            self._rightEyeLayer.isHidden = true
            self._mouthLayer.isHidden = true
            break
         case .ages:
            self._leftEyeLayer.isHidden = true
            self._rightEyeLayer.isHidden = true
            self._mouthLayer.isHidden = false
            break
         case .soon, .later:
            self._leftEyeLayer.isHidden = false
            self._rightEyeLayer.isHidden = false
            self._mouthLayer.isHidden = false
            break
         case .asap:
            self._leftEyeLayer.isHidden = false
            self._rightEyeLayer.isHidden = false
            self._mouthLayer.isHidden = false
            break
         }
      }
   }
   
   func animateForPriority(_ priority: TaskPriority)
   {
      if _currentlyAnimating == false {
         _currentlyAnimating = true
         switch priority
         {
         case .ages:
            animateHappyMouthGrow()
         case .later:
            if Int.randRange(0, upper: 1) == 0 {
               happyWinkEye()
            }
            else {
               happySquint()
            }
         case .soon:
            surprise()
            animateWorriedMouthShrink()
         case .asap:
            angryBlink()
         case .unknown:
            _currentlyAnimating = false
         }
      }
   }
   
   func reset()
   {
      performBlockWithoutAnimations { () -> Void in
         self.removeAllAnimations()
         for layer in self._shapeLayers {
            layer.removeAllAnimations()
            layer.removeFromSuperlayer()
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
   
   fileprivate func _animateLeftEyeWithPath(_ path: CGPath)
   {
      let startingPath = _currentPriority == .asap ? _pathProvider.angryLeftEyePath : _pathProvider.normalLeftEyePath
      
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
      _leftEyeLayer.add(animationGroup, forKey: "blinkLeftEye")
   }
   
   fileprivate func _animateRightEyeWithPath(_ path: CGPath)
   {
      let startingPath = _currentPriority == .asap ? _pathProvider.angryRightEyePath : _pathProvider.normalRightEyePath
      
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
      _rightEyeLayer.add(animationGroup, forKey: "blinkRightEye")
   }
   
   
   internal func animateHappyMouthShrink()
   {
      let animationGroup = CAAnimationGroup()
      animationGroup.duration = 1
      
      let closeEyeAnimation = CABasicAnimation(keyPath: "path")
      closeEyeAnimation.duration = 0.2
      closeEyeAnimation.fillMode = kCAFillModeForwards
      closeEyeAnimation.isRemovedOnCompletion = false
      closeEyeAnimation.toValue = _pathProvider.smallHappyMouthPath
      
      let openEyeAnimation = CABasicAnimation(keyPath: "path")
      openEyeAnimation.beginTime = 0.9
      openEyeAnimation.duration = 0.1
      openEyeAnimation.fillMode = kCAFillModeForwards
      openEyeAnimation.isRemovedOnCompletion = false
      openEyeAnimation.toValue = _pathProvider.happyMouthPath
      
      animationGroup.animations = [closeEyeAnimation, openEyeAnimation]
      animationGroup.delegate = self
      _mouthLayer.add(animationGroup, forKey: "shrinkMouth")
   }
   
   internal func animateHappyMouthGrow()
   {
      let animationGroup = CAAnimationGroup()
      animationGroup.duration = 1
      
      let closeEyeAnimation = CABasicAnimation(keyPath: "path")
      closeEyeAnimation.duration = 0.2
      closeEyeAnimation.fillMode = kCAFillModeForwards
      closeEyeAnimation.isRemovedOnCompletion = false
      closeEyeAnimation.toValue = _pathProvider.bigHappyMouthPath
      
      let openEyeAnimation = CABasicAnimation(keyPath: "path")
      openEyeAnimation.beginTime = 0.9
      openEyeAnimation.duration = 0.1
      openEyeAnimation.fillMode = kCAFillModeForwards
      openEyeAnimation.isRemovedOnCompletion = false
      openEyeAnimation.toValue = _pathProvider.happyMouthPath
      
      animationGroup.animations = [closeEyeAnimation, openEyeAnimation]
      animationGroup.delegate = self
      _mouthLayer.add(animationGroup, forKey: "growMouth")
   }
   
   internal func animateWorriedMouthShrink()
   {
      let animationGroup = CAAnimationGroup()
      animationGroup.duration = 1
      
      let closeEyeAnimation = CABasicAnimation(keyPath: "path")
      closeEyeAnimation.duration = 0.2
      closeEyeAnimation.fillMode = kCAFillModeForwards
      closeEyeAnimation.isRemovedOnCompletion = false
      closeEyeAnimation.toValue = _pathProvider.flatScaredMouthPath
      
      let openEyeAnimation = CABasicAnimation(keyPath: "path")
      openEyeAnimation.beginTime = 0.9
      openEyeAnimation.duration = 0.1
      openEyeAnimation.fillMode = kCAFillModeForwards
      openEyeAnimation.isRemovedOnCompletion = false
      openEyeAnimation.toValue = _pathProvider.scaredMouthPath
      
      animationGroup.animations = [closeEyeAnimation, openEyeAnimation]
      animationGroup.delegate = self
      _mouthLayer.add(animationGroup, forKey: "scaredMouthShrink")
   }
   
   func animationDidStop(_ anim: CAAnimation, finished flag: Bool)
   {
      self._currentlyAnimating = false
   }
   
   internal func performBlockWithoutAnimations(_ block: (() -> Void))
   {
      CATransaction.begin()
      CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
      block()
      CATransaction.commit()
   }
}
