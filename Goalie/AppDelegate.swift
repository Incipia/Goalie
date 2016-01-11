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
   private var _moc: NSManagedObjectContext! {
      didSet {
         _taskPriorityUpdater = TaskPriorityUpdater(managedObjectContext: _moc)
      }
   }
   
   private var _taskPriorityUpdater: TaskPriorityUpdater!
   private var _updateTaskPrioritiesTimer: NSTimer?
   private var _speechBubbleTimer: NSTimer?
   private var _mainTasksViewController: MainTasksViewController!

   func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
   {
      Fabric.with([Crashlytics.self])
      
      _moc = createGoalieMainContext()
      _setupMainTasksViewControllerWithMOC(_moc)
      _setupMainWindowWithViewController(_mainTasksViewController)
      
      return true
   }
   
   func applicationDidBecomeActive(application: UIApplication)
   {
      _startTimerForMinuteChangedNotification()
      _startTimerForSpeechBubble()
      _mainTasksViewController.showSpeechBubble()
   }
   
   func applicationWillResignActive(application: UIApplication)
   {
      _killUpdateTaskPrioritiesTimer()
      _killSpeechBubbleTimer()
      _mainTasksViewController.hideSpeechBubble()
   }
   
   private func _killUpdateTaskPrioritiesTimer()
   {
      _updateTaskPrioritiesTimer?.invalidate()
      _updateTaskPrioritiesTimer = nil
   }
   
   private func _killSpeechBubbleTimer()
   {
      _speechBubbleTimer?.invalidate()
      _speechBubbleTimer = nil
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
      guard _updateTaskPrioritiesTimer == nil else {return}
      
      let calendar = NSCalendar.autoupdatingCurrentCalendar()
      let components = calendar.components(.Second, fromDate: NSDate())
      let currentSecond = components.second
      
      let fireDate = NSDate().dateByAddingTimeInterval(NSTimeInterval(60 - currentSecond + 1))
      _updateTaskPrioritiesTimer = NSTimer(fireDate: fireDate, interval: 60, target: self, selector: Selector("_updateTaskPriorities:"), userInfo: nil, repeats: true)
      
      NSRunLoop.mainRunLoop().addTimer(_updateTaskPrioritiesTimer!, forMode: NSDefaultRunLoopMode)
   }
   
   private func _startTimerForSpeechBubble()
   {
      guard _speechBubbleTimer == nil else {return}
      
      _speechBubbleTimer = NSTimer(fireDate: NSDate().dateByAddingTimeInterval(10), interval: 0, target: self, selector: "_hideSpeechBubble:", userInfo: nil, repeats: false)
      NSRunLoop.mainRunLoop().addTimer(_speechBubbleTimer!, forMode: NSDefaultRunLoopMode)
   }
   
   internal func _hideSpeechBubble(timer: NSTimer)
   {
      _killSpeechBubbleTimer()
      _mainTasksViewController.hideSpeechBubble()
   }
   
   internal func _updateTaskPriorities(timer: NSTimer)
   {
      if GoalieSettingsManager.manuallySwitchPriority == false {
         _taskPriorityUpdater.updateTaskPriorities()
      }
   }
}

