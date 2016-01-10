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
   
   @IBOutlet private weak var _deleteButton: GoalieKerningButton!
   @IBOutlet private weak var _doneButton: GoalieKerningButton!
   
   @IBOutlet private weak var _priorityIndicatorLeadingSpaceConstraint: NSLayoutConstraint!
   @IBOutlet private weak var _detailsContainerView: UIVisualEffectView!
   
   private var _keyboardIsShowing = false
   private var _currentPriority: TaskPriority!
   private weak var _task: Task!
   
   var dialogContainer: UIView {
      return _detailsContainerView
   }
   
   // Mark: - Lifecycle
   override func viewDidLoad()
   {
      super.viewDidLoad()
      
      _setupShadow()
      _setupTitleTextField()
      _updateTitleTextField()
      _currentPriority = _task.priority
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
         NSKernAttributeName : 1.5
      ]
      
      _titleTextField.floatingLabel.attributedText = NSAttributedString(string: "TITLE", attributes: attributes)
      _titleTextField.delegate = self
   }
   
   // Mark: - IBActions
   @IBAction private func _asapButtonPressed()
   {
      _currentPriority = .ASAP
      _updatePriorityIndicatorViewFrameAnimated(true)
   }
   
   @IBAction private func _soonButtonPressed()
   {
      _currentPriority = .Soon
      _updatePriorityIndicatorViewFrameAnimated(true)
   }
   
   @IBAction private func _laterButtonPressed()
   {
      _currentPriority = .Later
      _updatePriorityIndicatorViewFrameAnimated(true)
   }
   
   @IBAction private func _agesButtonPressed()
   {
      _currentPriority = .Ages
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
      dismissViewControllerAnimated(false) { () -> Void in
         self._task.delete()
      }
   }
   
   // MARK: - Public
   func configureWithTask(task: Task)
   {
      _task = task
   }
   
   // MARK: - Private
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
