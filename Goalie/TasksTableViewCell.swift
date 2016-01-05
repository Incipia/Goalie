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
   func taskCellFinishedEditing(cell: TasksTableViewCell, forTask task: Task?)
   func titleTextFieldShouldReturnForCell(cell: TasksTableViewCell) -> Bool
   func returnKeyTypeForCell(cell: TasksTableViewCell) -> UIReturnKeyType
   
   func disclosureButtonPressedForTask(task: Task)
   func completeButtonPressedForTask(task: Task)
}

class TasksTableViewCell: UITableViewCell
{
   private let _disclosureButtonTitle = "〉"
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
   
   private var _appearanceUpdater: TaskCellAppearanceUpdater!
   weak var delegate: TasksTableViewCellDelegate?
   
   var titleText: String {
      get {
         return _textField.text ?? ""
      }
      set {
         _textField.text = newValue
      }
   }
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      _appearanceUpdater = TaskCellAppearanceUpdater(delegate: self)
      _textField.delegate = self
      _textField.userInteractionEnabled = false
      _disclosureButton.setTitle(" ", forState: .Normal)
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
      var shouldShowTopSeparator = true
      var shouldShowBottomSeparator = true
      
      var roundedCornerMask: CornerRoundingMask = .None
      if dataProvider.taskIsFirst(task) {
         shouldShowTopSeparator = false
         roundedCornerMask = .Top
      }
      if dataProvider.taskIsLast(task) {
         shouldShowBottomSeparator = false
         roundedCornerMask = .Bottom
      }
      if dataProvider.taskIsOnlyTask(task) {
         shouldShowTopSeparator = false
         shouldShowBottomSeparator = false
         roundedCornerMask = .All
      }
      
      _topSeparator.hidden = !shouldShowTopSeparator
      _bottomSeparator.hidden = !shouldShowBottomSeparator
      
      _leftBar.roundCorners(roundedCornerMask)
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
         if task.priority != .Unknown {
            delegate?.disclosureButtonPressedForTask(task)
         }
         else if _textField.editing {
            task.priority = .Ages
            delegate?.disclosureButtonPressedForTask(task)
         }
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
      _updateDisclosureButtonTitle()
      delegate?.taskCellBeganEditing(self, plusButtonPressed: _plusButtonWasPressed)
      _textField.returnKeyType = delegate?.returnKeyTypeForCell(self) ?? .Next
      _updateLeftButtonTitle()
   }
   
   func textFieldDidEndEditing(textField: UITextField)
   {
      _updateDisclosureButtonTitle()
      _task?.title = _textField.text ?? "This shouldn't happen!"
      _disclosureButton.hidden = false
      delegate?.taskCellFinishedEditing(self, forTask: _task)
   }
   
   func textFieldShouldReturn(textField: UITextField) -> Bool
   {
      _updateLeftButtonTitle()
      
      titleText = titleText.trimmedString
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
      _updateLeftButtonTitle()
      _updateLeftButtonSelector()
      
      _appearanceUpdater.updateTask(task)
      _appearanceUpdater.updateProperty(.Alpha, forComponents: [.LeftBar, .LeftButton, .TextField, .DisclosureButton])
      _appearanceUpdater.updateProperty(.Color, forComponents: [.LeftBar])
      _appearanceUpdater.updateProperty(.Hidden, forComponents: [.DisclosureButton])
      
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
   
   private func _updateLeftButtonTitle()
   {
      if let task = _task {
         var buttonTitle = task.completed ? _completedButtonTitle : _incompletedButtonTitle
         buttonTitle = task.title == "" ? _plusButtonTitle : buttonTitle
         
         UIView.setAnimationsEnabled(false)
         _leftButton.setTitle(buttonTitle, forState: .Normal)
         _leftButton.layoutIfNeeded()
         UIView.setAnimationsEnabled(true);
      }
   }
   
   private func _updateDisclosureButtonTitle()
   {
      let disclosureButtonTitle = _textField.editing ? _disclosureButtonTitle : " "
      UIView.setAnimationsEnabled(false)
      _disclosureButton.setTitle(disclosureButtonTitle, forState: .Normal)
      UIView.setAnimationsEnabled(true);
   }
   
   private func _updateLeftButtonSelector()
   {
      if let task = _task {
         let selector = task.title == "" ? "_plusButtonPressed" : "_completeButtonPressed"
         _leftButton.updateTarget(self, selectorName: selector)
      }
   }
}

extension TasksTableViewCell: TaskCellAppearanceDelegate
{
   func viewForComponent(component: TaskCellComponent) -> UIView?
   {
      var control: UIView?
      switch component
      {
      case .LeftBar:
         control = _leftBar
         break
      case .LeftButton:
         control = _leftButton as UIView
         break
      case .TextField:
         control = _textField as UIView
         break
      case .DisclosureButton:
         control = _disclosureButton as UIView
         break
      }
      return control
   }
}
