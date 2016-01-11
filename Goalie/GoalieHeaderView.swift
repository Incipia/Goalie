//
//  GoalieHeaderView.swift
//  Goalie
//
//  Created by Gregory Klein on 1/8/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class GoalieHeaderView: UIView
{
   private var _shouldTransform = false
   private var _viewTransformer: ViewTransformer?
   private var _leftSpeechBubbleTransformer: ViewTransformer?
   private var _rightSpeechBubbleTransformer: ViewTransformer?
   
   var goalieFaceView: GoalieFaceView! {
      didSet {
         _viewTransformer = ViewTransformer(view: goalieFaceView)
      }
   }
   
   var leftSpeechBubble: GoalieSpeechBubble! {
      didSet {
         _leftSpeechBubbleTransformer = ViewTransformer(view: leftSpeechBubble)
         _leftSpeechBubbleTransformer?.takeItEasy = true
      }
   }
   
   var rightSpeechBubble: GoalieSpeechBubble! {
      didSet {
         _rightSpeechBubbleTransformer = ViewTransformer(view: rightSpeechBubble)
         _rightSpeechBubbleTransformer?.takeItEasy = true
      }
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
         _viewTransformer?.resetViewWithDuration(0.3)
         _leftSpeechBubbleTransformer?.resetViewWithDuration(0.3)
         _rightSpeechBubbleTransformer?.resetViewWithDuration(0.3)
      }
      _shouldTransform = false
   }
}