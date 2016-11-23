//
//  AllGoalsTableViewDelegate.swift
//  Goalie
//
//  Created by Gregory Klein on 12/4/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit
import CoreData

class TableViewDelegate<Data: DataProviderProtocol, Delegate: TableViewDelegateProtocol>: NSObject, UITableViewDelegate where Data.Object: ManagedObject, Data.Object == Delegate.Object
{
   fileprivate var _tableView: UITableView
   fileprivate var _dataProvider: Data
   fileprivate var _delegate: Delegate
   
   fileprivate var _deleteIndexPath: IndexPath?
   
   var useAutomaticRowHeight = false
   var editActions: [UITableViewRowAction]?
   var didScrollBlock: ((_ scrollView: UIScrollView) -> Void)?
   
   init(tableView: UITableView, dataProvider: Data, delegate: Delegate)
   {
      _tableView = tableView
      _tableView.rowHeight = UITableViewAutomaticDimension
      _dataProvider = dataProvider
      _delegate = delegate
      
      super.init()
      
      _tableView.allowsMultipleSelectionDuringEditing = false
      tableView.delegate = self
   }
   
   func updateBackgroundPattern()
   {
      var rowFrames: [CGRect] = []
      for cellIndex in 0..<_dataProvider.numberOfItemsInSection(0) {
         let indexPath = IndexPath(row: cellIndex, section: 0)
         if let cell = _tableView.cellForRow(at: indexPath) {
            cell.layoutIfNeeded()
            rowFrames.append(cell.frame)
         }
      }
      
      let defaultHeight = _delegate.heightForRowAtIndexPath(IndexPath(row: 0, section: 0))
      let patternImage = UIImage.patternImageForFrames(rowFrames, width: _tableView.bounds.width, firstColor: UIColor.red, secondColor: UIColor.blue, extraRows: 10, defaultHeight: defaultHeight)
      _tableView.backgroundColor = UIColor(patternImage: patternImage)
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
   {
      let object = _dataProvider.objectAtIndexPath(indexPath)
      _tableView.deselectRow(at: indexPath, animated: true)
      _delegate.objectSelected(object)
   }
   
   func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
      return editActions
   }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
   {
      return useAutomaticRowHeight ? UITableViewAutomaticDimension : _delegate.heightForRowAtIndexPath(indexPath)
   }
   
   func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
   {
      return useAutomaticRowHeight ? UITableViewAutomaticDimension : _delegate.heightForRowAtIndexPath(indexPath)
   }
   
   func scrollViewDidScroll(_ scrollView: UIScrollView)
   {
      didScrollBlock?(scrollView)
   }
}
