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
   func taskCellBeganEditing(_ cell: TasksTableViewCell, plusButtonPressed: Bool)
   func textFieldShouldEndEditing(_ cell: TasksTableViewCell, forTask task: Task?) -> Bool
   func taskCellFinishedEditing(_ cell: TasksTableViewCell, forTask task: Task?)
   func titleTextFieldShouldReturnForCell(_ cell: TasksTableViewCell) -> Bool
   func returnKeyTypeForCell(_ cell: TasksTableViewCell) -> UIReturnKeyType
   
   func disclosureButtonPressedForTask(_ task: Task)
   func completeButtonPressedForCell(_ cell: TasksTableViewCell, task: Task)
}

class TasksTableViewCell: UITableViewCell
{
   fileprivate let _incompletedButtonTitle = "○"
   fileprivate let _completedButtonTitle = "◉"
   fileprivate let _plusButtonTitle = "+"
   fileprivate var _plusButtonWasPressed = false
   
   fileprivate weak var _task: Task?
   
   @IBOutlet weak fileprivate var _textField: UITextField!
   @IBOutlet weak fileprivate var _leftButton: UIButton!
   @IBOutlet weak fileprivate var _leftBar: UIView!
   @IBOutlet weak fileprivate var _disclosureButton: UIButton!
   @IBOutlet weak fileprivate var _topSeparator: UIView!
   @IBOutlet weak fileprivate var _bottomSeparator: UIView!
   
   fileprivate var _appearanceUpdater: TaskCellAppearanceUpdater!
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
      _textField.isUserInteractionEnabled = false
      _disclosureButton.setImage(nil, for: UIControlState())
   }
   
   func startEditing()
   {
      _textField.isUserInteractionEnabled = true
      _textField.becomeFirstResponder()
   }
   
   func stopEditing()
   {
      _textField.resignFirstResponder()
   }
   
   func updateSeparatorsAndLeftBarLayerMaskWithTask(_ task: Task, dataProvider: TasksDataProvider)
   {
      var shouldShowTopSeparator = true
      var shouldShowBottomSeparator = true
      
      var roundedCornerMask: CornerRoundingMask = .none
      if dataProvider.taskIsFirst(task) {
         shouldShowTopSeparator = false
         roundedCornerMask = .top
      }
      if dataProvider.taskIsLast(task) {
         shouldShowBottomSeparator = false
         roundedCornerMask = .bottom
      }
      if dataProvider.taskIsOnlyTask(task) {
         shouldShowTopSeparator = false
         shouldShowBottomSeparator = false
         roundedCornerMask = .all
      }
      
      _topSeparator.isHidden = !shouldShowTopSeparator
      _bottomSeparator.isHidden = !shouldShowBottomSeparator
      
      _leftBar.roundCorners(roundedCornerMask)
   }
   
   internal func _plusButtonPressed()
   {
      _plusButtonWasPressed = true
      startEditing()
   }
   
   internal func _completeButtonPressed()
   {
      if let task = _task, !isEditing {
         delegate?.completeButtonPressedForCell(self, task: task)
      }
   }
   
   @IBAction fileprivate func _disclosureButtonPressed()
   {
      if let task = _task, !isEditing {
         if task.priority != .unknown {
            delegate?.disclosureButtonPressedForTask(task)
         }
         else if _textField.isEditing {
            task.priority = .ages
            delegate?.disclosureButtonPressedForTask(task)
         }
      }
   }
}

extension TasksTableViewCell: UITextFieldDelegate
{
   func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
   {
      return true
   }
   
   func textFieldDidBeginEditing(_ textField: UITextField)
   {
      _updateDisclosureButtonTitle()
      delegate?.taskCellBeganEditing(self, plusButtonPressed: _plusButtonWasPressed)
      _textField.returnKeyType = delegate?.returnKeyTypeForCell(self) ?? .next
      _updateLeftButtonTitle()
   }
   
   func textFieldDidEndEditing(_ textField: UITextField)
   {
      _updateDisclosureButtonTitle()
      _task?.title = _textField.text ?? "This shouldn't happen!"
      _disclosureButton.isHidden = false
      delegate?.taskCellFinishedEditing(self, forTask: _task)
   }
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool
   {
      _updateLeftButtonTitle()
      
      titleText = titleText.trimmedString
      return delegate?.titleTextFieldShouldReturnForCell(self) ?? true
   }

   func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
   {
      _disclosureButton.isHidden = textField.text == ""
      if string != "" {
         _disclosureButton.isHidden = false
      }
      return true
   }
   
   func  textFieldShouldEndEditing(_ textField: UITextField) -> Bool
   {
      return delegate?.textFieldShouldEndEditing(self, forTask: _task) ?? true
   }
}

extension TasksTableViewCell: ConfigurableCell
{
   func configureForObject(_ task: Task, atIndexPath indexPath: IndexPath)
   {
      _task = task
      
      _updateTextFieldForTask(task)
      _updateLeftButtonTitle()
      _updateLeftButtonSelector()
      
      _appearanceUpdater.updateTask(task)
      _appearanceUpdater.updateProperty(.alpha, forComponents: [.leftBar, .leftButton, .textField, .disclosureButton])
      _appearanceUpdater.updateProperty(.color, forComponents: [.leftBar, .leftButton])
      _appearanceUpdater.updateProperty(.hidden, forComponents: [.disclosureButton])
      
      _plusButtonWasPressed = false
   }
}

extension TasksTableViewCell
{
   fileprivate func _updateTextFieldForTask(_ task: Task)
   {
      _textField.text = task.title
      _textField.isUserInteractionEnabled = task.title != ""
   }
   
   fileprivate func _updateLeftButtonTitle()
   {
      if let task = _task {
         var buttonTitle = task.completed ? _completedButtonTitle : _incompletedButtonTitle
         buttonTitle = task.title == "" ? _plusButtonTitle : buttonTitle
         
         let buttonFontSize: CGFloat = task.title == "" ? 30 : 20
         let newFont = UIFont.systemFont(ofSize: buttonFontSize)
         let attributedTitle = NSAttributedString(string: buttonTitle,
            attributes: [NSFontAttributeName : newFont])
         
         UIView.setAnimationsEnabled(false)
//         _leftButton.setTitle(buttonTitle, forState: .Normal)
         _leftButton.setAttributedTitle(attributedTitle, for: UIControlState())
         _leftButton.layoutIfNeeded()
         UIView.setAnimationsEnabled(true);
      }
   }
   
   fileprivate func _updateDisclosureButtonTitle()
   {
      let disclosureButtonImage: UIImage? = _textField.isEditing ? UIImage(named: "arrow")! : nil
      UIView.setAnimationsEnabled(false)
      _disclosureButton.setImage(disclosureButtonImage, for: UIControlState())
      UIView.setAnimationsEnabled(true);
   }
   
   fileprivate func _updateLeftButtonSelector()
   {
      if let task = _task {
         let selector = task.title == "" ? "_plusButtonPressed" : "_completeButtonPressed"
         _leftButton.updateTarget(self, selectorName: selector)
      }
   }
}

extension TasksTableViewCell: TaskCellAppearanceDelegate
{
   func viewForComponent(_ component: TaskCellComponent) -> UIView?
   {
      var control: UIView?
      switch component
      {
      case .leftBar:
         control = _leftBar
         break
      case .leftButton:
         control = _leftButton as UIView
         break
      case .textField:
         control = _textField as UIView
         break
      case .disclosureButton:
         control = _disclosureButton as UIView
         break
      }
      return control
   }
}
