//
//  DataRelatedProtocols.swift
//  Goalie
//
//  Created by Gregory Klein on 12/4/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import Foundation
import CoreData

protocol ManagedObjectContextSettable: class
{
   var moc: NSManagedObjectContext! {get set}
}

public protocol ManagedObjectType: class
{
   static var entityName: String {get}
   static var defaultSortDescriptors: [NSSortDescriptor] {get}
   static var defaultPredicate: NSPredicate {get}
   var managedObjectContext: NSManagedObjectContext? { get }
}

extension ManagedObjectType
{  
   public static var defaultSortDescriptors: [NSSortDescriptor] {
      return []
   }
   
   public static var defaultPredicate: NSPredicate {
      return NSPredicate(value: true)
   }
   
   public static var sortedFetchRequest: NSFetchRequest<NSFetchRequestResult> {
      let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
      request.predicate = defaultPredicate
      request.sortDescriptors = defaultSortDescriptors
      return request
   }
}
