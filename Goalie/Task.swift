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
}