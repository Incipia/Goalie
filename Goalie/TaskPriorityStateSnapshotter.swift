//
//  TaskPriorityStateSnapshotter.swift
//  Goalie
//
//  Created by Gregory Klein on 1/9/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation
import CoreData

extension Date
{
   func secondsFrom(_ date:Date) -> Int{
      return (Calendar.current as NSCalendar).components(.second, from: date, to: self, options: []).second!
   }
}

class TaskPriorityStateSnapshotter
{
   fileprivate let _moc: NSManagedObjectContext
   fileprivate let _tasksDataProvider: TasksDataProvider
   
   init(moc: NSManagedObjectContext)
   {
      _moc = moc
      _tasksDataProvider = TasksDataProvider(managedObjectContext: moc)
   }
   
   func snapshotCurrentState()
   {
      var secondsUntilAdvanceDictionary: [String : Any] = [:]
      var lastTaskPriorityDictionary: [String : Any] = [:]
      
      let currentDate = Date()
      for task in _tasksDataProvider.incompletedTasks()
      {
         if let priorityDuration = task.priority.duration {
            let nextAdvanceDate = task.lastPriorityChangeDate.addingTimeInterval(priorityDuration)
            let secondsUntilAdvance = nextAdvanceDate.secondsFrom(currentDate)
            secondsUntilAdvanceDictionary[task.uuid] = secondsUntilAdvance
            lastTaskPriorityDictionary[task.uuid] = task.priority.rawValue
         }
      }
      
      print("-- TAKING SNAPSHOT --")
      print(secondsUntilAdvanceDictionary)
      print("---------------------")
      
      let secondsUntilAdvanceData = NSKeyedArchiver.archivedData(withRootObject: secondsUntilAdvanceDictionary)
      UserDefaults.standard.set(secondsUntilAdvanceData, forKey: "TaskPriorityOffsetDictionary")
      
      let lastPriorityData = NSKeyedArchiver.archivedData(withRootObject: lastTaskPriorityDictionary)
      UserDefaults.standard.set(lastPriorityData, forKey: "LastTaskPriorityDictionary")
   }
   
   func applyPreviousSnapshot()
   {
      if let secondsUntilAdvanceData = UserDefaults.standard.object(forKey: "TaskPriorityOffsetDictionary") as? Data,
         let lastPriorityData = UserDefaults.standard.object(forKey: "LastTaskPriorityDictionary") as? Data,
         let snapshotDictionary = NSKeyedUnarchiver.unarchiveObject(with: secondsUntilAdvanceData) as? [String : Any],
         let lastPriorityDictionary = NSKeyedUnarchiver.unarchiveObject(with: lastPriorityData) as? [String : Any]
      {
            print("-- APPLYING SNAPSHOT --")
            print(snapshotDictionary)
            print("-----------------------")
            
            var secondsUntilAdvanceDictionary: [Task : Int] = [:]
            for task in _tasksDataProvider.incompletedTasks()
            {
               if let lastPriorityRawValue = lastPriorityDictionary[task.uuid] as? Int {
                  let lastPriority = TaskPriority(rawValue: lastPriorityRawValue)!
                  if let secondsUntilAdvance = snapshotDictionary[task.uuid] as? Int, task.priority == lastPriority {
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
