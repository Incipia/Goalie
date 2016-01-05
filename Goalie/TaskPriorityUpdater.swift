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
   var duration: NSTimeInterval? {
      switch self {
      case .ASAP: return nil
      case .Soon: return (60 * 60 * 24 * 1)
      case .Later: return (60 * 60 * 24 * 3)
      case .Ages: return (60 * 60 * 24 * 7)
      case .Unknown: return nil
      }
   }
   
   var testDuration: NSTimeInterval? {
      switch self {
      case .ASAP: return nil
      case .Soon: return 5
      case .Later: return 10
      case .Ages: return 15
      case .Unknown: return nil
      }
   }
   
   var nextPriority: TaskPriority? {
      switch self {
      case .ASAP: return nil
      case .Soon: return .ASAP
      case .Later: return .Soon
      case .Ages: return .Later
      case .Unknown: return nil
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
   private var _tasksDataProvider: TasksDataProvider
   private var _moc: NSManagedObjectContext
   
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
         let currentDate = NSDate()
         var newPriority: TaskPriority? = task.priority
         
         var possibleNewPriorities = [task.priority]
         possibleNewPriorities.appendContentsOf(task.priority.followingPriorities)
         
         var aggregatedDuration: NSTimeInterval = 0
         for priority in possibleNewPriorities
         {
            if let priorityDuration = priority.duration
            {
               aggregatedDuration += priorityDuration
               let taskPriorityAdvanceDate = task.lastPriorityChangeDate.dateByAddingTimeInterval(aggregatedDuration)
               
               if currentDate >= taskPriorityAdvanceDate {
                  newPriority = priority.nextPriority
               }
            }
         }
         
         if let updatedTaskPriority = newPriority where updatedTaskPriority != task.priority {
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

/*
print("---------- TASK: \(task.title) --------------")
print("task LCD: \(task.lastPriorityChangeDate.prettyDateString())")
print("should advance on: \(taskPriorityAdvanceDate.prettyDateString())")
print("current date: \(currentDate.prettyDateString())")
print("")
*/