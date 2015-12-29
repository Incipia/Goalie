//
//  GoalProvider.swift
//  Goalie
//
//  Created by Gregory Klein on 12/8/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import Foundation
import CoreData

class TasksDataProvider: NSObject, NSFetchedResultsControllerDelegate
{
   private var _moc: NSManagedObjectContext
   private var _tasksFRC: NSFetchedResultsController
   
   init(managedObjectContext: NSManagedObjectContext)
   {
      _moc = managedObjectContext
      _tasksFRC = NSFetchedResultsController(fetchRequest: DefaultTasksFetchRequestProvider.fetchRequest, managedObjectContext: _moc, sectionNameKeyPath: nil, cacheName: nil)
      
      super.init()
      _tasksFRC.delegate = self
      
      try! _tasksFRC.performFetch()
   }
   
//   func parentGoalsInMonth(month: Month) -> [Goal]
//   {
//      var parentGoals: [Goal] = []
//      if let fetchedGoals = _parentGoalsFRC.fetchedObjects as? [Goal] {
//         for goal in fetchedGoals {
//            if goal.month == month {
//               parentGoals.append(goal)
//            }
//         }
//      }
//      return parentGoals
//   }
}

extension TasksDataProvider
{
   func controllerDidChangeContent(controller: NSFetchedResultsController)
   {
      NSFetchedResultsController.deleteCacheWithName(_tasksFRC.cacheName)
      do { try _tasksFRC.performFetch() } catch { fatalError("fetch request failed") }
   }
}
