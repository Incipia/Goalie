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
import AVFoundation
import StoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
   var window: UIWindow?
   fileprivate var _moc: NSManagedObjectContext! {
      didSet {
         _taskPriorityUpdater = TaskPriorityUpdater(managedObjectContext: _moc)
      }
   }
   
   fileprivate var _taskPriorityUpdater: TaskPriorityUpdater!
   fileprivate var _updateTaskPrioritiesTimer: Timer?
   fileprivate var _speechBubbleTimer: Timer?
   fileprivate var _goalieAnimationTimer: Timer?
   fileprivate var _mainTasksViewController: MainTasksViewController!
   fileprivate var _onboardingViewController: OnboardingViewController!
   fileprivate let _onboardingTransitionManager = OnboardingTransitionManager()

   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
   {
      Fabric.with([Crashlytics.self])
      _setupStoreKit()
      
      GoalieSettingsManager.setFirstTimeAppOpenedIfNecessary(Date())
      
//      CharacterManager.lockAllCharactersExceptForGoalie()
//      CharacterManager.updateCurrentCharacter(.Goalie)
//      AccessoryPackManager.lockAllAccessoryPacks()
      
//      CharacterManager.unlockAllCharacters()
//      AccessoryPackManager.unlockAllAccessoryPacks()
      
      _moc = createGoalieMainContext()
      _setupMainTasksViewControllerWithMOC(_moc)
      
      if GoalieSettingsManager.userHasOnboarded {
         _setupMainWindowWithViewController(_mainTasksViewController)
      }
      else {
         _onboardingViewController = UIStoryboard.onboardingViewController()
         _mainTasksViewController.transitioningDelegate = _onboardingTransitionManager
         
         _onboardingViewController.onboardingCompletionBlock = {
            self._onboardingViewController.present(self._mainTasksViewController, animated: true, completion: { () -> Void in
               
               self._startTimers()
               self._mainTasksViewController.showSpeechBubble()
               GoalieSettingsManager.setUserHasOnboarded(true)
            })
         }
         _setupMainWindowWithViewController(_onboardingViewController)
      }
   
//      do {
//         try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryMultiRoute, withOptions: .MixWithOthers)
//      }
//      catch _ as NSError {
//      }
      
      return true
   }
   
   func applicationDidBecomeActive(_ application: UIApplication)
   {
      if GoalieSettingsManager.userHasOnboarded {
         _startTimers()
         _mainTasksViewController.showSpeechBubble()
         _mainTasksViewController.startGoalieMovement()
      }
   }
   
   func applicationWillResignActive(_ application: UIApplication)
   {
      _killTimers()
      
      if GoalieSettingsManager.userHasOnboarded {
         _mainTasksViewController.hideSpeechBubble()
         _mainTasksViewController.stopGoalieMovement()
      }
   }
   
   fileprivate func _setupStoreKit()
   {
      MKStoreKit.shared().startProductRequest()      
      NotificationCenter.default.addObserver(forName: NSNotification.Name.mkStoreKitProductsAvailable,
         object: nil, queue: OperationQueue.main) { (note) -> Void in
            
            for product in MKStoreKit.shared().availableProducts {
               if let item = product as? SKProduct {
                  print("Available: \(item.productIdentifier) - purchased: \(MKStoreKit.shared().isProductPurchased(item.productIdentifier))")
               }
            }
            
//            MKStoreKit.sharedKit().refreshAppStoreReceipt()
      }
      
      let notificationName = NSNotification.Name.mkStoreKitProductPurchased
      NotificationCenter.default.addObserver(forName: notificationName,
         object: nil, queue: OperationQueue.main) { (note) -> Void in
            
            guard let id = note.object as? String else { return }
            
            if let character = GoalieCharacter.characterForPurchaseID(id) {
               CharacterManager.unlockCharacter(character)
               CharacterManager.updateCurrentCharacter(character)
            }
      }
   }
   
   fileprivate func _startTimers()
   {
      _startTimerForAutoIncrementingTasksPriorities()
      _startTimerForSpeechBubble()
      _startTimerForGoalieAnimations()
   }
   
   fileprivate func _killTimers()
   {
      _killUpdateTaskPrioritiesTimer()
      _killSpeechBubbleTimer()
      _killGoalieAnimationTimer()
   }
   
   fileprivate func _killUpdateTaskPrioritiesTimer()
   {
      _updateTaskPrioritiesTimer?.invalidate()
      _updateTaskPrioritiesTimer = nil
   }
   
   fileprivate func _killSpeechBubbleTimer()
   {
      _speechBubbleTimer?.invalidate()
      _speechBubbleTimer = nil
   }
   
   fileprivate func _killGoalieAnimationTimer()
   {
      _goalieAnimationTimer?.invalidate()
      _goalieAnimationTimer = nil
   }
   
   fileprivate func _setupMainTasksViewControllerWithMOC(_ moc: NSManagedObjectContext)
   {
      _mainTasksViewController = UIStoryboard.mainTasksViewController(moc)
   }
   
   fileprivate func _setupMainWindowWithViewController(_ controller: UIViewController)
   {
      window = UIWindow(frame: UIScreen.main.bounds)
      window?.rootViewController = controller
      window?.makeKeyAndVisible()
   }

   fileprivate func _startTimerForAutoIncrementingTasksPriorities()
   {
      guard _updateTaskPrioritiesTimer == nil else {return}
      
      let calendar = Calendar.autoupdatingCurrent
      let components = (calendar as NSCalendar).components(.second, from: Date())
      let currentSecond = components.second
      
      let fireDate = Date().addingTimeInterval(TimeInterval(60 - currentSecond! + 1))
      _updateTaskPrioritiesTimer = Timer(fireAt: fireDate, interval: 60, target: self, selector: #selector(AppDelegate._updateTaskPriorities(_:)), userInfo: nil, repeats: true)
      
      // update task priorities manually before timer is added to run loop
      _updateTaskPriorities(_updateTaskPrioritiesTimer!)
      RunLoop.main.add(_updateTaskPrioritiesTimer!, forMode: RunLoopMode.defaultRunLoopMode)
   }
   
   fileprivate func _startTimerForSpeechBubble()
   {
      guard _speechBubbleTimer == nil else {return}
      
      _speechBubbleTimer = Timer(fireAt: Date().addingTimeInterval(10), interval: 0, target: self, selector: #selector(AppDelegate._hideSpeechBubble(_:)), userInfo: nil, repeats: false)
      RunLoop.main.add(_speechBubbleTimer!, forMode: RunLoopMode.defaultRunLoopMode)
   }
   
   fileprivate func _startTimerForGoalieAnimations()
   {
      guard _goalieAnimationTimer == nil else {return}
      
      _goalieAnimationTimer = Timer(fireAt: Date().addingTimeInterval(10), interval: 5, target: self, selector: #selector(AppDelegate._animateGoalie(_:)), userInfo: nil, repeats: true)
      RunLoop.main.add(_goalieAnimationTimer!, forMode: RunLoopMode.defaultRunLoopMode)
   }
   
   internal func _hideSpeechBubble(_ timer: Timer)
   {
      _killSpeechBubbleTimer()
      _mainTasksViewController.hideSpeechBubble()
   }
   
   internal func _updateTaskPriorities(_ timer: Timer)
   {
      if GoalieSettingsManager.manuallySwitchPriority == false {
         _taskPriorityUpdater.updateTaskPriorities()
      }
   }
   
   internal func _animateGoalie(_ timer: Timer)
   {
      _mainTasksViewController.animateGoalie()
   }
}

