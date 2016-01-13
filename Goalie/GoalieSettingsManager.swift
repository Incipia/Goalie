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
private let UserCompletedFirstTaskKey = "GoalieUserCompletedFirstTaskKey"

private let defaultShowCompletedTasksValue = true
private let defaultManuallySwitchPriorityValue = false
private let defaultUserHasOnboardedValue = false
private let defaultUserCompletedFirstTask = false

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
   
   static var userCompletedFirstTask: Bool {
      var copmletedFirst = defaultUserCompletedFirstTask
      if let _ = NSUserDefaults.standardUserDefaults().objectForKey(UserCompletedFirstTaskKey) {
         copmletedFirst = NSUserDefaults.standardUserDefaults().boolForKey(UserCompletedFirstTaskKey)
      }
      return copmletedFirst
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
   
   static func setUserCompletedFirstTask(completed: Bool) -> Bool {
      var didSet = false
      if completed != userCompletedFirstTask {
         NSUserDefaults.standardUserDefaults().setBool(completed, forKey: UserCompletedFirstTaskKey)
         didSet = true
      }
      return didSet
   }
}
