//
//  GoalieTableView.swift
//  Goalie
//
//  Created by Gregory Klein on 12/28/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

let _defaultHeaderHeight: CGFloat = floor(UIScreen.mainScreen().bounds.height / 3.0)
let _minimumHeaderHeight: CGFloat = floor(UIScreen.mainScreen().bounds.height / 5.1)
let _maximumHeaderHeight: CGFloat = _defaultHeaderHeight + 50

class GoalieTableView: TPKeyboardAvoidingTableView
{
   @IBOutlet private var _firstTaskFooterViewArrow: UIImageView!
   @IBOutlet private var _firstTaskFooterView: UIView!
   @IBOutlet private var _normalGoalieFooterView: UIView!
   
   @IBOutlet private var _currentCompletedSoundName: GoalieKerningLabel!
   @IBAction private func _advanceCompletedSound()
   {
      SFXPlayer.advanceCompletedSound()
      SFXPlayer.playCurrentCompletedSound()
      _currentCompletedSoundName.updateText(SFXPlayer.currentCompletedSoundName()!, color: UIColor.whiteColor())
   }
   @IBAction private func _decrementCompletedSound()
   {
      SFXPlayer.decrementCompletedSound()
      SFXPlayer.playCurrentCompletedSound()
      _currentCompletedSoundName.updateText(SFXPlayer.currentCompletedSoundName()!, color: UIColor.whiteColor())
   }
   
   @IBOutlet private var _goalieHeaderView: UIView!
   
   private var _goalieMovementAnimator: GoalieMovementAnimator!
   @IBOutlet private weak var _goalieFaceView: CharacterView! {
      didSet {
         _goalieMovementAnimator = GoalieMovementAnimator(view: _goalieFaceView)
      }
   }
   
   @IBOutlet private weak var _rightSpeechBubble: GoalieSpeechBubble!
   @IBOutlet private weak var _leftSpeechBubble: GoalieSpeechBubble! {
      didSet {
         _leftSpeechBubble.tailDirection = .Right
      }
   }
   
   @IBOutlet private weak var _settingsButton: UIButton!
   
//   private var _currentCharacter: GoalieCharacter = .Unknown
//   @IBAction private func _swap()
//   {
//      if _currentCharacter == .Goalie {
//         _currentCharacter = .Unknown
//      } else {
//         _currentCharacter = .Goalie
//      }
//      _goalieFaceView.updateCharacter(_currentCharacter)
//   }
   
   private var _shouldShowSpeechBubble = false
   private var _currentPriority = TaskPriority.Unknown
   
   deinit {
      NSNotificationCenter.defaultCenter().removeObserver(self)
   }
   
   // MARK: - Lifecycle
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      _setupHeaderView()
      _setupContentOffsetAndInset()
      _setupUIForFirstTime()
      _currentCompletedSoundName.text = SFXPlayer.currentCompletedSoundName()
      
      _leftSpeechBubble.hidden = true
      _rightSpeechBubble.hidden = true
      
      _setupKeyboardObserving()
      
      let newAnchorPoint = CGPoint(x: 0.5, y: 1)
      _goalieFaceView.adjustAnchorPoint(newAnchorPoint)
      _leftSpeechBubble.adjustAnchorPoint(newAnchorPoint)
      _rightSpeechBubble.adjustAnchorPoint(newAnchorPoint)
   }
   
   // MARK: - Setup
   private func _setupKeyboardObserving()
   {
      NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillAppear"), name: UIKeyboardWillShowNotification, object: nil)
      NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide"), name: UIKeyboardWillHideNotification, object: nil)
   }
   
   private func _setupHeaderView()
   {
      tableHeaderView = nil
      superview?.addSubview(_goalieHeaderView)
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
      tableFooterView = GoalieSettingsManager.userCreatedFirstTask ? _normalGoalieFooterView : _firstTaskFooterView
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
      guard _currentPriority != priority else {return}
      
      _currentPriority = priority
      _goalieFaceView.updateWithPriority(priority)
      
      let text = SpeechBubbleTextProvider.textForPriority(priority)
      _leftSpeechBubble.updateWithText(text, priority: priority)
      _rightSpeechBubble.updateWithText(text, priority: priority)
      
      let color = UIColor.goalieHeaderBackgroundColor(priority)
      _updateHeaderViewColor(color, animationDuration: 0.3)
      
      if _shouldShowSpeechBubble {
         _showOnlyLeftOrRightSpeechBubble()
      }
   }
   
   func showSpeechBubble()
   {
      _shouldShowSpeechBubble = true
      
      let text = SpeechBubbleTextProvider.textForPriority(_currentPriority)
      _leftSpeechBubble.updateWithText(text, priority: _currentPriority)
      _rightSpeechBubble.updateWithText(text, priority: _currentPriority)
      _showOnlyLeftOrRightSpeechBubble()
   }
   
   func hideSpeechBubble()
   {
      _shouldShowSpeechBubble = false
      _animateViewOut(_leftSpeechBubble)
      _animateViewOut(_rightSpeechBubble)
   }
   
   func animateGoalie()
   {
      _goalieFaceView.animateFace()
   }
   
   func startGoalieMovement()
   {
      _goalieMovementAnimator.startAnimating()
   }
   
   func stopGoalieMovement()
   {
      _goalieMovementAnimator.stopAnimating()
   }
   
   func updateFooterViewForKeyboardVisibility(visible: Bool)
   {
      _firstTaskFooterViewArrow.hidden = visible
   }
   
   // MARK: - Keyboard Observing
   func keyboardWillAppear()
   {
      updateFooterViewForKeyboardVisibility(true)
   }
   
   func keyboardWillHide()
   {
      updateFooterViewForKeyboardVisibility(false)
   }
}

extension GoalieTableView
{
   // MARK: - Private
   private func _showOnlyLeftOrRightSpeechBubble()
   {
      // The magic '12' is to account for the padding on the sides of the speech bubble
      let rightSpeechBubbleMaxX = _rightSpeechBubble.frame.origin.x + _rightSpeechBubble.actualWidth - 12
      let shouldShowLeft = _settingsButton.frame.minX < rightSpeechBubbleMaxX
      let oneOrZero = Int.randRange(0, upper: 1)
      
      if oneOrZero == 0 || shouldShowLeft {
         if _leftSpeechBubble.hidden == true {
            _animateViewIn(_leftSpeechBubble, completion: nil)
            _rightSpeechBubble.hidden = true
         }
      }
      else {
         if _rightSpeechBubble.hidden == true {
            _animateViewIn(_rightSpeechBubble, completion: nil)
            _leftSpeechBubble.hidden = true
         }
      }
   }
   
   private func _animateViewIn(viewToAnimate: UIView, completion: (() -> Void)?)
   {
      viewToAnimate.hidden = false
      viewToAnimate.transform = CGAffineTransformMakeScale(0, 0)
      UIView.animateWithDuration(0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [], animations: { () -> Void in
         viewToAnimate.transform = CGAffineTransformMakeScale(1, 1)
         }) { (finished) -> Void in
            completion?()
      }
   }
   
   private func _animateViewOut(viewToAnimate: UIView)
   {
      UIView.animateWithDuration(0.3, animations: { () -> Void in
         viewToAnimate.transform = CGAffineTransformMakeScale(0.01, 0.01)
         }) { (finished) -> Void in
            viewToAnimate.hidden = true
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
   
   override func layoutSubviews()
   {
      super.layoutSubviews()
      _updateHeaderViewFrame()
      
      // prevent scrolling past bottom
      if contentOffset.y < -_maximumHeaderHeight {
         contentOffset = CGPoint(x: 0, y: -_maximumHeaderHeight)
      }
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
