//
//  GoalieHeaderView.swift
//  Goalie
//
//  Created by Gregory Klein on 1/8/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class GoalieHeaderView: UIView, ViewTransformerDelegate
{
   private var _shouldTransform = false
   private var _viewTransformer: ViewTransformer?
   private var _leftSpeechBubbleTransformer: ViewTransformer?
   private var _rightSpeechBubbleTransformer: ViewTransformer?
   
   private var _viewTransformers: [ViewTransformer] = []
   private var _movementAnimationLayer: MovementAnimatorLayer!
   
   var goalieFaceView: GoalieFaceView! {
      didSet {
         _viewTransformer = ViewTransformer(view: goalieFaceView)
         _viewTransformer?.delegate = self
         _viewTransformers.append(_viewTransformer!)
      }
   }
   
   var leftSpeechBubble: GoalieSpeechBubble! {
      didSet {
         _leftSpeechBubbleTransformer = ViewTransformer(view: leftSpeechBubble)
         _leftSpeechBubbleTransformer?.delegate = self
         _viewTransformers.append(_leftSpeechBubbleTransformer!)
      }
   }
   
   var rightSpeechBubble: GoalieSpeechBubble! {
      didSet {
         _rightSpeechBubbleTransformer = ViewTransformer(view: rightSpeechBubble)
         _rightSpeechBubbleTransformer?.delegate = self
         _viewTransformers.append(_rightSpeechBubbleTransformer!)
      }
   }
   
   var centerY: CGFloat {
      return center.y
   }
   
   override func awakeFromNib()
   {   
      super.awakeFromNib()

//      _movementAnimationLayer = MovementAnimatorLayer(viewTransformers: _viewTransformers)
//      _movementAnimationLayer.animationFinishedBlock = {
//         
//         dispatch_async(dispatch_get_main_queue(), { () -> Void in            
//            self._viewTransformer?.resetViewWithDuration(0.8, completion: nil)
//            self._leftSpeechBubbleTransformer?.resetViewWithDuration(0.8, completion: nil)
//            self._rightSpeechBubbleTransformer?.resetViewWithDuration(0.8) { (finished: Bool) in
//               self.animate()
//            }
//         })
//         
//         self._performBlockWithoutAnimations({ () -> Void in
//            self._movementAnimationLayer.progress = 0
//         })
//      }
//      
//      layer.addSublayer(_movementAnimationLayer!)
   }
   
   override func layoutSubviews() {
      super.layoutSubviews()
      _viewTransformer?.maxY = frame.maxY
      _leftSpeechBubbleTransformer?.maxY = frame.maxY
      _rightSpeechBubbleTransformer?.maxY = frame.maxY
   }
   
   private func _performBlockWithoutAnimations(block: (() -> Void))
   {
      CATransaction.begin()
      CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
      block()
      CATransaction.commit()
   }
   
   override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
   {
      super.touchesBegan(touches, withEvent: event)
      
      _viewTransformer?.maxY = frame.maxY
      _leftSpeechBubbleTransformer?.maxY = frame.maxY
      _rightSpeechBubbleTransformer?.maxY = frame.maxY
      
      if goalieFaceView.frame.contains(touches.first!.locationInView(self)) {
         _shouldTransform = true
         _viewTransformer?.touchesBegan(touches)
         _leftSpeechBubbleTransformer?.touchesBegan(touches)
         _rightSpeechBubbleTransformer?.touchesBegan(touches)
      }
      else {
         _shouldTransform = false
      }
   }
   
   @IBAction private func animate()
   {
      UIView.animateWithDuration(0.8, delay: 0, options: [], animations: { () -> Void in
         self.goalieFaceView.transform = CGAffineTransformMakeScale(0.5, 0.5)
         
         }) { (finished) -> Void in
            
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
               
               self.goalieFaceView.transform = CGAffineTransformIdentity
               }, completion: nil)
      }
   }
   
   override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
   {
      super.touchesMoved(touches, withEvent: event)
      
      if _shouldTransform {
         _viewTransformer?.touchesMoved(touches)
         _leftSpeechBubbleTransformer?.touchesMoved(touches)
         _rightSpeechBubbleTransformer?.touchesMoved(touches)
      }
   }
   
   override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)
   {
      super.touchesEnded(touches, withEvent: event)
      
      if _shouldTransform {
         _viewTransformer?.resetViewWithDuration(0.3, completion: nil)
         _leftSpeechBubbleTransformer?.resetViewWithDuration(0.3, completion: nil)
         _rightSpeechBubbleTransformer?.resetViewWithDuration(0.3, completion: nil)
      }
      _shouldTransform = false
   }
}