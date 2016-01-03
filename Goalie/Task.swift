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
   @NSManaged public private(set) var creationDate: NSDate
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
   
   public static func insertIntoContext(moc: NSManagedObjectContext, title: String) -> Task
   {
      let task: Task = moc.insertObject()
      task.title = title
      return task
   }
   
   public static func insertIntoContext(moc: NSManagedObjectContext, title: String, priority: TaskPriority) -> Task
   {
      let task: Task = moc.insertObject()
      task.title = title
      task.priority = priority
      return task
   }
   
   public override func awakeFromInsert()
   {
      title = ""
      priority = .Ages
      creationDate = NSDate()
      uuid = NSUUID().UUIDString
      lastPriorityChangeDate = NSDate()
   }
}

extension Task: ManagedObjectType
{
   public static var entityName: String {
      return "Task"
   }
   
   public static var defaultSortDescriptors: [NSSortDescriptor] {
      return [NSSortDescriptor(key: "priorityValue", ascending: true), NSSortDescriptor(key: "creationDate", ascending: true)]
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
   
   public func copyTaskWithContext(context: NSManagedObjectContext)
   {
      context.performChanges({ () -> () in
         let newTitle = "\(self.title) copy"
         Task.insertIntoContext(context, title: newTitle, priority: self.priority)
      })
   }
}