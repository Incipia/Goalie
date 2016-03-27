//
//  EditTaskViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 12/29/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit
import CoreData

class EditTaskViewController: UIViewController, ManagedObjectContextSettable, MenuController
{
   var moc: NSManagedObjectContext!
   
   @IBOutlet private weak var _titleTextField: JVFloatLabeledTextField!
   @IBOutlet private weak var _asapPriorityBlock: UIView!
   @IBOutlet private weak var _soonPriorityBlock: UIView!
   @IBOutlet private weak var _laterPriorityBlock: UIView!
   @IBOutlet private weak var _agesPriorityBlock: UIView!
   
   @IBOutlet private weak var _agesButton: GoalieKerningButton!
   @IBOutlet private weak var _laterButton: GoalieKerningButton!
   @IBOutlet private weak var _soonButton: GoalieKerningButton!
   @IBOutlet private weak var _asapButton: GoalieKerningButton!
   
   @IBOutlet private weak var _deleteButton: GoalieKerningButton!
   @IBOutlet private weak var _doneButton: GoalieKerningButton!
   
   @IBOutlet private weak var _priorityIndicatorLeadingSpaceConstraint: NSLayoutConstraint!
   @IBOutlet private weak var _detailsContainerView: UIVisualEffectView! {
      didSet {
         _setupShadow()
      }
   }
   
   private var _keyboardIsShowing = false
   private var _currentPriority: TaskPriority!
   private weak var _task: Task!
   
   var dialogContainer: UIView {
      return _detailsContainerView
   }
   
   // Mark: - Lifecycle
   override func viewWillAppear(animated: Bool)
   {
      super.viewWillAppear(animated)
      _setupTitleTextField()
      _updateTitleTextField()
      _currentPriority = _task.priority
      _updateButtonTextColorsForPriority(_currentPriority)
   }
   
   override func viewDidLayoutSubviews()
   {
      super.viewDidLayoutSubviews()
      
      _asapPriorityBlock.roundCorners(.Left)
      _agesPriorityBlock.roundCorners(.Right)
      _updatePriorityIndicatorViewFrameAnimated(false)
   }
   
   override func preferredStatusBarStyle() -> UIStatusBarStyle
   {
      return .LightContent
   }
   
   // MARK: - Setup
   private func _setupTitleTextField()
   {
      let font = UIFont(name: "NotoSans-Bold", size: 13)!
      let fontColor = _titleTextField.floatingLabelTextColor
      
      let attributes = [
         NSFontAttributeName : font,
         NSForegroundColorAttributeName : fontColor,
         NSKernAttributeName : 3
      ]
      
      _titleTextField.floatingLabel.attributedText = NSAttributedString(string: "TITLE", attributes: attributes)
      _titleTextField.delegate = self
   }
   
   // Mark: - IBActions
   @IBAction private func _asapButtonPressed()
   {
      _buttonPressedForPriority(.ASAP)
   }
   
   @IBAction private func _soonButtonPressed()
   {
      _buttonPressedForPriority(.Soon)
   }
   
   @IBAction private func _laterButtonPressed()
   {
      _buttonPressedForPriority(.Later)
   }
   
   @IBAction private func _agesButtonPressed()
   {
      _buttonPressedForPriority(.Ages)
   }
   
   private func _buttonPressedForPriority(priority: TaskPriority)
   {
      if _currentPriority != priority {
         SFXPlayer.playPriorityChangeSound()
      }
      _currentPriority = priority
      _updateButtonTextColorsForPriority(priority)
      _updatePriorityIndicatorViewFrameAnimated(true)
   }
   
   @IBAction private func _closeButtonPressed()
   {
      if _keyboardIsShowing {
         _titleTextField.resignFirstResponder()
      }
      else {
         dismissViewControllerAnimated(true, completion: { () -> Void in
            if self._task.priority != self._currentPriority {
               self._task.priority = self._currentPriority
               self.moc.saveOrRollback()
            }
         })
      }
   }
   
   @IBAction private func _deleteButtonPressed()
   {
      SFXPlayer.playDeleteSound()
      dismissViewControllerAnimated(true) { () -> Void in
         self._task.delete()
      }
   }
   
   @IBAction private func _tapRecognized(gestureRecognizer: UIGestureRecognizer)
   {
      let touchLocation = gestureRecognizer.locationInView(nil)
      guard !_detailsContainerView.frame.contains(touchLocation) else { return }
      
      _closeButtonPressed()
   }

   // MARK: - Public
   func configureWithTask(task: Task)
   {
      _task = task
   }
   
   // MARK: - Private
   private func _updateButtonTextColorsForPriority(priority: TaskPriority)
   {
      let disabledColor = UIColor(rgbValues: (87, 123, 137))
      let activeColor = UIColor.blackColor()
      
      var agesColor = disabledColor
      var laterColor = disabledColor
      var soonColor = disabledColor
      var asapColor = disabledColor
      
      switch priority
      {
      case .Unknown:
         break
      case .Ages: agesColor = activeColor
      case .Later: laterColor = activeColor
      case .Soon: soonColor = activeColor
      case .ASAP: asapColor = activeColor
      }
      
      _agesButton.updateTextColor(agesColor)
      _laterButton.updateTextColor(laterColor)
      _soonButton.updateTextColor(soonColor)
      _asapButton.updateTextColor(asapColor)
   }
   
   private func _updateTitleTextField()
   {
      _titleTextField.text = _task.title
   }
   
   private func _updatePriorityIndicatorViewFrameAnimated(animated: Bool)
   {
      let constant = _leadingSpaceConstantForPriority(_currentPriority)
      _priorityIndicatorLeadingSpaceConstraint.constant = constant
      
      if animated {
         UIView.animateWithDuration(0.2) { () -> Void in
            self.view.layoutIfNeeded()
         }
      }
   }
}

extension EditTaskViewController
{
   private func _setupShadow()
   {
      let shadowPath = UIBezierPath(rect: _detailsContainerView.bounds)
      
      _detailsContainerView.layer.shadowPath = shadowPath.CGPath
      _detailsContainerView.layer.shadowColor = UIColor.blackColor().CGColor
      _detailsContainerView.layer.shadowOpacity = 0.2
      _detailsContainerView.layer.shadowOffset = CGSize(width: 0, height: 4)
      _detailsContainerView.layer.shadowRadius = 4
   }
   
   private func _leadingSpaceConstantForPriority(priority: TaskPriority) -> CGFloat
   {
      var constant: CGFloat = 0
      switch priority
      {
      case .Ages:
         constant = _agesPriorityBlock.frame.minX
         break
      case .Later:
         constant = _laterPriorityBlock.frame.minX
         break
      case .Soon:
         constant = _soonPriorityBlock.frame.minX
         break
      case .ASAP:
         constant = _asapPriorityBlock.frame.minX
         break
      case .Unknown:
         break
      }
      return constant
   }
}

extension EditTaskViewController: UITextFieldDelegate
{
   func textFieldDidBeginEditing(textField: UITextField)
   {
      _keyboardIsShowing = true
   }
   
   func textFieldShouldReturn(textField: UITextField) -> Bool
   {
      textField.resignFirstResponder()
      return true
   }
   
   func textFieldDidEndEditing(textField: UITextField)
   {
      var newTitle = textField.text ?? ""
      newTitle = newTitle == "" ? "untitled" : newTitle
      
      _task.title = newTitle
      moc.saveOrRollback()
      
      _updateTitleTextField()
      _keyboardIsShowing = false
   }
}
