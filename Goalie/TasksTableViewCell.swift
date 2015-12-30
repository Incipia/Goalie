//
//  GoalsTableViewCell.swift
//  Goalie
//
//  Created by Gregory Klein on 12/28/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

protocol TasksTableViewCellDelegate: class
{
   func taskCellBeganEditing(cell: TasksTableViewCell, plusButtonPressed: Bool)
   func taskCellFinishedEditing(cell: TasksTableViewCell)
   func titleTextFieldShouldReturnForCell(cell: TasksTableViewCell) -> Bool
   func returnKeyTypeForCell(cell: TasksTableViewCell) -> UIReturnKeyType
   
   func disclosureButtonPressedForTask(task: Task)
   func completeButtonPressedForTask(task: Task)
}

class TasksTableViewCell: UITableViewCell
{
   private let _incompletedButtonTitle = "○"
   private let _completedButtonTitle = "◉"
   private let _plusButtonTitle = "+"
   private var _plusButtonWasPressed = false
   
   private weak var _task: Task?
   
   @IBOutlet weak private var _textField: UITextField!
   @IBOutlet weak private var _leftButton: UIButton!
   @IBOutlet weak private var _leftBar: UIView!
   @IBOutlet weak private var _disclosureButton: UIButton!
   @IBOutlet weak private var _topSeparator: UIView!
   @IBOutlet weak private var _bottomSeparator: UIView!
   
   weak var delegate: TasksTableViewCellDelegate?
   var shouldShowTopSeparator = true
   var shouldShowBottomSeparator = true
   var leftBarRoundedCorners: UIRectCorner?
   
   var titleText: String {
      return _textField.text ?? ""
   }
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      _textField.delegate = self
      _textField.userInteractionEnabled = false
   }
   
   func startEditing()
   {
      _textField.userInteractionEnabled = true
      _textField.becomeFirstResponder()
   }
   
   func stopEditing()
   {
      _textField.resignFirstResponder()
   }
   
   func updateSeparatorsAndLeftBarLayerMaskWithTask(task: Task, dataProvider: TasksDataProvider)
   {
      shouldShowTopSeparator = true
      shouldShowBottomSeparator = true
      leftBarRoundedCorners = nil
      if dataProvider.taskIsFirst(task) {
         shouldShowTopSeparator = false
         leftBarRoundedCorners = UIRectCorner.TopLeft.union(.TopRight)
      }
      if dataProvider.taskIsLast(task) {
         shouldShowBottomSeparator = false
         leftBarRoundedCorners = UIRectCorner.BottomLeft.union(.BottomRight)
      }
      if dataProvider.taskIsOnlyTask(task) {
         shouldShowTopSeparator = false
         shouldShowBottomSeparator = false
         leftBarRoundedCorners = UIRectCorner.AllCorners
      }
      
      _topSeparator.hidden = !shouldShowTopSeparator
      _bottomSeparator.hidden = !shouldShowBottomSeparator
      
      if let roundedCorners = leftBarRoundedCorners {
         let radiiSize = _leftBar.bounds.width * 0.5
         let leftMaskLayer = CAShapeLayer()
         leftMaskLayer.path = UIBezierPath(roundedRect: _leftBar.bounds, byRoundingCorners: roundedCorners, cornerRadii: CGSizeMake(radiiSize, radiiSize)).CGPath
         _leftBar.layer.mask = leftMaskLayer
      }
      else {
         _leftBar.layer.mask = nil
      }
   }
   
   internal func _plusButtonPressed()
   {
      _plusButtonWasPressed = true
      startEditing()
   }
   
   internal func _completeButtonPressed()
   {
      if let task = _task where !editing {
         delegate?.completeButtonPressedForTask(task)
      }
   }
   
   @IBAction private func _disclosureButtonPressed()
   {
      if let task = _task where !editing {
         delegate?.disclosureButtonPressedForTask(task)
      }
   }
}

extension TasksTableViewCell: UITextFieldDelegate
{
   func textFieldShouldBeginEditing(textField: UITextField) -> Bool
   {
      return true
   }
   
   func textFieldDidBeginEditing(textField: UITextField)
   {
      delegate?.taskCellBeganEditing(self, plusButtonPressed: _plusButtonWasPressed)
      _textField.returnKeyType = delegate?.returnKeyTypeForCell(self) ?? .Next
      _updateLeftButtonTitle()
   }
   
   func textFieldDidEndEditing(textField: UITextField)
   {
      _task?.title = _textField.text ?? "This shouldn't happen!"
      _disclosureButton.hidden = false
      
      delegate?.taskCellFinishedEditing(self)
   }
   
   func textFieldShouldReturn(textField: UITextField) -> Bool
   {
      _updateLeftButtonTitle()
      return delegate?.titleTextFieldShouldReturnForCell(self) ?? true
   }

   func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
   {
      _disclosureButton.hidden = textField.text == ""
      if string != "" {
         _disclosureButton.hidden = false
      }
      
      return true
   }
}

extension TasksTableViewCell: ConfigurableCell
{
   func configureForObject(task: Task, atIndexPath indexPath: NSIndexPath)
   {
      _task = task
      
      _updateTextFieldForTask(task)
      _updateLeftButtonTitleAndSelector()
      _updateCellComponentAlphaValuesForTask(task)
      _updateLeftBarColorForTask(task)
      
      _disclosureButton.hidden = task.title == ""
      _plusButtonWasPressed = false
   }
}

extension TasksTableViewCell
{
   private func _updateTextFieldForTask(task: Task)
   {
      _textField.text = task.title
      _textField.userInteractionEnabled = task.title != ""
   }
   
   private func _updateLeftBarColorForTask(task: Task)
   {
      _leftBar.backgroundColor = UIColor(priority: task.priority)
      if task.title == "" {
         _leftBar.backgroundColor = UIColor.goalieGrayColor()
      }
   }
   
   private func _updateLeftButtonTitle()
   {
      if let task = _task {
         var buttonTitle = task.completed ? _completedButtonTitle : _incompletedButtonTitle
         buttonTitle = task.title == "" ? _plusButtonTitle : buttonTitle
         _leftButton.setTitle(buttonTitle, forState: .Normal)
      }
   }
   
   private func _updateCellComponentAlphaValuesForTask(task: Task)
   {
      let alpha: CGFloat = task.completed ? 0.4 : 1.0
      _textField.alpha = alpha
      _leftButton.alpha = alpha
      _disclosureButton.alpha = alpha
      _leftBar.alpha = alpha
   }
   
   private func _updateLeftButtonTitleAndSelector()
   {
      if let task = _task {
         var buttonTitle = task.completed ? _completedButtonTitle : _incompletedButtonTitle
         buttonTitle = task.title == "" ? _plusButtonTitle : buttonTitle
         _leftButton.setTitle(buttonTitle, forState: .Normal)
         
         _leftButton.removeTarget(self, action: "_completeButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
         _leftButton.removeTarget(self, action: "_plusButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
         
         var selector: Selector = "_completeButtonPressed"
         if task.title == "" {
            selector = "_plusButtonPressed"
         }
         _leftButton.addTarget(self, action: selector, forControlEvents: UIControlEvents.TouchUpInside)
      }
   }
}
