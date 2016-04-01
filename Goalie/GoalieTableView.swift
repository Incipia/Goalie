//
//  GoalieTableView.swift
//  Goalie
//
//  Created by Gregory Klein on 12/28/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

protocol KonamiDelegate: class
{
   func konamiRecognized()
}

let _defaultHeaderHeight: CGFloat = floor(UIScreen.mainScreen().bounds.height / 3.0)
let _minimumHeaderHeight: CGFloat = floor(UIScreen.mainScreen().bounds.height / 5.1)
let _maximumHeaderHeight: CGFloat = _defaultHeaderHeight + 50

private extension GoalieCharacter
{
   var next: GoalieCharacter {
      switch self {
      case .Goalie: return .BizeeBee
      case .BizeeBee: return .Fox
      case .Fox: return .Checklistor
      case .Checklistor: return Goalie
      case .Unknown: return .Goalie
      }
   }
}

class GoalieTableView: LPRTableView
{
   @IBOutlet private var _firstTaskFooterViewArrow: UIImageView!
   @IBOutlet private var _firstTaskFooterView: UIView!
   @IBOutlet private var _normalGoalieFooterView: UIView!
   @IBOutlet private weak var _accessoryContainer: UIView!
   @IBOutlet private var _goalieHeaderView: UIView!
   
   private var _speechBubbleTimer: NSTimer?
   
   
   private var _goalieMovementAnimator: GoalieMovementAnimator!
   
   @IBOutlet private weak var _goalieFaceContainerView: UIView! {
      didSet {
         _goalieMovementAnimator = GoalieMovementAnimator(view: _goalieFaceContainerView)
      }
   }
   
   @IBOutlet private weak var _goalieFaceView: CharacterView!
   @IBOutlet private weak var _rightSpeechBubble: GoalieSpeechBubble!
   @IBOutlet private weak var _leftSpeechBubble: GoalieSpeechBubble! {
      didSet {
         _leftSpeechBubble.tailDirection = .Right
      }
   }
   
   @IBOutlet private weak var _settingsButton: UIButton!
   
   // For testing
   @IBAction private func _swap()
   {
      let newCharacter = _goalieFaceView.character.next
      
      _goalieFaceView.updateCharacter(newCharacter)
      _goalieFaceView.animateFace()
   }
   
   private var _shouldShowSpeechBubble = false
   private var _currentPriority = TaskPriority.Unknown
   
   weak var konamiDelegate: KonamiDelegate?
   
   private let _tapGestureRecognizer = UITapGestureRecognizer()
   
   // MARK: - Lifecycle
   deinit {
      NSNotificationCenter.defaultCenter().removeObserver(self)
   }
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      _setupHeaderView()
      _setupContentOffsetAndInset()
      _setupUIForFirstTime()
      _setupKeyboardObserving()
      
      decelerationRate = UIScrollViewDecelerationRateFast
      _tapGestureRecognizer.addTarget(self, action: "goalieTapped")
      _goalieFaceView.addGestureRecognizer(_tapGestureRecognizer)
      
      _goalieFaceView.updateCharacter(.Goalie)
      
      let recognizer = PlopixKonamiGesture(target: self, action: "_konamiRecognized:")
      recognizer.cancelsTouchesInView = false
      _accessoryContainer.addGestureRecognizer(recognizer)
   }
   
   internal func _konamiRecognized(recognizer: UIGestureRecognizer)
   {
      if recognizer.state == .Ended {
         konamiDelegate?.konamiRecognized()
      }
   }
   
   func goalieTapped()
   {
      if _speechBubbleTimer == nil {
         _startTimerForSpeechBubble()
      }
      
      showSpeechBubble()
   }
   
   func updateCharacter(character: GoalieCharacter)
   {
      _goalieFaceView.updateCharacter(character)
      _goalieFaceView.animateFace()
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
      // Needs refactor
      let priority = TaskPriority.Unknown
      let character = CharacterManager.currentCharacter
      
      let text = SpeechBubbleTextProvider.textForCharacter(character, priority: priority)
      _leftSpeechBubble.updateWithText(text, priority: priority)
      _rightSpeechBubble.updateWithText(text, priority: priority)
      _goalieHeaderView.backgroundColor = UIColor.goalieHeaderBackgroundColor(priority)
      
      let newAnchorPoint = CGPoint(x: 0.5, y: 1)
      _goalieFaceView.adjustAnchorPoint(newAnchorPoint)
      _leftSpeechBubble.adjustAnchorPoint(newAnchorPoint)
      _rightSpeechBubble.adjustAnchorPoint(newAnchorPoint)
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
      _goalieFaceView.animateFace()
      
      let text = SpeechBubbleTextProvider.textForCharacter(CharacterManager.currentCharacter, priority: priority)
      _leftSpeechBubble.updateWithText(text, priority: priority)
      _rightSpeechBubble.updateWithText(text, priority: priority)
      
      let color = UIColor.goalieHeaderBackgroundColor(priority)
      _updateHeaderViewColor(color, animationDuration: 0)
      
      if _shouldShowSpeechBubble {
         _showOnlyLeftOrRightSpeechBubble()
      }
   }
   
   func showSpeechBubble()
   {
      _shouldShowSpeechBubble = true
      
      let text = SpeechBubbleTextProvider.textForCharacter(CharacterManager.currentCharacter, priority: _currentPriority)
      _leftSpeechBubble.updateWithText(text, priority: _currentPriority)
      _rightSpeechBubble.updateWithText(text, priority: _currentPriority)
      _showOnlyLeftOrRightSpeechBubble()
   }
   
   func hideSpeechBubble()
   {
      _shouldShowSpeechBubble = false
      _animateViewOut(_leftSpeechBubble)
      _animateViewOut(_rightSpeechBubble)
      
      _killSpeechBubbleTimer()
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
      let oneOrZero = Int.randRange(0, upper: 1)
      if oneOrZero == 0 {
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
      
      _updateAccessoryViewAlpha()
      _updateAccessoryViewScale()
      
      // only allow scrolling past bottom a certain amount
      if contentOffset.y < -_maximumHeaderHeight {
         contentOffset = CGPoint(x: 0, y: -_maximumHeaderHeight)
      }
   }
   
   private func _updateAccessoryViewAlpha()
   {
      let currentHeaderHeight = _goalieHeaderView.frame.height
      let difference = _defaultHeaderHeight - currentHeaderHeight
      var alpha: CGFloat = 1.0
      
      if difference > 1 {
         var percentage = difference / (_defaultHeaderHeight - _minimumHeaderHeight)
         if percentage < 0.02 {
            percentage = 0
         }
         
         alpha = 1 - percentage
      }
      
      _accessoryContainer.alpha = alpha
   }
   
   private func _updateAccessoryViewScale()
   {
      if contentOffset.y >= -_maximumHeaderHeight && contentOffset.y <= -_defaultHeaderHeight {
         let alphaPercentage = (contentOffset.y + _defaultHeaderHeight) / (_maximumHeaderHeight - _defaultHeaderHeight) * -0.4
         _accessoryContainer.transform = CGAffineTransformMakeScale(1 + alphaPercentage * 0.5, 1 + alphaPercentage)
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

extension GoalieTableView
{
   private func _startTimerForSpeechBubble()
   {
      guard _speechBubbleTimer == nil else {return}
      
      _speechBubbleTimer = NSTimer(fireDate: NSDate().dateByAddingTimeInterval(10), interval: 0, target: self, selector: "_hideSpeechBubble:", userInfo: nil, repeats: false)
      NSRunLoop.mainRunLoop().addTimer(_speechBubbleTimer!, forMode: NSDefaultRunLoopMode)
   }
   
   private func _killSpeechBubbleTimer()
   {
      _speechBubbleTimer?.invalidate()
      _speechBubbleTimer = nil
   }
   
   
   internal func _hideSpeechBubble(timer: NSTimer)
   {
      _killSpeechBubbleTimer()
      hideSpeechBubble()
   }
}
