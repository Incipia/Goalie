//
//  TaskPriorityStateSnapshotter.swift
//  Goalie
//
//  Created by Gregory Klein on 1/9/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation
import CoreData

class TaskPriorityStateSnapshotter
{
   private let _tasksDataProvider: TasksDataProvider
   
   init(moc: NSManagedObjectContext)
   {
      _tasksDataProvider = TasksDataProvider(managedObjectContext: moc)
   }
   
   func snapshotCurrentState()
   {
   }
   
   func applyPreviousSnapshot()
   {
   }
}