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


private let storeURL = URL.documentsURL.appendingPathComponent("Goalie.goalie")

public func createGoalieMainContext() -> NSManagedObjectContext
{
   let path = Bundle.main.path(forResource: "Task", ofType: "momd")
   let momURL = URL(fileURLWithPath: path!)
   guard let model = NSManagedObjectModel(contentsOf: momURL) else {
      fatalError("model not found")
   }
   
   let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
   try! psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
   
   let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
   context.persistentStoreCoordinator = psc
   
   return context
}
