//
//  EditTaskViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 12/29/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit
import CoreData

class EditTaskViewController: UIViewController, ManagedObjectContextSettable
{
   var moc: NSManagedObjectContext!
   
   @IBOutlet private weak var _titleTextField: JVFloatLabeledTextField!
   @IBOutlet private weak var _asapPriorityBlock: UIView!
   @IBOutlet private weak var _soonPriorityBlock: UIView!
   @IBOutlet private weak var _laterPriorityBlock: UIView!
   @IBOutlet private weak var _agesPriorityBlock: UIView!
   
   @IBOutlet private weak var _priorityIndicatorLeadingSpaceConstraint: NSLayoutConstraint!
   
   @IBOutlet private weak var _detailsContainerView: UIVisualEffectView!
   
   private var _keyboardIsShowing = false
   private weak var _task: Task!
   
   // Mark: - Lifecycle
   override func viewDidLoad()
   {
      super.viewDidLoad()
      _setupShadow()
      
      _updateTitleTextField()
      _titleTextField.delegate = self
   }
   
   override func viewDidLayoutSubviews()
   {
      super.viewDidLayoutSubviews()
      _updatePriorityViewsLayerMasks()
      _updatePriorityIndicatorViewFrameAnimated(false)
   }
   
   override func preferredStatusBarStyle() -> UIStatusBarStyle
   {
      return .LightContent
   }
   
   // Mark: - IBActions
   @IBAction private func _asapButtonPressed()
   {
      _updateTaskWithPriority(.ASAP)
      _updatePriorityIndicatorViewFrameAnimated(true)
   }
   
   @IBAction private func _soonButtonPressed()
   {
      _updateTaskWithPriority(.Soon)
      _updatePriorityIndicatorViewFrameAnimated(true)
   }
   
   @IBAction private func _laterButtonPressed()
   {
      _updateTaskWithPriority(.Later)
      _updatePriorityIndicatorViewFrameAnimated(true)
   }
   
   @IBAction private func _agesButtonPressed()
   {
      _updateTaskWithPriority(.Ages)
      _updatePriorityIndicatorViewFrameAnimated(true)
   }
   
   @IBAction private func _closeButtonPressed()
   {
      if _keyboardIsShowing {
         _titleTextField.resignFirstResponder()
      }
      else {
         dismissViewControllerAnimated(false, completion: nil)
      }
   }
   
   @IBAction private func _duplicateButtonPressed()
   {
      _task.copyTaskWithContext(moc)
      dismissViewControllerAnimated(false, completion: nil)
   }
   
   @IBAction private func _deleteButtonPressed()
   {
      _task.delete()
      dismissViewControllerAnimated(false, completion: nil)
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
   
   private func _updateTaskWithPriority(priority: TaskPriority)
   {
      _task.priority = priority
      moc.saveOrRollback()
   }
   
   private func _updatePriorityIndicatorViewFrameAnimated(animated: Bool)
   {
      let constant = _leadingSpaceConstantForPriority(_task.priority)
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
   
   private func _updatePriorityViewsLayerMasks()
   {
      let radiiSize = _asapPriorityBlock.bounds.height * 0.5
      let leftMaskLayer = CAShapeLayer()
      leftMaskLayer.path = UIBezierPath(roundedRect: _asapPriorityBlock.bounds, byRoundingCorners: UIRectCorner.TopLeft.union(.BottomLeft), cornerRadii: CGSizeMake(radiiSize, radiiSize)).CGPath
      _asapPriorityBlock.layer.mask = leftMaskLayer
      
      let rightMaskLayer = CAShapeLayer()
      rightMaskLayer.path = UIBezierPath(roundedRect: _agesPriorityBlock.bounds, byRoundingCorners: UIRectCorner.TopRight.union(.BottomRight), cornerRadii: CGSizeMake(radiiSize, radiiSize)).CGPath
      _agesPriorityBlock.layer.mask = rightMaskLayer
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
      newTitle = newTitle == "" ? "Untitled" : newTitle
      
      _task.title = newTitle
      moc.saveOrRollback()
      
      _updateTitleTextField()
      _keyboardIsShowing = false
   }
}
