//
//  MainTasksViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 12/28/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit
import CoreData

class MainTasksViewController: UIViewController, ManagedObjectContextSettable
{
   var moc: NSManagedObjectContext!
   @IBOutlet private weak var _goalieTableView: GoalieTableView!
   
   private typealias DataProvider = FetchedResultsDataProvider<MainTasksViewController>
   private var _tableViewDataSource: TableViewDataSource<MainTasksViewController, DataProvider, TasksTableViewCell>!
   private var _dataProvider: DataProvider!
   private var _tableViewDelegate: TableViewDelegate<DataProvider, MainTasksViewController>!
   
   private var _defaultFRC: NSFetchedResultsController {
      return NSFetchedResultsController(fetchRequest: DefaultTasksFetchRequestProvider.fetchRequest, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
   }
   
   private var _shouldGiveNextCreatedCellFocus = false
   private var _currentTaskCell: TasksTableViewCell?
   
   private var _emptyTaskAtBottom: Bool {
      var emptyTaskAtBottom = true
      if let lastIndexPath = _goalieTableView.lastIndexPath {
         let task = _dataProvider.objectAtIndexPath(lastIndexPath)
         emptyTaskAtBottom = task.title == ""
      }
      else if _goalieTableView.numberOfRowsInSection(0) == 0 {
         emptyTaskAtBottom = false
      }
      return emptyTaskAtBottom
   }
   
   // Mark: - Lifecycle
   override func viewDidLoad()
   {
      super.viewDidLoad()
      _setupTableViewDataSourceAndDelegate()
   }
   
   override func viewWillAppear(animated: Bool)
   {
      _goalieTableView.reloadData()
      
      if !_emptyTaskAtBottom {
         Task.insertIntoContext(moc, title: "")
      }
   }
   
   override func preferredStatusBarStyle() -> UIStatusBarStyle
   {
      return .LightContent
   }
   
   // Mark: - Private
   private func _setupTableViewDataSourceAndDelegate()
   {
      _dataProvider = FetchedResultsDataProvider(fetchedResultsController: _defaultFRC, delegate: self)
      _tableViewDataSource = TableViewDataSource(tableView: _goalieTableView, dataProvider: _dataProvider, delegate: self)
      _tableViewDataSource.allowEditingLast = false
      
      _tableViewDelegate = TableViewDelegate(tableView: _goalieTableView, dataProvider: _dataProvider, delegate: self)
      _tableViewDelegate.useAutomaticRowHeight = false
      _tableViewDelegate.didScrollBlock = { (scrollView: UIScrollView) in
         self._tableViewDidScroll(scrollView)
      }
   }
   
   private func _tableViewDidScroll(scrollView: UIScrollView)
   {
      if scrollView.contentOffset.y < -_defaultHeaderHeight {
         scrollView.contentOffset = CGPoint(x: 0, y: -_defaultHeaderHeight)
      }
      _goalieTableView.updateHeaderViewFrame()
   }
   
   private func _taskCellForIndexPath(indexPath: NSIndexPath) -> TasksTableViewCell?
   {
      return _goalieTableView.cellForRowAtIndexPath(indexPath) as? TasksTableViewCell
   }
   
   private func _advanceCellFocusFromIndexPath(indexPath: NSIndexPath)
   {
      if let nextSubgoalCell = _taskCellForIndexPath(indexPath.next) {
         nextSubgoalCell.startEditing()
      }
      else {
         // Try one more time:
         _goalieTableView.scrollByPoints(1)
         if let nextSubgoalCell = _taskCellForIndexPath(indexPath.next) {
            nextSubgoalCell.startEditing()
         } else {
            _currentTaskCell?.stopEditing()
         }
      }
   }
}

extension MainTasksViewController: TasksTableViewCellDelegate
{
   func taskCellBeganEditing(cell: TasksTableViewCell)
   {
      _currentTaskCell = cell
   }
   
   func taskCellFinishedEditing(cell: TasksTableViewCell)
   {
      moc.saveOrRollback()
      
      if !_emptyTaskAtBottom {
         Task.insertIntoContext(moc, title: "")
      }
      _currentTaskCell = nil
   }
   
   // These next two methods are so fucking messy.  They produce the exact behavior that Nico wants though...
   func titleTextFieldShouldReturnForCell(cell: TasksTableViewCell) -> Bool
   {
      var shouldReturn = false
      guard let cellIndexPath = _goalieTableView.indexPathForCell(cell) else { return shouldReturn }
      if _goalieTableView.indexPathIsLast(cellIndexPath) {
         if cell.titleText == "" {
            shouldReturn = true
            cell.stopEditing()
         }
         else {
            shouldReturn = false
            Task.insertIntoContext(moc, title: "")
            _shouldGiveNextCreatedCellFocus = true
         }
      }
      else {
         shouldReturn = false
         _advanceCellFocusFromIndexPath(cellIndexPath)
      }
      
      return shouldReturn
   }
   
   func returnKeyTypeForCell(cell: TasksTableViewCell) -> UIReturnKeyType
   {
      var returnKeyType: UIReturnKeyType = .Next
      if let cellIndexPath = _goalieTableView.indexPathForCell(cell) where
         _goalieTableView.indexPathIsLast(cellIndexPath) {
            returnKeyType = .Default
      }
      return returnKeyType
   }
}

// MARK: - DataProviderDelegate
extension MainTasksViewController: DataProviderDelegate
{
   func dataProviderDidUpdate(updates: [DataProviderUpdate<Task>]?)
   {
      _tableViewDataSource.processUpdates(updates) {
         self._goalieTableView.updateHeaderViewFrameAnimated()
      }
      
      if _shouldGiveNextCreatedCellFocus {
         _shouldGiveNextCreatedCellFocus = false
         guard let updates = updates else { return }
         for update in updates {
            switch update {
            case .Insert(let indexPath):
               if let newSubgoalCell = _taskCellForIndexPath(indexPath) where
                  _goalieTableView.indexPathIsLast(indexPath) {
                     newSubgoalCell.startEditing()
                     return
               }
               else {
                  // Try one more time
                  _goalieTableView.scrollByPoints(1)
                  if let newSubgoalCell = _taskCellForIndexPath(indexPath) where
                     _goalieTableView.indexPathIsLast(indexPath) {
                        newSubgoalCell.startEditing()
                        return
                  }
                  else {
                     _currentTaskCell?.stopEditing()
                  }
               }
            default:
               return
            }
         }
      }
      
   }
}

// MARK: - DataSourceDelegate
extension MainTasksViewController: DataSourceDelegate
{
   func cellIdentifierForObject(object: Task) -> String
   {
      return "TasksTableViewCell"
   }
   
   func configureCell(cell: UITableViewCell)
   {
      (cell as? TasksTableViewCell)?.delegate = self
   }
}

// MARK: - TableViewDelegateProtocol
extension MainTasksViewController: TableViewDelegateProtocol
{
   func objectSelected(goal: Task)
   {
   }
   
   func heightForRowAtIndexPath(indexPath: NSIndexPath) -> CGFloat
   {
      return 70
   }
}
