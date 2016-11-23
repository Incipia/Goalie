//
//  Task.swift
//  Goalie
//
//  Created by Gregory Klein on 12/28/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit
import CoreData

public final class Task: ManagedObject
{
   @NSManaged public fileprivate(set) var uuid: String
   @NSManaged public var title: String
   @NSManaged public var creationDate: Date
   @NSManaged public fileprivate(set) var lastPriorityChangeDate: Date
   @NSManaged public fileprivate(set) var priorityValue: Int16
   @NSManaged public var completed: Bool
   
   var priority: TaskPriority {
      get {
         return TaskPriority(rawValue: Int(priorityValue))!
      }
      set {
         let newPriorityValue = Int16(newValue.rawValue)
         if priorityValue != newPriorityValue {
            priorityValue = newPriorityValue
            lastPriorityChangeDate = Date()
         }
      }
   }
   
   func resetLastPriorityChangeDate()
   {
      lastPriorityChangeDate = Date()
   }
   
   func updateForPriorityAdvanceInSeconds(_ seconds: Int)
   {
      if let priorityDuration = priority.duration {
         var newLastPriorityChangeDate = Date().addingTimeInterval(-priorityDuration)
         newLastPriorityChangeDate = newLastPriorityChangeDate.addingTimeInterval(Double(seconds))
         lastPriorityChangeDate = newLastPriorityChangeDate
      }
   }
   
   public static func insertEmptyTaskIntoContext(_ moc: NSManagedObjectContext) -> Task
   {
      let task: Task = moc.insertObject()
      return task
   }
   
   public override func awakeFromInsert()
   {
      title = ""
      priority = .unknown
      creationDate = Date()
      lastPriorityChangeDate = Date()
      uuid = UUID().uuidString
   }
   
   public func swapWithTask(_ task: Task)
   {
      managedObjectContext?.perform({ () -> Void in
         
         let newUUID = task.uuid
         let newTitle = task.title
         let newCreationDate = task.creationDate
         let newLPR = task.lastPriorityChangeDate
         let newPriorityValue = task.priorityValue
         
         task.uuid = self.uuid
         task.title = self.title
         task.creationDate = self.creationDate
         task.lastPriorityChangeDate = self.lastPriorityChangeDate
         task.priorityValue = self.priorityValue
         
         self.uuid = newUUID
         self.title = newTitle
         self.creationDate = newCreationDate
         self.lastPriorityChangeDate = newLPR
         self.priorityValue = newPriorityValue
      })
   }
}

extension Task: ManagedObjectType
{
   public static var entityName: String {
      return "Task"
   }
   
   public static var defaultSortDescriptors: [NSSortDescriptor] {
      return [
         NSSortDescriptor(key: "priorityValue", ascending: true),
         NSSortDescriptor(key: "completed", ascending: true), // this may be causing issues
         NSSortDescriptor(key: "creationDate", ascending: true)
      ]
   }
   
   public func delete()
   {
      managedObjectContext?.performChanges({ () -> () in
         self.managedObjectContext?.delete(self)
      })
   }
   
   public func deleteWithCompletion(_ completion: (() -> Void)?)
   {
      managedObjectContext?.performChanges({ () -> () in
         self.managedObjectContext?.delete(self)
         completion?()
      })
   }
   
   public func save()
   {
      managedObjectContext?.saveOrRollback()
   }
}
