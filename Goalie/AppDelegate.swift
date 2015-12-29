//
//  AppDelegate.swift
//  Goalie
//
//  Created by Gregory Klein on 12/26/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
   var window: UIWindow?
   var moc: NSManagedObjectContext!
   private var _mainTasksViewController: MainTasksViewController!

   func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
   {
      _mainTasksViewController = UIStoryboard.mainTasksViewController()
      _mainTasksViewController.moc = createGoalieMainContext()
      
      window = UIWindow(frame: UIScreen.mainScreen().bounds)
      window?.rootViewController = _mainTasksViewController
      window?.makeKeyAndVisible()
      
      return true
   }
}

