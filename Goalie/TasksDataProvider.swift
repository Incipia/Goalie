//
//  GoalProvider.swift
//  Goalie
//
//  Created by Gregory Klein on 12/8/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import Foundation
import CoreData
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


private extension TaskPriority
{
   static func priorityForWeight(_ weight: Float) -> TaskPriority
   {
      let roundedWeight = round(weight)
      switch roundedWeight
      {
      case 1: return .ages
      case 2: return .later
      case 3: return .soon
      case 4: return .asap
      default: return .unknown
      }
   }
   
   var weight: Float {
      switch self {
      case .unknown: return 0
      case .ages: return 1
      case .later: return 2
      case .soon: return 3
      case .asap: return 4
      }
   }
}

open class TasksDataProvider: NSObject, NSFetchedResultsControllerDelegate
{
   fileprivate var _moc: NSManagedObjectContext
   open fileprivate(set) var tasksFRC: NSFetchedResultsController<NSFetchRequestResult>
   open var contentDidChangeBlock: (() -> Void)?
   
   init(managedObjectContext: NSManagedObjectContext)
   {
      _moc = managedObjectContext
      tasksFRC = NSFetchedResultsController(fetchRequest: DefaultTasksFetchRequestProvider.fetchRequest, managedObjectContext: _moc, sectionNameKeyPath: nil, cacheName: nil)
      
      super.init()
      tasksFRC.delegate = self
      
      try! tasksFRC.performFetch()
   }
   
   var tasksASAP: [Task] {
      let allIncTasks = incompletedTasks()
      return allIncTasks.filter {
         $0.priority == .asap
      }
   }
   
   func updateFetchRequest()
   {
      NSFetchedResultsController<NSFetchRequestResult>.deleteCache(withName: tasksFRC.cacheName)
      
      var predicate: NSPredicate? = nil
      if !GoalieSettingsManager.showCompletedTasks {
         predicate = NSPredicate(format: "completed == false")
      }
      
      tasksFRC.fetchRequest.predicate = predicate
      try! tasksFRC.performFetch()
   }
   
   func allTasks() -> [Task]
   {
      return tasksFRC.fetchedObjects as? [Task] ?? []
   }
   
   func taskIsLast(_ task: Task) -> Bool
   {
      var isLast = false
      if let tasks = tasksFRC.fetchedObjects as? [Task] {
         isLast = (tasks.last == task)
      }
      
      return isLast || task.title == ""
   }
   
   func taskIsOnlyTask(_ task: Task) -> Bool
   {
      var isOnly = false
      if let tasks = tasksFRC.fetchedObjects as? [Task] {
         isOnly = tasks.count == 1
      }
      
      return isOnly
   }
   
   func taskIsFirst(_ task: Task) -> Bool
   {
      var isFirst = false
      if let tasks = tasksFRC.fetchedObjects as? [Task] {
         isFirst = (tasks.first == task)
      }
      return isFirst
   }
   
   func completedTasks() -> [Task]
   {
      var tasks: [Task] = []
      if let taskArray = tasksFRC.fetchedObjects as? [Task] {
         for task in taskArray {
            if task.completed && task.title != "" {
               tasks.append(task)
            }
         }
      }
      return tasks
   }
   
   func completedTasksWithPriority(_ priority: TaskPriority) -> [Task]
   {
      var tasks: [Task] = []
      for task in completedTasks() {
         if task.priority == priority {
            tasks.append(task)
         }
      }
      return tasks
   }
   
   func incompletedTasks() -> [Task]
   {
      var tasks: [Task] = []
      if let taskArray = tasksFRC.fetchedObjects as? [Task] {
         for task in taskArray {
            if !task.completed && task.title != "" {
               tasks.append(task)
            }
         }
      }
      return tasks
   }
   
   func incompletedTasksForPriority(_ priority: TaskPriority) -> [Task]
   {
      var tasks: [Task] = []
      for task in incompletedTasks() {
         if task.priority == priority {
            tasks.append(task)
         }
      }
      return tasks
   }
   
   func averagePriorityOLD() -> TaskPriority
   {
      var priorityDict: [TaskPriority : Int] = [.ages: 0, .later : 0, .soon : 0, .asap: 0]
      
      if let tasks = tasksFRC.fetchedObjects as? [Task] {
         for task in tasks {
            if task.title != "" && !task.completed {
               switch task.priority {
               case .ages: priorityDict[.ages] = priorityDict[.ages]! + 1
               case .later: priorityDict[.later] = priorityDict[.later]! + 1
               case .soon: priorityDict[.soon] = priorityDict[.soon]! + 1
               case .asap: priorityDict[.asap] = priorityDict[.asap]! + 1
               default: continue
               }
            }
         }
      }
      
      var maxPriorities: [TaskPriority] = []
      var avgPriority: TaskPriority? = nil
      var currentMax = 0
      
      for pri: TaskPriority in priorityDict.keys {
         let priorityCount = priorityDict[pri]!
         if  priorityCount > currentMax {
            avgPriority = pri
            currentMax = priorityCount
            maxPriorities = [pri]
         }
         else if priorityCount == currentMax && priorityCount != 0 {
            maxPriorities.append(pri)
         }
      }
      
      if maxPriorities.count > 0 {
         avgPriority = maxPriorities.first!
      }
      
      for pri in maxPriorities {
         // fix this -- task prioriteis are ordered backwards
         if pri.rawValue < avgPriority?.rawValue {
            avgPriority = pri
         }
      }
      
      return avgPriority ?? .unknown
   }
   
   func averagePriority() -> TaskPriority
   {
      var avgPriority: TaskPriority = .unknown
      if let tasks = tasksFRC.fetchedObjects as? [Task] {
         var count: Float = 0
         var avgPriorityWeight: Float = 0
         for task in tasks {
            if task.priority != .unknown && !task.completed {
               avgPriorityWeight += task.priority.weight
               count += 1
            }
         }
         
         if count > 0 {
            avgPriorityWeight /= count
            avgPriority = TaskPriority.priorityForWeight(avgPriorityWeight)
         }
      }
      return avgPriority
   }
   
}

extension TasksDataProvider
{
   public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
   {
      contentDidChangeBlock?()
   }
}
