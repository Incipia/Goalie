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
   private var _goalieAnimationTimer: NSTimer?
   private var _mainTasksViewController: MainTasksViewController!
   private var _onboardingViewController: OnboardingViewController!
   private let _onboardingTransitionManager = OnboardingTransitionManager()

   func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
   {
      Fabric.with([Crashlytics.self])
      
      _moc = createGoalieMainContext()
      _setupMainTasksViewControllerWithMOC(_moc)
      
//       FOR TESTING!
//      GoalieSettingsManager.setUserHasOnboarded(false)
//      GoalieSettingsManager.setUserCreatedFirstTask(false)
      
      if GoalieSettingsManager.userHasOnboarded {
         _setupMainWindowWithViewController(_mainTasksViewController)
      }
      else {
         _onboardingViewController = UIStoryboard.onboardingViewController()
         _mainTasksViewController.transitioningDelegate = _onboardingTransitionManager
         
         _onboardingViewController.onboardingCompletionBlock = {
            self._onboardingViewController.presentViewController(self._mainTasksViewController, animated: true, completion: { () -> Void in
               
               self._startTimers()
               self._mainTasksViewController.showSpeechBubble()
               self._mainTasksViewController.startGoalieMovement()
               GoalieSettingsManager.setUserHasOnboarded(true)
            })
            
         }
         _setupMainWindowWithViewController(_onboardingViewController)
      }
   
      return true
   }
   
   func applicationDidBecomeActive(application: UIApplication)
   {
      if GoalieSettingsManager.userHasOnboarded {
         _startTimers()
         _mainTasksViewController.showSpeechBubble()
         _mainTasksViewController.startGoalieMovement()
      }
   }
   
   func applicationWillResignActive(application: UIApplication)
   {
      _killTimers()
      
      if GoalieSettingsManager.userHasOnboarded {
         _mainTasksViewController.hideSpeechBubble()
         _mainTasksViewController.stopGoalieMovement()
      }
   }
   
   private func _startTimers()
   {
      _startTimerForMinuteChangedNotification()
      _startTimerForSpeechBubble()
      _startTimerForGoalieAnimations()
   }
   
   private func _killTimers()
   {
      _killUpdateTaskPrioritiesTimer()
      _killSpeechBubbleTimer()
      _killGoalieAnimationTimer()
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
   
   private func _killGoalieAnimationTimer()
   {
      _goalieAnimationTimer?.invalidate()
      _goalieAnimationTimer = nil
   }
   
   private func _setupMainTasksViewControllerWithMOC(moc: NSManagedObjectContext)
   {
      _mainTasksViewController = UIStoryboard.mainTasksViewController(moc)
   }
   
   private func _setupMainWindowWithViewController(controller: UIViewController)
   {
      window = UIWindow(frame: UIScreen.mainScreen().bounds)
      window?.rootViewController = controller
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
   
   private func _startTimerForGoalieAnimations()
   {
      guard _goalieAnimationTimer == nil else {return}
      
      _goalieAnimationTimer = NSTimer(fireDate: NSDate().dateByAddingTimeInterval(10), interval: 5, target: self, selector: "_animateGoalie:", userInfo: nil, repeats: true)
      NSRunLoop.mainRunLoop().addTimer(_goalieAnimationTimer!, forMode: NSDefaultRunLoopMode)
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
   
   internal func _animateGoalie(timer: NSTimer)
   {
      _mainTasksViewController.animateGoalie()
   }
}

