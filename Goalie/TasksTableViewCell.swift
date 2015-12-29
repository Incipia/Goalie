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
   func taskCellBeganEditing(cell: TasksTableViewCell)
   func taskCellFinishedEditing(cell: TasksTableViewCell)
   func titleTextFieldShouldReturnForCell(cell: TasksTableViewCell) -> Bool
   func returnKeyTypeForCell(cell: TasksTableViewCell) -> UIReturnKeyType
}

class TasksTableViewCell: UITableViewCell
{
   let completedButtonTitle = "○"
   let plusButtonTitle = "+"
   
   private weak var _task: Task!
   
   @IBOutlet weak private var _textField: UITextField!
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
   
   @IBAction private func _plusButtonPressed()
   {
      startEditing()
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
      delegate?.taskCellBeganEditing(self)
      _textField.returnKeyType = delegate?.returnKeyTypeForCell(self) ?? .Next
   }
   
   func textFieldDidEndEditing(textField: UITextField)
   {
      _task.title = _textField.text ?? "This shouldn't happen!"
      delegate?.taskCellFinishedEditing(self)
   }
   
   func textFieldShouldReturn(textField: UITextField) -> Bool
   {
      return delegate?.titleTextFieldShouldReturnForCell(self) ?? true
   }

}

extension TasksTableViewCell: ConfigurableCell
{
   func configureForObject(object: Task)
   {
      _task = object
      _textField.text = _task.title
      _textField.userInteractionEnabled = _task.title != ""
   }
}
