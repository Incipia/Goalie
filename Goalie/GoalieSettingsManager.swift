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
private let defaultFirstTimeAppOpenedDateValue = Date().timeIntervalSince1970

struct GoalieSettingsManager
{
   static var showCompletedTasks: Bool {
      var show = defaultShowCompletedTasksValue
      if let _ = UserDefaults.standard.object(forKey: ShowCompletedTasksKey) {
         show = UserDefaults.standard.bool(forKey: ShowCompletedTasksKey)
      }
      return show
   }
   
   static var manuallySwitchPriority: Bool {
      var manuallySwitch = defaultManuallySwitchPriorityValue
      if let _ = UserDefaults.standard.object(forKey: ManuallySwitchPriorityKey) {
         manuallySwitch = UserDefaults.standard.bool(forKey: ManuallySwitchPriorityKey)
      }
      return manuallySwitch
   }
   
   static var userHasOnboarded: Bool {
      var hasOnboarded = defaultUserHasOnboardedValue
      if let _ = UserDefaults.standard.object(forKey: UserHasOnboardedKey) {
         hasOnboarded = UserDefaults.standard.bool(forKey: UserHasOnboardedKey)
      }
      return hasOnboarded
   }
   
   static var userCreatedFirstTask: Bool {
      var copmletedFirst = defaultUserCompletedFirstTask
      if let _ = UserDefaults.standard.object(forKey: UserCreatedFirstTaskKey) {
         copmletedFirst = UserDefaults.standard.bool(forKey: UserCreatedFirstTaskKey)
      }
      return copmletedFirst
   }
   
   static var totalTasksCreated: Int {
      var total = defaultTotalTasksCreatedValue
      if let _ = UserDefaults.standard.object(forKey: TotalTasksCreatedKey) {
         total = UserDefaults.standard.integer(forKey: TotalTasksCreatedKey)
      }
      return total
   }
   
   
   static var firstTimeAppOpened: Date {
      var date = defaultFirstTimeAppOpenedDateValue
      if let _ = UserDefaults.standard.object(forKey: FirstTimeAppOpenedDateKey) {
         date = UserDefaults.standard.double(forKey: FirstTimeAppOpenedDateKey)
      }
      
      return Date(timeIntervalSince1970: date)
   }
   
   static func setShowCompletedTasks(_ show: Bool) -> Bool
   {
      var didSet = false
      if show != showCompletedTasks {
         UserDefaults.standard.set(show, forKey: ShowCompletedTasksKey)
         didSet = true
      }
      return didSet
   }
   
   static func setManuallySwitchPriority(_ manuallySwitch: Bool) -> Bool
   {
      var didSet = false
      if manuallySwitch != manuallySwitchPriority {
         UserDefaults.standard.set(manuallySwitch, forKey: ManuallySwitchPriorityKey)
         didSet = true
      }
      return didSet
   }
   
   static func setUserHasOnboarded(_ onboarded: Bool) -> Bool {
      var didSet = false
      if onboarded != userHasOnboarded {
         UserDefaults.standard.set(onboarded, forKey: UserHasOnboardedKey)
         didSet = true
      }
      return didSet
   }
   
   static func setUserCreatedFirstTask(_ completed: Bool) -> Bool {
      var didSet = false
      if completed != userCreatedFirstTask {
         UserDefaults.standard.set(completed, forKey: UserCreatedFirstTaskKey)
         didSet = true
      }
      return didSet
   }
   
   static func setTotalTasksCreated(_ total: Int) -> Bool {
      var didSet = false
      if total != totalTasksCreated {
         UserDefaults.standard.set(total, forKey: TotalTasksCreatedKey)
         didSet = true
      }
      return didSet
   }
   
   static func setFirstTimeAppOpenedIfNecessary(_ date: Date)
   {
      if UserDefaults.standard.object(forKey: FirstTimeAppOpenedDateKey) == nil {
         UserDefaults.standard.set(date.timeIntervalSince1970, forKey: FirstTimeAppOpenedDateKey)
      }
   }
   
   static func incrementTotalTasksCreated()
   {
      let newTotal = totalTasksCreated + 1
      setTotalTasksCreated(newTotal)
   }
}
