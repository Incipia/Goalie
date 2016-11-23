//
//  NSManagedObjectContext+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/4/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import CoreData

extension NSManagedObjectContext
{
   func insertObject<T: ManagedObject>() -> T where T: ManagedObjectType
   {
      guard let obj = NSEntityDescription.insertNewObject(forEntityName: T.entityName, into: self) as? T else {
         fatalError("Wrong object type")
      }
      return obj
   }
   
   func saveOrRollback() -> Bool
   {
      var didSave = true
      do {
         try save()
      } catch {
         rollback()
         didSave = false
      }
      return didSave
   }
   
   func performChanges(_ block: @escaping () -> ())
   {
      perform {
         block()
         self.saveOrRollback()
      }
   }
}
