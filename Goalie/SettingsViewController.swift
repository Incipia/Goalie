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
   private var _taskPriorityStateSnapshotter: TaskPriorityStateSnapshotter!
   weak var delegate: SettingsViewControllerDelegate?
   
   
   @IBOutlet private weak var _containerView: UIVisualEffectView!
   @IBOutlet private weak var _showCompletedTasksSwitch: UISwitch!
   @IBOutlet private weak var _manuallySwitchPrioritySwitch: UISwitch!
   
   var dialogContainer: UIView {
      return _containerView
   }
   
   // Mark: - Lifecycle
   override func viewDidLoad()
   {
      super.viewDidLoad()
      _setupShadow()
   }
   
   override func viewWillAppear(animated: Bool)
   {
      super.viewWillAppear(animated)
      _showCompletedTasksSwitch.on = GoalieSettingsManager.showCompletedTasks
      _manuallySwitchPrioritySwitch.on = GoalieSettingsManager.manuallySwitchPriority
   }
   
   override func preferredStatusBarStyle() -> UIStatusBarStyle
   {
      return .LightContent
   }
   
   // Mark: - Private
   private func _setupShadow()
   {
      _containerView.layer.shadowColor = UIColor.blackColor().CGColor
      _containerView.layer.shadowOpacity = 0.2
      _containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
      _containerView.layer.shadowRadius = 4
   }
   
   // Mark: - IBActions
   @IBAction private func _closeButtonPressed()
   {
      dismissViewControllerAnimated(true) { () -> Void in
         
         GoalieSettingsManager.setShowCompletedTasks(self._showCompletedTasksSwitch.on)
         
         let autoSwitchPriorityChanged = GoalieSettingsManager.setManuallySwitchPriority(self._manuallySwitchPrioritySwitch.on)
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
   
   @IBAction private func _tapRecognized(gestureRecognizer: UIGestureRecognizer)
   {
      let touchLocation = gestureRecognizer.locationInView(nil)
      guard !_containerView.frame.contains(touchLocation) else { return }
      
      _closeButtonPressed()
   }
}
