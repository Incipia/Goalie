//
//  GoalieMovementAnimator.swift
//  Goalie
//
//  Created by Gregory Klein on 1/11/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit


class MovementAnimatorLayer: CALayer
{
   private var _viewTransformers: [ViewTransformer] = []
   @NSManaged var progress: Int
   private var _resetting = false
   
   var animationFinishedBlock: (() -> Void)?
   
   var pLayer: MovementAnimatorLayer {
      return presentationLayer() as! MovementAnimatorLayer
   }
   
   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
   }
   
   override init(layer: AnyObject) {
      super.init(layer: layer)
   }
   
   override init() {
      super.init()
   }
   
   convenience init(viewTransformers: [ViewTransformer])
   {
      self.init()
      progress = 0
      _viewTransformers = viewTransformers
   }
   
   override class func needsDisplayForKey(key: String) -> Bool
   {
      if key == "progress" {
         return true
      }
      return super.needsDisplayForKey(key)
   }
   
   override func actionForKey(event: String) -> CAAction?
   {
      if event == "progress"
      {
         let animation = CABasicAnimation(keyPath: event)
         animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
         animation.fromValue = pLayer.progress
         animation.duration = 15
         animation.delegate = self
         return animation
      }
      return super.actionForKey(event)
   }
   
   override func display()
   {
      let index = pLayer.progress
      for transformer in _viewTransformers {
         transformer.advanceWithPoint(testPoints[index])
      }
   }
   
   func startAnimation()
   {
      progress = testPoints.count - 1
      setValue(testPoints.count - 1, forKey: "progress")
      
      for transfomer in _viewTransformers {
         transfomer.startWithPoint(testPoints[0])
      }
   }
   
   override func animationDidStop(anim: CAAnimation, finished flag: Bool)
   {
      animationFinishedBlock?()
   }
}
