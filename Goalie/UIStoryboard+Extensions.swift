//
//  UIStoryboard+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/10/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit
import CoreData

extension UIStoryboard
{  
   static func taskDetailsViewControllerForTask(task: Task, managedObjectContext: NSManagedObjectContext) -> EditTaskViewController
   {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let editTaskController = storyboard.instantiateViewControllerWithIdentifier("TaskDetailsViewController") as! EditTaskViewController
      editTaskController.moc = managedObjectContext
      editTaskController.configureWithTask(task)
      editTaskController.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
      
      return editTaskController
   }
   
   static func settingsViewController(managedObjectContext: NSManagedObjectContext, delegate: SettingsViewControllerDelegate) -> SettingsViewController
   {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let settingsController = storyboard.instantiateViewControllerWithIdentifier("SettingsViewController") as! SettingsViewController
      settingsController.moc = managedObjectContext
      settingsController.delegate = delegate
      settingsController.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
      
      return settingsController
   }
   
   static func mainTasksViewController(moc: NSManagedObjectContext) -> MainTasksViewController
   {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewControllerWithIdentifier("MainTasksViewController") as! MainTasksViewController
      controller.moc = moc
      return controller
   }
}
