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
