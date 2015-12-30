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
   
   private weak var _task: Task!
   
   @IBOutlet weak private var _textField: UITextField!
   @IBOutlet weak private var _leftButton: UIButton!
   @IBOutlet weak private var _leftBar: UIView!
   @IBOutlet weak private var _disclosureButton: UIButton!
   
   weak var delegate: TasksTableViewCellDelegate?
   
   var titleText: String {
      return _textField.text ?? ""
   }
   
   override func awakeFromNib()
   {
      _textField.delegate = self
      _textField.userInteractionEnabled = false
      
      super.awakeFromNib()
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
   
   internal func _plusButtonPressed()
   {
      _plusButtonWasPressed = true
      startEditing()
   }
   
   internal func _completeButtonPressed()
   {
      if !editing {
         delegate?.completeButtonPressedForTask(_task)
      }
   }
   
   @IBAction private func _disclosureButtonPressed()
   {
      if !editing {
         delegate?.disclosureButtonPressedForTask(_task)
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
      _task.title = _textField.text ?? "This shouldn't happen!"
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
   func configureForObject(object: Task)
   {
      _task = object
      _textField.text = _task.title
      _textField.userInteractionEnabled = _task.title != ""
      
      _updateLeftButton()
      
      _disclosureButton.hidden = _task.title == ""
      
      let alpha: CGFloat = _task.completed ? 0.4 : 1.0
      _textField.alpha = alpha
      _leftButton.alpha = alpha
      _disclosureButton.alpha = alpha
      _leftBar.alpha = alpha
      
      _leftBar.backgroundColor = UIColor(priority: _task.priority)
      if _task.title == "" {
         _leftBar.backgroundColor = UIColor.goalieGrayColor()
      }
      
      _plusButtonWasPressed = false
   }
}

extension TasksTableViewCell
{
   private func _updateLeftButtonTitle()
   {
      var buttonTitle = _task.completed ? _completedButtonTitle : _incompletedButtonTitle
      buttonTitle = _task.title == "" ? _plusButtonTitle : buttonTitle
      _leftButton.setTitle(buttonTitle, forState: .Normal)
   }
   
   private func _updateLeftButton()
   {
      var buttonTitle = _task.completed ? _completedButtonTitle : _incompletedButtonTitle
      buttonTitle = _task.title == "" ? _plusButtonTitle : buttonTitle
      _leftButton.setTitle(buttonTitle, forState: .Normal)
      
      _leftButton.removeTarget(self, action: "_completeButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
      _leftButton.removeTarget(self, action: "_plusButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
      
      var selector: Selector = "_completeButtonPressed"
      if _task.title == "" {
         selector = "_plusButtonPressed"
      }
      _leftButton.addTarget(self, action: selector, forControlEvents: UIControlEvents.TouchUpInside)
   }
}
