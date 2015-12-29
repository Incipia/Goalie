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
   private var _shouldGiveNextCreatedCellFocus = false
   
   private typealias DataProvider = FetchedResultsDataProvider<MainTasksViewController>
   private var _tableViewDataSource: TableViewDataSource<MainTasksViewController, DataProvider, TasksTableViewCell>!
   private var _dataProvider: DataProvider!
   private var _tableViewDelegate: TableViewDelegate<DataProvider, MainTasksViewController>!
   
   private var _defaultFRC: NSFetchedResultsController {
      return NSFetchedResultsController(fetchRequest: DefaultTasksFetchRequestProvider.fetchRequest,
         managedObjectContext: moc,
         sectionNameKeyPath: nil,
         cacheName: nil)
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
      _createEmptyTaskIfNecessary()
   }
   
   override func preferredStatusBarStyle() -> UIStatusBarStyle
   {
      return .LightContent
   }
   
   // Mark: - Private
   private func _createEmptyTaskIfNecessary()
   {
      var emptyTaskAtBottom = true
      if let lastIndexPath = _goalieTableView.lastIndexPath {
         let task = _dataProvider.objectAtIndexPath(lastIndexPath)
         emptyTaskAtBottom = task.title == ""
      }
      else if _goalieTableView.numberOfRowsInSection(0) == 0 {
         emptyTaskAtBottom = false
      }
      if !emptyTaskAtBottom {
         Task.insertIntoContext(moc, title: "")
      }
   }
   
   private func _setupTableViewDataSourceAndDelegate()
   {
      _dataProvider = FetchedResultsDataProvider(fetchedResultsController: _defaultFRC, delegate: self)
      _tableViewDataSource = TableViewDataSource(tableView: _goalieTableView, dataProvider: _dataProvider, delegate: self)
      _tableViewDataSource.allowEditingLast = false
      _tableViewDelegate = TableViewDelegate(tableView: _goalieTableView, dataProvider: _dataProvider, delegate: self)
   }
   
   private func _advanceCellFocusFromIndexPath(indexPath: NSIndexPath)
   {
      if let nextSubgoalCell = _goalieTableView.taskCellForIndexPath(indexPath.next) {
         nextSubgoalCell.startEditing()
      }
   }
}

extension MainTasksViewController: TasksTableViewCellDelegate
{
   func taskCellBeganEditing(cell: TasksTableViewCell)
   {
   }
   
   func taskCellFinishedEditing(cell: TasksTableViewCell)
   {
      moc.saveOrRollback()
      _createEmptyTaskIfNecessary()
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
   // This is embarrassing.  Basically, all this messy code is here to deal with the keybaord being
   // in the way when a new task is created at the bottom by pressing the return key.  This code will
   // scroll to the new cell as it's created, and then it'll give it focus.  I know it looks crazy
   func dataProviderDidUpdate(updates: [DataProviderUpdate<Task>]?)
   {
      _tableViewDataSource.processUpdates(updates, animationBlock: { () -> Void in
         self._goalieTableView.updateHeaderViewFrameAnimated()
         if self._shouldGiveNextCreatedCellFocus {
            self._goalieTableView.scrollToBottom()
         }
         // completion
         }) { () -> () in
            if self._shouldGiveNextCreatedCellFocus {
               self._shouldGiveNextCreatedCellFocus = false
               self._goalieTableView.scrollToBottomWithDuration(0.2, alongsideAnimation: { () -> () in
                  self._goalieTableView.updateHeaderViewFrameAnimated()
                  }, completion: { (finished) -> () in
                     
                     guard let updates = updates else { return }
                     for update in updates {
                        switch update {
                        case .Insert(let indexPath):
                           if let newSubgoalCell = self._goalieTableView.taskCellForIndexPath(indexPath) where
                              self._goalieTableView.indexPathIsLast(indexPath) {
                                 newSubgoalCell.startEditing()
                                 return
                           }
                        default:
                           return
                        }
                     }
               })
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