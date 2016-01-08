//
//  GoalieTableView.swift
//  Goalie
//
//  Created by Gregory Klein on 12/28/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

let _defaultHeaderHeight: CGFloat = floor(UIScreen.mainScreen().bounds.height / 3.0)
let _minimumHeaderHeight: CGFloat = floor(UIScreen.mainScreen().bounds.height / 5.0)

class GoalieHeaderView: UIView
{
   private var _shouldTransform = false
   private var _viewTransformer: ViewTransformer?
   private var _leftSpeechBubbleTransformer: ViewTransformer?
   private var _rightSpeechBubbleTransformer: ViewTransformer?
   
   var goalieFaceView: GoalieFaceView! {
      didSet {
         _viewTransformer = ViewTransformer(view: goalieFaceView)
         _viewTransformer?.takeItEasy = true
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

class GoalieTableView: TPKeyboardAvoidingTableView
{
   @IBOutlet private var _goalieHeaderView: GoalieHeaderView!
   private var _goalieFooterView: UIView!
   
   @IBOutlet private weak var _goalieFaceView: GoalieFaceView!
   @IBOutlet private weak var _leftSpeechBubble: GoalieSpeechBubble! {
      didSet {
         _leftSpeechBubble.tailDirection = .Right
      }
   }
   @IBOutlet private weak var _rightSpeechBubble: GoalieSpeechBubble!
   @IBOutlet private weak var _settingsButton: UIButton!
   
   private var _currentPriority = TaskPriority.Unknown
   
   // MARK: - Lifecycle
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      _setupHeaderView()
      _setupContentOffsetAndInset()
      _setupUIForFirstTime()
      _hideLeftOrRightSpeechBubble()
      
      _goalieFooterView = tableFooterView
   }
   
   override func layoutSubviews()
   {
      super.layoutSubviews()
      _updateHeaderViewFrame()
      
      // prevent scrolling past bottom
      if contentOffset.y < -_defaultHeaderHeight {
         contentOffset = CGPoint(x: 0, y: -_defaultHeaderHeight)
      }
   }
   
   // MARK: - Setup
   private func _setupHeaderView()
   {
      tableHeaderView = nil
      superview?.addSubview(_goalieHeaderView)
      
      _goalieHeaderView.goalieFaceView = _goalieFaceView
      _goalieHeaderView.leftSpeechBubble = _leftSpeechBubble
      _goalieHeaderView.rightSpeechBubble = _rightSpeechBubble
   }
   
   private func _setupContentOffsetAndInset()
   {
      contentInset = UIEdgeInsets(top: _defaultHeaderHeight, left: 0, bottom: 20, right: 0)
      contentOffset = CGPoint(x: 0, y: -_defaultHeaderHeight)
   }
   
   private func _setupUIForFirstTime()
   {
      let priority = TaskPriority.Unknown
      let text = SpeechBubbleTextProvider.textForPriority(priority)
      _leftSpeechBubble.updateWithText(text, priority: priority)
      _rightSpeechBubble.updateWithText(text, priority: priority)
      _goalieHeaderView.backgroundColor = UIColor.goalieHeaderBackgroundColor(priority)
   }
   
   // MARK: - Public
   func showFooterView()
   {
      tableFooterView = _goalieFooterView
   }
   
   func hideFooterView()
   {
      tableFooterView = UIView()
   }
   
   func taskCellForIndexPath(indexPath: NSIndexPath) -> TasksTableViewCell?
   {
      return cellForRowAtIndexPath(indexPath) as? TasksTableViewCell
   }
   
   func updateWithPriority(priority: TaskPriority)
   {
      if _currentPriority != priority
      {
         _currentPriority = priority
         _goalieFaceView.updateWithPriority(priority)
         
         let text = SpeechBubbleTextProvider.textForPriority(priority)
         _leftSpeechBubble.updateWithText(text, priority: priority)
         _rightSpeechBubble.updateWithText(text, priority: priority)
         
         let color = UIColor.goalieHeaderBackgroundColor(priority)
         _updateHeaderViewColor(color, animationDuration: 0.3)
         
         _hideLeftOrRightSpeechBubble()
      }
   }
   
   // MARK: - Private
   private func _hideLeftOrRightSpeechBubble()
   {
      // The magic '12' is to account for the padding on the sides of the speech bubble
      let rightSpeechBubbleMaxX = _rightSpeechBubble.frame.origin.x + _rightSpeechBubble.actualWidth - 12
      let shouldShowLeft = _settingsButton.frame.minX < rightSpeechBubbleMaxX
      let oneOrZero = Int.randRange(0, upper: 1)
      
      if oneOrZero == 0 || shouldShowLeft {
         _leftSpeechBubble.hidden = false
         _rightSpeechBubble.hidden = true
      }
      else {
         _leftSpeechBubble.hidden = true
         _rightSpeechBubble.hidden = false
      }
   }
   
   private func _updateHeaderViewColor(color: UIColor, animationDuration: Double)
   {
      UIView.animateWithDuration(animationDuration) { () -> Void in
         self._goalieHeaderView.backgroundColor = color
      }
   }
   
   func updateHeaderViewFrameAnimated()
   {
      UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
         self._updateHeaderViewFrame()
         }, completion: nil)
   }
   
   private func _updateHeaderViewFrame()
   {
      let headerHeight = _headerHeightForContentOffset(contentOffset)
      let size = CGSize(width: bounds.width, height: headerHeight)
      _goalieHeaderView.frame = CGRect(origin: CGPoint.zero, size: size)
      _goalieHeaderView.layoutIfNeeded()
   }
   
   private func _headerHeightForContentOffset(offset: CGPoint) -> CGFloat
   {
      var height = _defaultHeaderHeight
      if offset.y < -_defaultHeaderHeight {
         height = -contentOffset.y
      }
      else if contentOffset.y > -_defaultHeaderHeight {
         let heightSubtraction = _defaultHeaderHeight - abs(contentOffset.y)
         let newHeaderHeight = _defaultHeaderHeight - heightSubtraction
         
         height = max(_minimumHeaderHeight, newHeaderHeight)
         if contentOffset.y > 0 && newHeaderHeight > _minimumHeaderHeight {
            height = _minimumHeaderHeight
         }
         else {
            height = max(_minimumHeaderHeight, newHeaderHeight)
         }
      }
      return height
   }
}
