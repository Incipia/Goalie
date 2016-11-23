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

let _defaultHeaderHeight: CGFloat = floor(UIScreen.main.bounds.height / 3.0)
let _minimumHeaderHeight: CGFloat = floor(UIScreen.main.bounds.height / 5.1)
let _maximumHeaderHeight: CGFloat = _defaultHeaderHeight + 50

private extension GoalieCharacter
{
   var next: GoalieCharacter {
      switch self {
      case .goalie: return .bizeeBee
      case .bizeeBee: return .fox
      case .fox: return .checklistor
      case .checklistor: return .goalie
      case .unknown: return .goalie
      }
   }
}

class GoalieTableView: LPRTableView
{
   @IBOutlet fileprivate var _firstTaskFooterViewArrow: UIImageView!
   @IBOutlet fileprivate var _firstTaskFooterView: UIView!
   @IBOutlet fileprivate var _normalGoalieFooterView: UIView!
   @IBOutlet fileprivate weak var _accessoryContainer: UIView!
   @IBOutlet fileprivate var _goalieHeaderView: UIView!
   
   fileprivate var _speechBubbleTimer: Timer?
   
   
   fileprivate var _goalieMovementAnimator: GoalieMovementAnimator!
   
   @IBOutlet fileprivate weak var _goalieFaceContainerView: UIView! {
      didSet {
         _goalieMovementAnimator = GoalieMovementAnimator(view: _goalieFaceContainerView)
      }
   }
   
   @IBOutlet fileprivate weak var _goalieFaceView: CharacterView!
   @IBOutlet fileprivate weak var _rightSpeechBubble: GoalieSpeechBubble!
   @IBOutlet fileprivate weak var _leftSpeechBubble: GoalieSpeechBubble! {
      didSet {
         _leftSpeechBubble.tailDirection = .right
      }
   }
   
   @IBOutlet fileprivate weak var _settingsButton: UIButton!
   
   // For testing
   @IBAction fileprivate func _swap()
   {
      let newCharacter = _goalieFaceView.character.next
      
      _goalieFaceView.updateCharacter(newCharacter)
      _goalieFaceView.animateFace()
   }
   
   fileprivate var _shouldShowSpeechBubble = false
   fileprivate var _currentPriority = TaskPriority.unknown
   
   weak var konamiDelegate: KonamiDelegate?
   
   fileprivate let _tapGestureRecognizer = UITapGestureRecognizer()
   
   // MARK: - Lifecycle
   deinit {
      NotificationCenter.default.removeObserver(self)
   }
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      _setupHeaderView()
      _setupContentOffsetAndInset()
      _setupUIForFirstTime()
      _setupKeyboardObserving()
      
      decelerationRate = UIScrollViewDecelerationRateFast
      _tapGestureRecognizer.addTarget(self, action: #selector(GoalieTableView.goalieTapped))
      _goalieFaceView.addGestureRecognizer(_tapGestureRecognizer)
      
      _goalieFaceView.updateCharacter(.goalie)
      
      let recognizer = PlopixKonamiGesture(target: self, action: #selector(GoalieTableView._konamiRecognized(_:)))
      recognizer.cancelsTouchesInView = false
      _accessoryContainer.addGestureRecognizer(recognizer)
   }
   
   internal func _konamiRecognized(_ recognizer: UIGestureRecognizer)
   {
      if recognizer.state == .ended {
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
   
   func updateCharacter(_ character: GoalieCharacter)
   {
      _goalieFaceView.updateCharacter(character)
      _goalieFaceView.animateFace()
   }
   
   // MARK: - Setup
   fileprivate func _setupKeyboardObserving()
   {
      NotificationCenter.default.addObserver(self, selector: #selector(GoalieTableView.keyboardWillAppear), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(GoalieTableView.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
   }
   
   fileprivate func _setupHeaderView()
   {
      tableHeaderView = nil
      superview?.addSubview(_goalieHeaderView)
   }
   
   fileprivate func _setupContentOffsetAndInset()
   {
      contentInset = UIEdgeInsets(top: _defaultHeaderHeight, left: 0, bottom: 20, right: 0)
      contentOffset = CGPoint(x: 0, y: -_defaultHeaderHeight)
   }
   
   fileprivate func _setupUIForFirstTime()
   {
      // Needs refactor
      let priority = TaskPriority.unknown
      let character = CharacterManager.currentCharacter
      
      let text = SpeechBubbleTextProvider.textForCharacter(character, priority: priority)
      _leftSpeechBubble.updateWithText(text, priority: priority)
      _rightSpeechBubble.updateWithText(text, priority: priority)
      _goalieHeaderView.backgroundColor = UIColor.goalieHeaderBackgroundColor(priority)
      
      let newAnchorPoint = CGPoint(x: 0.5, y: 1)
//      _goalieFaceView.adjustAnchorPoint(newAnchorPoint)
//      _leftSpeechBubble.adjustAnchorPoint(newAnchorPoint)
//      _rightSpeechBubble.adjustAnchorPoint(newAnchorPoint)
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
   
   func taskCellForIndexPath(_ indexPath: IndexPath) -> TasksTableViewCell?
   {
      return cellForRow(at: indexPath) as? TasksTableViewCell
   }
   
   func updateWithPriority(_ priority: TaskPriority)
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
   
   func updateFooterViewForKeyboardVisibility(_ visible: Bool)
   {
      _firstTaskFooterViewArrow.isHidden = visible
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
   fileprivate func _showOnlyLeftOrRightSpeechBubble()
   {
      let oneOrZero = Int.randRange(0, upper: 1)
      if oneOrZero == 0 {
         if _leftSpeechBubble.isHidden == true {
            _animateViewIn(_leftSpeechBubble, completion: nil)
            _rightSpeechBubble.isHidden = true
         }
      }
      else {
         if _rightSpeechBubble.isHidden == true {
            _animateViewIn(_rightSpeechBubble, completion: nil)
            _leftSpeechBubble.isHidden = true
         }
      }
   }
   
   fileprivate func _animateViewIn(_ viewToAnimate: UIView, completion: (() -> Void)?)
   {
      viewToAnimate.isHidden = false
      viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
      UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [], animations: { () -> Void in
         viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
         }) { (finished) -> Void in
            completion?()
      }
   }
   
   fileprivate func _animateViewOut(_ viewToAnimate: UIView)
   {
      UIView.animate(withDuration: 0.3, animations: { () -> Void in
         viewToAnimate.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
         }, completion: { (finished) -> Void in
            viewToAnimate.isHidden = true
      }) 
   }
   
   fileprivate func _updateHeaderViewColor(_ color: UIColor, animationDuration: Double)
   {
      UIView.animate(withDuration: animationDuration, animations: { () -> Void in
         self._goalieHeaderView.backgroundColor = color
      }) 
   }
   
   func updateHeaderViewFrameAnimated()
   {
      UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: { () -> Void in
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
   
   fileprivate func _updateAccessoryViewAlpha()
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
   
   fileprivate func _updateAccessoryViewScale()
   {
      if contentOffset.y >= -_maximumHeaderHeight && contentOffset.y <= -_defaultHeaderHeight {
         let alphaPercentage = (contentOffset.y + _defaultHeaderHeight) / (_maximumHeaderHeight - _defaultHeaderHeight) * -0.4
         _accessoryContainer.transform = CGAffineTransform(scaleX: 1 + alphaPercentage * 0.5, y: 1 + alphaPercentage)
      }
   }
   
   fileprivate func _updateHeaderViewFrame()
   {
      let headerHeight = _headerHeightForContentOffset(contentOffset)
      let size = CGSize(width: bounds.width, height: headerHeight)
      _goalieHeaderView.frame = CGRect(origin: CGPoint.zero, size: size)
      _goalieHeaderView.layoutIfNeeded()
   }
   
   fileprivate func _headerHeightForContentOffset(_ offset: CGPoint) -> CGFloat
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
   fileprivate func _startTimerForSpeechBubble()
   {
      guard _speechBubbleTimer == nil else {return}
      
      _speechBubbleTimer = Timer(fireAt: Date().addingTimeInterval(10), interval: 0, target: self, selector: #selector(GoalieTableView._hideSpeechBubble(_:)), userInfo: nil, repeats: false)
      RunLoop.main.add(_speechBubbleTimer!, forMode: RunLoopMode.defaultRunLoopMode)
   }
   
   fileprivate func _killSpeechBubbleTimer()
   {
      _speechBubbleTimer?.invalidate()
      _speechBubbleTimer = nil
   }
   
   
   internal func _hideSpeechBubble(_ timer: Timer)
   {
      _killSpeechBubbleTimer()
      hideSpeechBubble()
   }
}
