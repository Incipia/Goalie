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
   // We use this to get notified when the tasks change (separately from the table view configureCell: stuff)
   private var _tasksDataProvider: TasksDataProvider!
   var moc: NSManagedObjectContext! {
      didSet {
         _tasksDataProvider = TasksDataProvider(managedObjectContext: moc)
         _settingsController = UIStoryboard.settingsViewController(moc, delegate: self)
         _settingsController.transitioningDelegate = _transitionManager
         let _ = _settingsController.view
         
         _editTaskViewController = UIStoryboard.editTaskViewController(moc)
         _editTaskViewController.transitioningDelegate = _transitionManager
         let _ = _editTaskViewController.view
      }
   }
   @IBOutlet private weak var _goalieTableView: GoalieTableView!
   private var _shouldGiveNextCreatedCellFocus = false
   
   private typealias DataProvider = FetchedResultsDataProvider<MainTasksViewController>
   private var _tableViewDataSource: TableViewDataSource<MainTasksViewController, DataProvider, TasksTableViewCell>!
   private var _tableViewDataProvider: DataProvider!
   private var _tableViewDelegate: TableViewDelegate<DataProvider, MainTasksViewController>!
   
   private var _tableViewTasksFRC: NSFetchedResultsController {
      
      let fr = DefaultTasksFetchRequestProvider.fetchRequest
      var predicate: NSPredicate? = nil
      if !GoalieSettingsManager.showCompletedTasks {
         predicate = NSPredicate(format: "completed == false")
      }
      fr.predicate = predicate
      return NSFetchedResultsController(fetchRequest: fr,
         managedObjectContext: moc,
         sectionNameKeyPath: nil,
         cacheName: nil)
   }
   
   private let _transitionManager = MenuTransitionManager()
   private var _settingsController: SettingsViewController!
   private var _editTaskViewController: EditTaskViewController!
   private var _currentTaskCell: TasksTableViewCell?
   private var _shouldCreateMoreCellsOnReturnKeyPressed = false
   
   // Mark: - Lifecycle
   override func viewDidLoad()
   {
      super.viewDidLoad()
      definesPresentationContext = true
      
      _setupTableViewDataSourceAndDelegate()
      _tasksDataProvider.contentDidChangeBlock = {
         // There is probably a better way to do this.  We need this because when tasks are moved around/created in the table,
         // we may need to update the left bar on the table cells (rounded corners depending on the cells position)
         dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self._updateTableViewHeaderDisplay()
            self._updateTaskCellsLeftBar()
            self._updateTableViewFooter()
         })
      }
      
      _tasksDataProvider.updateFetchRequest()
      _updateTableViewHeaderDisplay()
   }
   
   override func viewDidAppear(animated: Bool)
   {
      super.viewDidAppear(animated)
      _updateTaskCellsLeftBar()
   }
   
   override func viewWillAppear(animated: Bool)
   {
      super.viewWillAppear(animated)
      _goalieTableView.reloadData()
      _createEmptyTaskIfNecessary()
      _updateTableViewFooter()
   }
   
   override func preferredStatusBarStyle() -> UIStatusBarStyle
   {
      return .LightContent
   }
   
   // MARK: - Public
   func animateGoalie()
   {
      _goalieTableView.animateGoalie()
   }
   
   func startGoalieMovement()
   {
      _goalieTableView.startGoalieMovement()
   }
   
   func stopGoalieMovement()
   {
      _goalieTableView.stopGoalieMovement()
   }
   
   func showSpeechBubble()
   {
      _goalieTableView.showSpeechBubble()
   }
   
   func hideSpeechBubble()
   {
      _goalieTableView.hideSpeechBubble()
   }
   
   // Mark: - Private
   private func _updateTableViewFooter()
   {
      if _tasksDataProvider.incompletedTasks().count > 0 {
         _goalieTableView.hideFooterView()
      }
      else {
         _goalieTableView.showFooterView()
      }
   }
   
   private func _updateTableViewHeaderDisplay()
   {
      let priority = _tasksDataProvider.averagePriority()
      _goalieTableView.updateWithPriority(priority)
   }
   
   private func _updateTaskCellsLeftBar()
   {
      if let indexPaths = self._goalieTableView.indexPathsForVisibleRows {
         for ip in indexPaths {
            if let cell = self._goalieTableView.cellForRowAtIndexPath(ip) as? TasksTableViewCell {
               let task = self._tableViewDataProvider.objectAtIndexPath(ip)
               cell.updateSeparatorsAndLeftBarLayerMaskWithTask(task, dataProvider: self._tasksDataProvider)
            }
         }
      }
   }
   
   private func _createEmptyTaskIfNecessary() -> Task?
   {
      var createdTask: Task?
      var emptyTaskAtBottom = true
      if let lastIndexPath = _goalieTableView.lastIndexPath {
         let task = _tableViewDataProvider.objectAtIndexPath(lastIndexPath)
         emptyTaskAtBottom = task.title == ""
      }
      else if _goalieTableView.numberOfRowsInSection(0) == 0 {
         emptyTaskAtBottom = false
      }
      
      if !emptyTaskAtBottom {
         createdTask = Task.insertEmptyTaskIntoContext(moc)
      }
      return createdTask
   }
   
   private func _setupTableViewDataSourceAndDelegate()
   {
      _tableViewDataProvider = FetchedResultsDataProvider(fetchedResultsController: _tableViewTasksFRC, delegate: self)
      _tableViewDataSource = TableViewDataSource(tableView: _goalieTableView, dataProvider: _tableViewDataProvider, delegate: self)
      _tableViewDataSource.allowEditingLast = false
      _tableViewDelegate = TableViewDelegate(tableView: _goalieTableView, dataProvider: _tableViewDataProvider, delegate: self)
   }
   
   private func _advanceCellFocusFromIndexPath(indexPath: NSIndexPath)
   {
      if let nextSubgoalCell = _goalieTableView.taskCellForIndexPath(indexPath.next) {
         nextSubgoalCell.startEditing()
      }
   }
   
   private func _presentDetailsForTask(task: Task)
   {
      _transitionManager.presenting = true
      _editTaskViewController.configureWithTask(task)
      presentViewController(_editTaskViewController, animated: true) { () -> Void in
         self._transitionManager.presenting = false
      }
   }
   
   // Mark: - IBActions
   @IBAction private func _settingsButtonPressed()
   {
      guard _currentTaskCell == nil else {
         _currentTaskCell?.stopEditing()
         return
      }
      
      _transitionManager.presenting = true
      presentViewController(_settingsController, animated: true) { () -> Void in
         self._transitionManager.presenting = false
      }
   }
}

extension MainTasksViewController: TasksTableViewCellDelegate
{
   func textFieldShouldEndEditing(cell: TasksTableViewCell, forTask task: Task?) -> Bool
   {
      if let task = task where !_tasksDataProvider.taskIsLast(task) && cell.titleText == "" {
         cell.titleText = "untitled"
      }
      return true
   }
   
   func taskCellBeganEditing(cell: TasksTableViewCell, plusButtonPressed: Bool)
   {
      _currentTaskCell = cell
      if _shouldCreateMoreCellsOnReturnKeyPressed == false && plusButtonPressed {
         _shouldCreateMoreCellsOnReturnKeyPressed = plusButtonPressed
      }
   }
   
   func taskCellFinishedEditing(cell: TasksTableViewCell, forTask task: Task?)
   {
      moc.performChanges { () -> () in
         if task?.priority == .Unknown && cell.titleText != "" {
            task?.priority = .Later
            GoalieSettingsManager.setUserCompletedFirstTask(true)
         }
      }
      _currentTaskCell = nil
      _createEmptyTaskIfNecessary()
   }
   
   // These next two methods are so fucking messy.  They produce the exact behavior that Nico wants though...
   func titleTextFieldShouldReturnForCell(cell: TasksTableViewCell) -> Bool
   {
      var shouldReturn = false
      if _shouldCreateMoreCellsOnReturnKeyPressed {
         guard let cellIndexPath = _goalieTableView.indexPathForCell(cell) else { return shouldReturn }
         if _goalieTableView.indexPathIsLast(cellIndexPath) {
            if cell.titleText == "" {
               shouldReturn = true
               cell.stopEditing()
               _shouldCreateMoreCellsOnReturnKeyPressed = false
            }
            else {
               Task.insertEmptyTaskIntoContext(moc)
               _shouldGiveNextCreatedCellFocus = true
            }
         }
      }
      else {
         cell.stopEditing()
         shouldReturn = true
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
      else if !_shouldCreateMoreCellsOnReturnKeyPressed {
         returnKeyType = .Done
      }
      return returnKeyType
   }
   
   func disclosureButtonPressedForTask(task: Task)
   {
      _currentTaskCell?.stopEditing()
      _presentDetailsForTask(task)
   }
   
   func completeButtonPressedForCell(cell: TasksTableViewCell, task: Task)
   {
      if _currentTaskCell == nil {
         moc.performChanges { () -> () in
            task.completed = !task.completed
            if !task.completed {
               task.resetLastPriorityChangeDate()
            }
            else {
               SFXPlayer.playCurrentCompletedSound()
            }
         }
      }
      _currentTaskCell?.stopEditing()
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
               self._goalieTableView.scrollToBottomWithDuration(0.2, completion: { (finished) -> () in
                     
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
   
   func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath)
   {
      if let goalieCell = cell as? TasksTableViewCell {
         goalieCell.delegate = self
         let task = _tableViewDataProvider.objectAtIndexPath(indexPath)
         goalieCell.updateSeparatorsAndLeftBarLayerMaskWithTask(task, dataProvider: _tasksDataProvider)
      }
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
      return indexPath.row == 0 ? 70 : 50
   }
}

extension MainTasksViewController: SettingsViewControllerDelegate
{
   func settingsDidClose()
   {
      _tableViewDataProvider.updateFetchRequest()
      _tasksDataProvider.updateFetchRequest()
      _goalieTableView.reloadData()
   }
}