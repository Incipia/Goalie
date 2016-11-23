//
//  TableViewDataSource.swift
//  Goalie
//
//  Created by Gregory Klein on 12/4/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

class TableViewDataSource<Delegate: DataSourceDelegate, Data: DataProviderProtocol, Cell: UITableViewCell>: NSObject, UITableViewDataSource where Delegate.Object: ManagedObject, Delegate.Object == Data.Object, Cell: ConfigurableCell, Cell.DataSource == Data.Object
{
   fileprivate let _tableView: UITableView
   fileprivate let _dataProvider: Data
   fileprivate weak var _delegate: Delegate!
   
   var selectedObject: Data.Object? {
      guard let indexPath = _tableView.indexPathForSelectedRow else {
         return nil
      }
      return _dataProvider.objectAtIndexPath(indexPath)
   }
   var saveOnDelete = true
   var allowEditingLast = true
   fileprivate var _isUpdating = false
   
   required init(tableView: UITableView, dataProvider: Data, delegate: Delegate)
   {
      _tableView = tableView
      _dataProvider = dataProvider
      _delegate = delegate
      super.init()
      
      tableView.dataSource = self
      tableView.reloadData()
   }
   
   func processUpdates(_ updates: [DataProviderUpdate<Data.Object>]?, animationBlock: ((Void) -> Void)?, completion: (() -> ())?)
   {
      guard let updates = updates else { return _tableView.reloadData() }
      
      CATransaction.begin()
      CATransaction.setCompletionBlock { () -> Void in
         completion?()
      }
      
      self._tableView.beginUpdates()
      for update in updates
      {
         switch update
         {
         case .insert(let indexPath):
            self._tableView.insertRows(at: [indexPath], with: .fade)
         case .update(let indexPath, let object):
            guard let cell = self._tableView.cellForRow(at: indexPath) as? Cell else {
               break
            }
            cell.configureForObject(object, atIndexPath: indexPath)
         case .move(let indexPath, let newIndexPath):
            self._tableView.deleteRows(at: [indexPath], with: .fade)
            self._tableView.insertRows(at: [newIndexPath], with: .fade)
         case .delete(let indexPath):
            self._tableView.deleteRows(at: [indexPath], with: .fade)
         }
      }
      
      self._tableView.endUpdates()
      animationBlock?()
      
      CATransaction.commit()
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
      return _dataProvider.numberOfItemsInSection(section)
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
   {
      let object = _dataProvider.objectAtIndexPath(indexPath)
      let identifier = _delegate.cellIdentifierForObject(object)
      guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell else {
         fatalError("Unexpected cell type at \(indexPath)")
      }
      
      _delegate.configureCell(cell, atIndexPath: indexPath)
      cell.configureForObject(object, atIndexPath: indexPath)
      return cell
   }
   
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete
      {
         let goal = _dataProvider.objectAtIndexPath(indexPath)
         if saveOnDelete {
            goal.managedObjectContext?.performChanges({ () -> () in
               goal.managedObjectContext?.delete(goal)
            })
         }
         else {
            goal.managedObjectContext?.delete(goal)
         }
         SFXPlayer.playDeleteSound()
      }
   }
   
   func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
   {
      var canEdit = true
      if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 && !allowEditingLast {
         canEdit = false
      }
      return canEdit
   }
   
   func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
   {
      var canEdit = true
      if _dataProvider.numberOfItemsInSection(0) - 1 == indexPath.row ||
         _dataProvider.numberOfItemsInSection(0) <= 2 {
         canEdit = false
      }
      return canEdit
   }
}
