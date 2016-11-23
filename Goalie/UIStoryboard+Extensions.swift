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
   static func editListViewController() -> EditListViewController
   {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "EditListViewControllerID") as! EditListViewController
      return controller
   }
   
   static func onboardingViewController() -> OnboardingViewController
   {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
      return controller
   }
   
   static func congratulationsViewController() -> CongratulationsViewController
   {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "CongratulationsViewController") as! CongratulationsViewController
      controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
      return controller
   }
   
   static func unlockedAccessoryPackViewController() -> UnlockedAccessoryPackViewController
   {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "UnlockedAccessoryPackViewControllerID") as! UnlockedAccessoryPackViewController
      controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
      return controller
   }
   
   static func editTaskViewController(_ managedObjectContext: NSManagedObjectContext) -> EditTaskViewController
   {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let editTaskController = storyboard.instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController
      editTaskController.moc = managedObjectContext
      editTaskController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
      
      return editTaskController
   }
   
   static func settingsViewController(_ managedObjectContext: NSManagedObjectContext, delegate: SettingsViewControllerDelegate) -> SettingsViewController
   {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let settingsController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
      settingsController.moc = managedObjectContext
      settingsController.delegate = delegate
      settingsController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
      
      return settingsController
   }
   
   static func mainTasksViewController(_ moc: NSManagedObjectContext) -> MainTasksViewController
   {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "MainTasksViewController") as! MainTasksViewController
      controller.moc = moc
      return controller
   }
}
