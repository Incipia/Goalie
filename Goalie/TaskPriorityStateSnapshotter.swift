//
//  TaskPriorityStateSnapshotter.swift
//  Goalie
//
//  Created by Gregory Klein on 1/9/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation
import CoreData

extension NSDate
{
   func secondsFrom(date:NSDate) -> Int{
      return NSCalendar.currentCalendar().components(.Second, fromDate: date, toDate: self, options: []).second
   }
}

class TaskPriorityStateSnapshotter
{
   private let _moc: NSManagedObjectContext
   private let _tasksDataProvider: TasksDataProvider
   
   init(moc: NSManagedObjectContext)
   {
      _moc = moc
      _tasksDataProvider = TasksDataProvider(managedObjectContext: moc)
   }
   
   func snapshotCurrentState()
   {
      var secondsUntilAdvanceDictionary: [String : AnyObject] = [:]
      var lastTaskPriorityDictionary: [String : AnyObject] = [:]
      
      let currentDate = NSDate()
      for task in _tasksDataProvider.incompletedTasks()
      {
         if let priorityDuration = task.priority.duration {
            let nextAdvanceDate = task.lastPriorityChangeDate.dateByAddingTimeInterval(priorityDuration)
            let secondsUntilAdvance = nextAdvanceDate.secondsFrom(currentDate)
            secondsUntilAdvanceDictionary[task.uuid] = secondsUntilAdvance
            lastTaskPriorityDictionary[task.uuid] = task.priority.rawValue
         }
      }
      
      print("-- TAKING SNAPSHOT --")
      print(secondsUntilAdvanceDictionary)
      print("---------------------")
      
      let secondsUntilAdvanceData = NSKeyedArchiver.archivedDataWithRootObject(secondsUntilAdvanceDictionary)
      NSUserDefaults.standardUserDefaults().setObject(secondsUntilAdvanceData, forKey: "TaskPriorityOffsetDictionary")
      
      let lastPriorityData = NSKeyedArchiver.archivedDataWithRootObject(lastTaskPriorityDictionary)
      NSUserDefaults.standardUserDefaults().setObject(lastPriorityData, forKey: "LastTaskPriorityDictionary")
   }
   
   func applyPreviousSnapshot()
   {
      if let secondsUntilAdvanceData = NSUserDefaults.standardUserDefaults().objectForKey("TaskPriorityOffsetDictionary") as? NSData,
         let lastPriorityData = NSUserDefaults.standardUserDefaults().objectForKey("LastTaskPriorityDictionary") as? NSData,
         let snapshotDictionary = NSKeyedUnarchiver.unarchiveObjectWithData(secondsUntilAdvanceData),
         let lastPriorityDictionary = NSKeyedUnarchiver.unarchiveObjectWithData(lastPriorityData)
      {
            print("-- APPLYING SNAPSHOT --")
            print(snapshotDictionary)
            print("-----------------------")
            
            var secondsUntilAdvanceDictionary: [Task : Int] = [:]
            for task in _tasksDataProvider.incompletedTasks()
            {
               if let lastPriorityRawValue = lastPriorityDictionary[task.uuid] as? Int {
                  let lastPriority = TaskPriority(rawValue: lastPriorityRawValue)!
                  if let secondsUntilAdvance = snapshotDictionary[task.uuid] as? Int where task.priority == lastPriority {
                     secondsUntilAdvanceDictionary[task] = secondsUntilAdvance
                  }
                  else {
                     task.resetLastPriorityChangeDate()
                  }
               }
            }
            
            if !secondsUntilAdvanceDictionary.isEmpty {
               _moc.performChanges({ () -> () in
                  for task in secondsUntilAdvanceDictionary.keys {
                     let secondsToAdvance = secondsUntilAdvanceDictionary[task]!
                     task.updateForPriorityAdvanceInSeconds(secondsToAdvance)
                  }
               })
            }
      }
   }
}