//
//  FetchedResultsDataProvider.swift
//  Goalie
//
//  Created by Gregory Klein on 12/4/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import CoreData

class FetchedResultsDataProvider<Delegate: DataProviderDelegate>: NSObject, NSFetchedResultsControllerDelegate, DataProviderProtocol
{
   fileprivate weak var _delegate: Delegate!
   fileprivate let _fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>
   fileprivate var _updates: [DataProviderUpdate<Object>] = []
   
   typealias Object = Delegate.Object
   
   init(fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>, delegate: Delegate)
   {
      _fetchedResultsController = fetchedResultsController
      _delegate = delegate
      super.init()
      
      _fetchedResultsController.delegate = self
      try! _fetchedResultsController.performFetch()
   }
   
   func updateFetchRequest()
   {
      NSFetchedResultsController<NSFetchRequestResult>.deleteCache(withName: _fetchedResultsController.cacheName)

      var predicate: NSPredicate? = nil
      if !GoalieSettingsManager.showCompletedTasks {
         predicate = NSPredicate(format: "completed == false")
      }
      
      _fetchedResultsController.fetchRequest.predicate = predicate
      try! _fetchedResultsController.performFetch()
   }
   
   func objectAtIndexPath(_ indexPath: IndexPath) -> Object
   {
      guard let result = _fetchedResultsController.object(at: indexPath) as? Object else { fatalError("Unexpected object at \(indexPath)") }
      return result
   }
   
   func numberOfItemsInSection(_ section: Int) -> Int
   {
      guard let sec = _fetchedResultsController.sections?[section] else { return 0 }
      return sec.numberOfObjects
   }
   
   func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
   {
      _updates = []
   }
   
   func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
   {
      switch type
      {
      case .insert:
         guard let indexPath = newIndexPath else { fatalError("Index path should be not nil") }
         _updates.append(.insert(indexPath))
      case .update:
         guard let indexPath = indexPath else { fatalError("Index path should be not nil") }
         let object = objectAtIndexPath(indexPath)
         _updates.append(.update(indexPath, object))
      case .move:
         guard let indexPath = indexPath else { fatalError("Index path should be not nil") }
         guard let newIndexPath = newIndexPath else { fatalError("New index path should be not nil") }
         _updates.append(.move(indexPath, newIndexPath))
      case .delete:
         guard let indexPath = indexPath else { fatalError("Index path should be not nil") }
         _updates.append(.delete(indexPath))
      }
   }
   
   func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
   {
      _delegate.dataProviderDidUpdate(_updates)
   }
}
