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
   @NSManaged public private(set) var uuid: String
   @NSManaged public var title: String
   @NSManaged public var creationDate: NSDate
   @NSManaged public private(set) var lastPriorityChangeDate: NSDate
   @NSManaged public private(set) var priorityValue: Int16
   @NSManaged public var completed: Bool
   
   var priority: TaskPriority {
      get {
         return TaskPriority(rawValue: Int(priorityValue))!
      }
      set {
         let newPriorityValue = Int16(newValue.rawValue)
         if priorityValue != newPriorityValue {
            priorityValue = newPriorityValue
            lastPriorityChangeDate = NSDate()
         }
      }
   }
   
   func resetLastPriorityChangeDate()
   {
      lastPriorityChangeDate = NSDate()
   }
   
   func updateForPriorityAdvanceInSeconds(seconds: Int)
   {
      if let priorityDuration = priority.duration {
         var newLastPriorityChangeDate = NSDate().dateByAddingTimeInterval(-priorityDuration)
         newLastPriorityChangeDate = newLastPriorityChangeDate.dateByAddingTimeInterval(Double(seconds))
         lastPriorityChangeDate = newLastPriorityChangeDate
      }
   }
   
   public static func insertEmptyTaskIntoContext(moc: NSManagedObjectContext) -> Task
   {
      let task: Task = moc.insertObject()
      return task
   }
   
   public override func awakeFromInsert()
   {
      title = ""
      priority = .Unknown
      creationDate = NSDate()
      lastPriorityChangeDate = NSDate()
      uuid = NSUUID().UUIDString
   }
   
   public func swapWithTask(task: Task)
   {
      managedObjectContext?.performBlock({ () -> Void in
         
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
         self.managedObjectContext?.deleteObject(self)
      })
   }
   
   public func deleteWithCompletion(completion: (() -> Void)?)
   {
      managedObjectContext?.performChanges({ () -> () in
         self.managedObjectContext?.deleteObject(self)
         completion?()
      })
   }
   
   public func save()
   {
      managedObjectContext?.saveOrRollback()
   }
}