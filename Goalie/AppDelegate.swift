//
//  AppDelegate.swift
//  Goalie
//
//  Created by Gregory Klein on 12/26/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit
import CoreData
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
   var window: UIWindow?
   var moc: NSManagedObjectContext! {
      didSet {
         _taskPriorityUpdater = TaskPriorityUpdater(managedObjectContext: moc)
      }
   }
   
   private var _taskPriorityUpdater: TaskPriorityUpdater!
   private var _minuteChangedNotificationTimer: NSTimer?
   
   private var _mainTasksViewController: MainTasksViewController!

   func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
   {
      Fabric.with([Crashlytics.self])
      
      moc = createGoalieMainContext()
      _setupMainTasksViewControllerWithMOC(moc)
      _setupMainWindowWithViewController(_mainTasksViewController)
      
      return true
   }
   
   func applicationDidBecomeActive(application: UIApplication) {
      _startTimerForMinuteChangedNotification()
   }
   
   func applicationWillResignActive(application: UIApplication)
   {
      _minuteChangedNotificationTimer?.invalidate()
      _minuteChangedNotificationTimer = nil
   }
   
   private func _setupMainTasksViewControllerWithMOC(moc: NSManagedObjectContext)
   {
      _mainTasksViewController = UIStoryboard.mainTasksViewController(moc)
   }
   
   private func _setupMainWindowWithViewController(controller: UIViewController)
   {
      window = UIWindow(frame: UIScreen.mainScreen().bounds)
      window?.rootViewController = _mainTasksViewController
      window?.makeKeyAndVisible()
   }

   private func _startTimerForMinuteChangedNotification()
   {
      if _minuteChangedNotificationTimer == nil
      {
         let calendar = NSCalendar.autoupdatingCurrentCalendar()
         let components = calendar.components(.Second, fromDate: NSDate())
         let currentSecond = components.second
         
         let fireDate = NSDate().dateByAddingTimeInterval(NSTimeInterval(60 - currentSecond + 1))
         _minuteChangedNotificationTimer = NSTimer(fireDate: fireDate, interval: 60, target: self, selector: Selector("_minuteChanged:"), userInfo: nil, repeats: true)
         
         NSRunLoop.mainRunLoop().addTimer(_minuteChangedNotificationTimer!, forMode: NSDefaultRunLoopMode)
      }
   }
   
   internal func _minuteChanged(timer: NSTimer)
   {
      _taskPriorityUpdater.updateTaskPriorities()
   }
}

