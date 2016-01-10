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

private let defaultShowCompletedTasksValue = true
private let defaultManuallySwitchPriorityValue = false

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
}
