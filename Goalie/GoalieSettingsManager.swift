//
//  GoalieSettingsManager.swift
//  Goalie
//
//  Created by Gregory Klein on 12/30/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import Foundation

private let ShowCompletedTasksKey = "GoalieShowCompletedTasksKey"
private let ManuallySwitchPriorityKey = "GoalieManuallySwitchPriorityKey"
private let UserHasOnboardedKey = "GoalieUserHasOnboarded"
private let UserCreatedFirstTaskKey = "GoalieUserCompletedFirstTaskKey"
private let TotalTasksCreatedKey = "GoalieTotalTasksCreatedKey"
private let FirstTimeAppOpenedDateKey = "GoalieFirstTimeAppOpenedDateKey"

private let defaultShowCompletedTasksValue = true
private let defaultManuallySwitchPriorityValue = false
private let defaultUserHasOnboardedValue = false
private let defaultUserCompletedFirstTask = false
private let defaultTotalTasksCreatedValue = 0
private let defaultFirstTimeAppOpenedDateValue = NSDate().timeIntervalSince1970

struct GoalieSettingsManager
{
   static var showCompletedTasks: Bool {
      var show = defaultShowCompletedTasksValue
      if let _ = NSUserDefaults.standardUserDefaults().objectForKey(ShowCompletedTasksKey) {
         show = NSUserDefaults.standardUserDefaults().boolForKey(ShowCompletedTasksKey)
      }
      return show
   }
   
   static var manuallySwitchPriority: Bool {
      var manuallySwitch = defaultManuallySwitchPriorityValue
      if let _ = NSUserDefaults.standardUserDefaults().objectForKey(ManuallySwitchPriorityKey) {
         manuallySwitch = NSUserDefaults.standardUserDefaults().boolForKey(ManuallySwitchPriorityKey)
      }
      return manuallySwitch
   }
   
   static var userHasOnboarded: Bool {
      var hasOnboarded = defaultUserHasOnboardedValue
      if let _ = NSUserDefaults.standardUserDefaults().objectForKey(UserHasOnboardedKey) {
         hasOnboarded = NSUserDefaults.standardUserDefaults().boolForKey(UserHasOnboardedKey)
      }
      return hasOnboarded
   }
   
   static var userCreatedFirstTask: Bool {
      var copmletedFirst = defaultUserCompletedFirstTask
      if let _ = NSUserDefaults.standardUserDefaults().objectForKey(UserCreatedFirstTaskKey) {
         copmletedFirst = NSUserDefaults.standardUserDefaults().boolForKey(UserCreatedFirstTaskKey)
      }
      return copmletedFirst
   }
   
   static var totalTasksCreated: Int {
      var total = defaultTotalTasksCreatedValue
      if let _ = NSUserDefaults.standardUserDefaults().objectForKey(TotalTasksCreatedKey) {
         total = NSUserDefaults.standardUserDefaults().integerForKey(TotalTasksCreatedKey)
      }
      return total
   }
   
   
   static var firstTimeAppOpened: NSDate {
      var date = defaultFirstTimeAppOpenedDateValue
      if let _ = NSUserDefaults.standardUserDefaults().objectForKey(FirstTimeAppOpenedDateKey) {
         date = NSUserDefaults.standardUserDefaults().doubleForKey(FirstTimeAppOpenedDateKey)
      }
      
      return NSDate(timeIntervalSince1970: date)
   }
   
   static func setShowCompletedTasks(show: Bool) -> Bool
   {
      var didSet = false
      if show != showCompletedTasks {
         NSUserDefaults.standardUserDefaults().setBool(show, forKey: ShowCompletedTasksKey)
         didSet = true
      }
      return didSet
   }
   
   static func setManuallySwitchPriority(manuallySwitch: Bool) -> Bool
   {
      var didSet = false
      if manuallySwitch != manuallySwitchPriority {
         NSUserDefaults.standardUserDefaults().setBool(manuallySwitch, forKey: ManuallySwitchPriorityKey)
         didSet = true
      }
      return didSet
   }
   
   static func setUserHasOnboarded(onboarded: Bool) -> Bool {
      var didSet = false
      if onboarded != userHasOnboarded {
         NSUserDefaults.standardUserDefaults().setBool(onboarded, forKey: UserHasOnboardedKey)
         didSet = true
      }
      return didSet
   }
   
   static func setUserCreatedFirstTask(completed: Bool) -> Bool {
      var didSet = false
      if completed != userCreatedFirstTask {
         NSUserDefaults.standardUserDefaults().setBool(completed, forKey: UserCreatedFirstTaskKey)
         didSet = true
      }
      return didSet
   }
   
   static func setTotalTasksCreated(total: Int) -> Bool {
      var didSet = false
      if total != totalTasksCreated {
         NSUserDefaults.standardUserDefaults().setInteger(total, forKey: TotalTasksCreatedKey)
         didSet = true
      }
      return didSet
   }
   
   static func setFirstTimeAppOpenedIfNecessary(date: NSDate)
   {
      if NSUserDefaults.standardUserDefaults().objectForKey(FirstTimeAppOpenedDateKey) == nil {
         NSUserDefaults.standardUserDefaults().setDouble(date.timeIntervalSince1970, forKey: FirstTimeAppOpenedDateKey)
      }
   }
   
   static func incrementTotalTasksCreated()
   {
      let newTotal = totalTasksCreated + 1
      setTotalTasksCreated(newTotal)
   }
}
