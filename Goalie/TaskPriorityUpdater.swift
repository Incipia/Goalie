//
//  TaskPriorityUpdater.swift
//  Goalie
//
//  Created by Gregory Klein on 1/2/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation
import CoreData

/***
 
 The task priority updating logic is as follows:
 
 Ages -> Later: 5 days
 Later -> Soon: 3 days
 Soon -> ASAP: 1 day
 
 Notes:
 * Whenever a task's priority is manually set (including initial creation), a countdown
 will start for advancing it
 
 * Tasks will need to keep track of:
 - the current priority
 - the last time that the priority was changed
 
 ***/

extension TaskPriority
{
   // The number of seconds that the priority is supposed to last for
   var duration: TimeInterval? {
      switch self {
      case .asap: return nil
      case .soon: return (60 * 60 * 24 * 1)
      case .later: return (60 * 60 * 24 * 3)
      case .ages: return (60 * 60 * 24 * 5)
      case .unknown: return nil
      }
   }
   
   var durationToASAP: TimeInterval? {
      guard self != .unknown else { return nil }
      guard let duration = duration else { return 0 }
      return followingPriorities.reduce(duration, { (sum, taskPriority) -> TimeInterval in
         let dur = taskPriority.duration ?? 0
         return sum + dur
      })
      
   }
   
   var testDuration: TimeInterval? {
      switch self {
      case .asap: return nil
      case .soon: return 5
      case .later: return 10
      case .ages: return 15
      case .unknown: return nil
      }
   }
   
   var nextPriority: TaskPriority? {
      switch self {
      case .asap: return nil
      case .soon: return .asap
      case .later: return .soon
      case .ages: return .later
      case .unknown: return nil
      }
   }
   
   var followingPriorities: [TaskPriority] {
      var priorities: [TaskPriority] = []
      
      var current = self
      while let next = current.nextPriority {
         priorities.append(next)
         current = next
      }
      
      return priorities
   }
}

struct TaskPriorityUpdater
{
   fileprivate var _tasksDataProvider: TasksDataProvider
   fileprivate var _moc: NSManagedObjectContext
   
   init(managedObjectContext: NSManagedObjectContext)
   {
      _tasksDataProvider = TasksDataProvider(managedObjectContext: managedObjectContext)
      _moc = managedObjectContext
   }
   
   func updateTaskPriorities()
   {
      var updatedTaskPrioritesDictionary: [Task : TaskPriority] = [:]
      for task in self._tasksDataProvider.incompletedTasks()
      {
         let currentDate = Date()
         var newPriority: TaskPriority? = task.priority
         
         var possibleNewPriorities = [task.priority]
         possibleNewPriorities.append(contentsOf: task.priority.followingPriorities)
         
         var aggregatedDuration: TimeInterval = 0
         for priority in possibleNewPriorities
         {
            if let priorityDuration = priority.duration
            {
               aggregatedDuration += priorityDuration
               let taskPriorityAdvanceDate = task.lastPriorityChangeDate.addingTimeInterval(aggregatedDuration)
               
//               print("---------- TASK: \(task.title) --------------")
//               print("LCD: \(task.lastPriorityChangeDate.prettyDateString())")
//               print("should advance on: \(taskPriorityAdvanceDate.prettyDateString())")
//               print("current date: \(currentDate.prettyDateString())")
//               print("")
               
               if currentDate >= taskPriorityAdvanceDate as Date {
                  newPriority = priority.nextPriority
               }
            }
         }
         
         if let updatedTaskPriority = newPriority, updatedTaskPriority != task.priority {
            updatedTaskPrioritesDictionary[task] = updatedTaskPriority
         }
      }
      
      if !updatedTaskPrioritesDictionary.isEmpty {
         _moc.performChanges({ () -> () in
            for task in updatedTaskPrioritesDictionary.keys {
               task.priority = updatedTaskPrioritesDictionary[task]!
            }
         })
      }
   }
}
