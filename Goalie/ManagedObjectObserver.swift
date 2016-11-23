//
//  ManagedObjectObserver.swift
//  Goalie
//
//  Created by Gregory Klein on 12/6/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import Foundation
import CoreData

public final class ManagedObjectObserver
{
   public enum ChangeType {
   case delete
   case update
   }
   
   public init?(object: ManagedObjectType, changeHandler: @escaping (ChangeType) -> ())
   {
      guard let moc = object.managedObjectContext else { return nil }
      _objectHasBeenDeleted = !type(of: object).defaultPredicate.evaluate(with: object)
      
      _token = moc.addObjectsDidChangeNotificationObserver { [weak self] note in
         
         guard let changeType = self?.changeTypeOfObject(object, inNotification: note) else { return }
         self?._objectHasBeenDeleted = changeType == .delete
         changeHandler(changeType)
      }
   }
   
   deinit {
      NotificationCenter.default.removeObserver(_token)
   }
   
   // MARK: Private
   fileprivate var _token: NSObjectProtocol!
   fileprivate var _objectHasBeenDeleted: Bool = false
   
   fileprivate func changeTypeOfObject(_ object: ManagedObjectType, inNotification note: ObjectsDidChangeNotification) -> ChangeType?
   {
      let deleted = note.deletedObjects.union(note.invalidatedObjects)
      if note.invalidatedAllObjects || deleted.containsObjectIdenticalTo(object) {
         return .delete
      }
      let updated = note.updatedObjects.union(note.refreshedObjects)
      if updated.containsObjectIdenticalTo(object) {
         let predicate = type(of: object).defaultPredicate
         if predicate.evaluate(with: object) {
            return .update
         } else if !_objectHasBeenDeleted {
            return .delete
         }
      }
      return nil
   }

}
