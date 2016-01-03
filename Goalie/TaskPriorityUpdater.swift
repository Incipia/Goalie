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
 
 Ages -> Later: 1 week
 Later -> Soon: 3 days
 Soon -> ASAP: 1 day
 
 Notes:
 * Whenever a task's priority is manually set (including initial creation), a countdown
   will start for advancing it
 
 * Tasks will need to keep track of:
   - the current priority
   - the last time that the priority was changed

***/

private extension TaskPriority
{
   // The number of seconds that the priority is supposed to last for
   var duration: CGFloat {
      switch self {
      case .ASAP: return -1
      case .Soon: return (60 * 60 * 24 * 1)
      case .Later: return (60 * 60 * 24 * 3)
      case .Ages: return (60 * 60 * 24 * 7)
      }
   }
   
   var testDuration: NSTimeInterval? {
      switch self {
      case .ASAP: return nil
      case .Soon: return 5
      case .Later: return 10
      case .Ages: return 15
      }
   }
   
   var nextPriority: TaskPriority? {
      switch self {
      case .ASAP: return nil
      case .Soon: return .ASAP
      case .Later: return .Soon
      case .Ages: return .Later
      }
   }
   
   var followingPriorities: [TaskPriority] {
      var priorities: [TaskPriority] = []
      
      while let next = self.nextPriority {
         priorities.append(next)
      }
      
      return priorities
   }
}

struct TaskPriorityUpdater
{
   private var _tasksDataProvider: TasksDataProvider
   
   init(managedObjectContext: NSManagedObjectContext)
   {
      _tasksDataProvider = TasksDataProvider(managedObjectContext: managedObjectContext)
   }
   
   func updateTaskPriorities()
   {
      let currentDate = NSDate()
      for task in _tasksDataProvider.incompletedTasks()
      {
         if let nextPriority = task.priority.nextPriority,
            let currentPriorityDuration = task.priority.testDuration
         {
            let taskPriorityAdvancingDate = task.lastPriorityChangeDate.dateByAddingTimeInterval(currentPriorityDuration)
            
            print("task LCD: \(task.lastPriorityChangeDate.prettyDateString())")
            print("should advance on: \(taskPriorityAdvancingDate.prettyDateString())")
            print("current date: \(currentDate.prettyDateString())")
            if currentDate >= taskPriorityAdvancingDate
            {
               task.priority = nextPriority
            }
         }
      }
   }
}

/*
print("current: \(currentDate.prettyDateString())")
print("\(task.title) -- LCD: \(task.lastPriorityChangeDate.prettyDateString())")

print("task LCD: \(task.lastPriorityChangeDate.prettyDateString())")
print("should advance on: \(taskPriorityAdvancingDate.prettyDateString())")
print("current date: \(currentDate.prettyDateString())")
*/
