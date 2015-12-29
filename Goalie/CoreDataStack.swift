//
//  CoreDataStack.swift
//  Goalie
//
//  Created by Gregory Klein on 12/4/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import CoreData
import Foundation
import UIKit


private let storeURL = NSURL.documentsURL.URLByAppendingPathComponent("Goalie.goalie")

public func createGoalieMainContext() -> NSManagedObjectContext
{
   let path = NSBundle.mainBundle().pathForResource("Task", ofType: "momd")
   let momURL = NSURL(fileURLWithPath: path!)
   guard let model = NSManagedObjectModel(contentsOfURL: momURL) else {
      fatalError("model not found")
   }
   
   let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
   try! psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
   
   let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
   context.persistentStoreCoordinator = psc
   
   return context
}
