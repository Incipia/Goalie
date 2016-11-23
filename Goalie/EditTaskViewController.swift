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
   
   @IBOutlet fileprivate weak var _titleTextField: JVFloatLabeledTextField!
   @IBOutlet fileprivate weak var _asapPriorityBlock: UIView!
   @IBOutlet fileprivate weak var _soonPriorityBlock: UIView!
   @IBOutlet fileprivate weak var _laterPriorityBlock: UIView!
   @IBOutlet fileprivate weak var _agesPriorityBlock: UIView!
   
   @IBOutlet fileprivate weak var _agesButton: GoalieKerningButton!
   @IBOutlet fileprivate weak var _laterButton: GoalieKerningButton!
   @IBOutlet fileprivate weak var _soonButton: GoalieKerningButton!
   @IBOutlet fileprivate weak var _asapButton: GoalieKerningButton!
   
   @IBOutlet fileprivate weak var _deleteButton: GoalieKerningButton!
   @IBOutlet fileprivate weak var _doneButton: GoalieKerningButton!
   
   @IBOutlet fileprivate weak var _priorityIndicatorLeadingSpaceConstraint: NSLayoutConstraint!
   @IBOutlet fileprivate weak var _detailsContainerView: UIVisualEffectView! {
      didSet {
         _setupShadow()
      }
   }
   
   fileprivate var _keyboardIsShowing = false
   fileprivate var _currentPriority: TaskPriority!
   fileprivate weak var _task: Task!
   
   var dialogContainer: UIView {
      return _detailsContainerView
   }
   
   // Mark: - Lifecycle
   override func viewWillAppear(_ animated: Bool)
   {
      super.viewWillAppear(animated)
      _setupTitleTextField()
      _updateTitleTextField()
      _currentPriority = _task.priority
      _updateButtonTextColorsForPriority(_currentPriority)
      
//      _detailsContainerView.layer.cornerRadius = 4.0
//      _detailsContainerView.layer.masksToBounds = true
   }
   
   override func viewDidLayoutSubviews()
   {
      super.viewDidLayoutSubviews()
      
      _asapPriorityBlock.roundCorners(.left)
      _agesPriorityBlock.roundCorners(.right)
      _updatePriorityIndicatorViewFrameAnimated(false)
		
		let shadowPath = UIBezierPath(rect: _detailsContainerView.bounds)
		_detailsContainerView.layer.shadowPath = shadowPath.cgPath
   }
	
   override var preferredStatusBarStyle : UIStatusBarStyle
   {
      return .lightContent
   }
   
   // MARK: - Setup
   fileprivate func _setupTitleTextField()
   {
      let font = UIFont(name: "NotoSans-Bold", size: 13)!
      let fontColor = _titleTextField.floatingLabelTextColor
      
      let attributes = [
         NSFontAttributeName : font,
         NSForegroundColorAttributeName : fontColor,
         NSKernAttributeName : 3
      ] as [String : Any]
      
      _titleTextField.floatingLabel.attributedText = NSAttributedString(string: "TITLE", attributes: attributes)
      _titleTextField.delegate = self
   }
   
   // Mark: - IBActions
   @IBAction fileprivate func _asapButtonPressed()
   {
      _buttonPressedForPriority(.asap)
   }
   
   @IBAction fileprivate func _soonButtonPressed()
   {
      _buttonPressedForPriority(.soon)
   }
   
   @IBAction fileprivate func _laterButtonPressed()
   {
      _buttonPressedForPriority(.later)
   }
   
   @IBAction fileprivate func _agesButtonPressed()
   {
      _buttonPressedForPriority(.ages)
   }
   
   fileprivate func _buttonPressedForPriority(_ priority: TaskPriority)
   {
      if _currentPriority != priority {
         SFXPlayer.playPriorityChangeSound()
      }
      _currentPriority = priority
      _updateButtonTextColorsForPriority(priority)
      _updatePriorityIndicatorViewFrameAnimated(true)
   }
   
   @IBAction fileprivate func _closeButtonPressed()
   {
      if _keyboardIsShowing {
         _titleTextField.resignFirstResponder()
      }
      else {
         dismiss(animated: true, completion: { () -> Void in
            if self._task.priority != self._currentPriority {
               self._task.priority = self._currentPriority
               self.moc.saveOrRollback()
            }
         })
      }
   }
   
   @IBAction fileprivate func _deleteButtonPressed()
   {
      SFXPlayer.playDeleteSound()
      dismiss(animated: true) { () -> Void in
         self._task.delete()
      }
   }
   
   @IBAction fileprivate func _tapRecognized(_ gestureRecognizer: UIGestureRecognizer)
   {
      let touchLocation = gestureRecognizer.location(in: nil)
      guard !_detailsContainerView.frame.contains(touchLocation) else { return }
      
      _closeButtonPressed()
   }

   // MARK: - Public
   func configureWithTask(_ task: Task)
   {
      _task = task
   }
   
   // MARK: - Private
   fileprivate func _updateButtonTextColorsForPriority(_ priority: TaskPriority)
   {
      let disabledColor = UIColor(rgbValues: (87, 123, 137))
      let activeColor = UIColor.black
      
      var agesColor = disabledColor
      var laterColor = disabledColor
      var soonColor = disabledColor
      var asapColor = disabledColor
      
      switch priority
      {
      case .unknown:
         break
      case .ages: agesColor = activeColor
      case .later: laterColor = activeColor
      case .soon: soonColor = activeColor
      case .asap: asapColor = activeColor
      }
      
      _agesButton.updateTextColor(agesColor)
      _laterButton.updateTextColor(laterColor)
      _soonButton.updateTextColor(soonColor)
      _asapButton.updateTextColor(asapColor)
   }
   
   fileprivate func _updateTitleTextField()
   {
      _titleTextField.text = _task.title
   }
   
   fileprivate func _updatePriorityIndicatorViewFrameAnimated(_ animated: Bool)
   {
      let constant = _leadingSpaceConstantForPriority(_currentPriority)
      _priorityIndicatorLeadingSpaceConstraint.constant = constant
      
      if animated {
         UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.view.layoutIfNeeded()
         }) 
      }
   }
}

extension EditTaskViewController
{
   fileprivate func _setupShadow()
   {
      _detailsContainerView.layer.shadowColor = UIColor.black.cgColor
      _detailsContainerView.layer.shadowOpacity = 0.2
      _detailsContainerView.layer.shadowOffset = CGSize(width: 0, height: 4)
      _detailsContainerView.layer.shadowRadius = 4
   }
   
   fileprivate func _leadingSpaceConstantForPriority(_ priority: TaskPriority) -> CGFloat
   {
      var constant: CGFloat = 0
      switch priority
      {
      case .ages:
         constant = _agesPriorityBlock.frame.minX
         break
      case .later:
         constant = _laterPriorityBlock.frame.minX
         break
      case .soon:
         constant = _soonPriorityBlock.frame.minX
         break
      case .asap:
         constant = _asapPriorityBlock.frame.minX
         break
      case .unknown:
         break
      }
      return constant
   }
}

extension EditTaskViewController: UITextFieldDelegate
{
   func textFieldDidBeginEditing(_ textField: UITextField)
   {
      _keyboardIsShowing = true
   }
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool
   {
      textField.resignFirstResponder()
      return true
   }
   
   func textFieldDidEndEditing(_ textField: UITextField)
   {
      var newTitle = textField.text ?? ""
      newTitle = newTitle == "" ? "untitled" : newTitle
      
      _task.title = newTitle
      moc.saveOrRollback()
      
      _updateTitleTextField()
      _keyboardIsShowing = false
   }
}
