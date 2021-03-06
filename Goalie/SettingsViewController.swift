//
//  SettingsViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 12/30/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit
import CoreData

protocol MenuController: class
{
   var view: UIView! {get set}
   var dialogContainer: UIView {get}
}

protocol SettingsViewControllerDelegate: class
{
   func settingsDidClose()
}

class SettingsViewController: UIViewController, ManagedObjectContextSettable, MenuController
{
   var moc: NSManagedObjectContext! {
      didSet {
         _taskPriorityStateSnapshotter = TaskPriorityStateSnapshotter(moc: moc)
      }
   }
   fileprivate var _taskPriorityStateSnapshotter: TaskPriorityStateSnapshotter!
   weak var delegate: SettingsViewControllerDelegate?
   
   
   @IBOutlet fileprivate weak var _containerView: UIVisualEffectView!
   @IBOutlet fileprivate weak var _showCompletedTasksSwitch: UISwitch!
   @IBOutlet fileprivate weak var _manuallySwitchPrioritySwitch: UISwitch!
   
   var dialogContainer: UIView {
      return _containerView
   }
   
   // Mark: - Lifecycle
   override func viewDidLoad()
   {
      super.viewDidLoad()
      _setupShadow()
      
//      _containerView.layer.cornerRadius = 4.0
//      _containerView.layer.masksToBounds = true
   }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		let shadowPath = UIBezierPath(rect: _containerView.bounds)
		_containerView.layer.shadowPath = shadowPath.cgPath
	}
   
   override func viewWillAppear(_ animated: Bool)
   {
      super.viewWillAppear(animated)
      _showCompletedTasksSwitch.isOn = GoalieSettingsManager.showCompletedTasks
      _manuallySwitchPrioritySwitch.isOn = GoalieSettingsManager.manuallySwitchPriority
   }
   
   override var preferredStatusBarStyle : UIStatusBarStyle
   {
      return .lightContent
   }
   
   // Mark: - Private
   fileprivate func _setupShadow()
	{
      _containerView.layer.shadowColor = UIColor.black.cgColor
      _containerView.layer.shadowOpacity = 0.2
      _containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
      _containerView.layer.shadowRadius = 4
   }
   
   // Mark: - IBActions
   @IBAction fileprivate func _closeButtonPressed()
   {
      dismiss(animated: true) { () -> Void in
         
         GoalieSettingsManager.setShowCompletedTasks(self._showCompletedTasksSwitch.isOn)
         
         let autoSwitchPriorityChanged = GoalieSettingsManager.setManuallySwitchPriority(self._manuallySwitchPrioritySwitch.isOn)
         if autoSwitchPriorityChanged {
            if GoalieSettingsManager.manuallySwitchPriority {
               self._taskPriorityStateSnapshotter.snapshotCurrentState()
            }
            else {
               self._taskPriorityStateSnapshotter.applyPreviousSnapshot()
            }
         }
         
         self.delegate?.settingsDidClose()
      }
   }
   
   @IBAction fileprivate func _tapRecognized(_ gestureRecognizer: UIGestureRecognizer)
   {
      let touchLocation = gestureRecognizer.location(in: nil)
      guard !_containerView.frame.contains(touchLocation) else { return }
      
      _closeButtonPressed()
   }
}
