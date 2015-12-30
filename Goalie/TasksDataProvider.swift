//
//  GoalProvider.swift
//  Goalie
//
//  Created by Gregory Klein on 12/8/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import Foundation
import CoreData

public class TasksDataProvider: NSObject, NSFetchedResultsControllerDelegate
{
   private var _moc: NSManagedObjectContext
   public private(set) var tasksFRC: NSFetchedResultsController
   public var contentDidChangeBlock: (() -> Void)?
   
   init(managedObjectContext: NSManagedObjectContext)
   {
      _moc = managedObjectContext
      tasksFRC = NSFetchedResultsController(fetchRequest: DefaultTasksFetchRequestProvider.fetchRequest, managedObjectContext: _moc, sectionNameKeyPath: nil, cacheName: nil)
      
      super.init()
      tasksFRC.delegate = self
      
      try! tasksFRC.performFetch()
   }
   
   func taskIsLast(task: Task) -> Bool
   {
      var isLast = false
      if let tasks = tasksFRC.fetchedObjects as? [Task] {
         isLast = (tasks.last == task)
      }
      
      return isLast || task.title == ""
   }
   
   func taskIsOnlyTask(task: Task) -> Bool
   {
      var isOnly = false
      if let tasks = tasksFRC.fetchedObjects as? [Task] {
         isOnly = tasks.count == 1
      }
      
      return isOnly
   }
   
   func taskIsFirst(task: Task) -> Bool
   {
      var isFirst = false
      if let tasks = tasksFRC.fetchedObjects as? [Task] {
         isFirst = (tasks.first == task)
      }
      return isFirst
   }
   
   func averagePriority() -> TaskPriority?
   {
      var priorityDict: [TaskPriority : Int] = [.Ages: 0, .Later : 0, .Soon : 0, .ASAP: 0]
      
      if let tasks = tasksFRC.fetchedObjects as? [Task] {
         for task in tasks {
            if task.title != "" {
               switch task.priority {
               case .Ages: priorityDict[.Ages] = priorityDict[.Ages]! + 1
               case .Later: priorityDict[.Later] = priorityDict[.Later]! + 1
               case .Soon: priorityDict[.Soon] = priorityDict[.Soon]! + 1
               case .ASAP: priorityDict[.ASAP] = priorityDict[.ASAP]! + 1
               }
            }
         }
      }
      
      var maxPriorities: [TaskPriority] = []
      var avgPri: TaskPriority? = nil
      var currentMax = 0
      
      for pri: TaskPriority in priorityDict.keys {
         let priCount = priorityDict[pri]!
         if  priCount > currentMax {
            avgPri = pri
            currentMax = priCount
            maxPriorities = [pri]
         }
         else if priCount == currentMax && priCount != 0 {
            maxPriorities.append(pri)
         }
      }
      
      if maxPriorities.count > 0 {
         avgPri = maxPriorities.first!
      }
      
      for pri in maxPriorities {
         // fix this -- task prioriteis are ordered backwards
         if pri.rawValue < avgPri?.rawValue {
            avgPri = pri
         }
      }
      
      return avgPri
   }
}

extension TasksDataProvider
{
   public func controllerDidChangeContent(controller: NSFetchedResultsController)
   {
      NSFetchedResultsController.deleteCacheWithName(tasksFRC.cacheName)
      do { try tasksFRC.performFetch() } catch { fatalError("fetch request failed") }
      contentDidChangeBlock?()
   }
}
