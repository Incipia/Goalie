//
//  MainTasksViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 12/28/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit
import CoreData

let kNormalCellHeight: CGFloat = 50
let kFirstCellHeight: CGFloat = 70

class MainTasksViewController: UIViewController, ManagedObjectContextSettable
{
   // We use this to get notified when the tasks change (separately from the table view configureCell: stuff)
   fileprivate var _tasksDataProvider: TasksDataProvider!
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
   
   @IBOutlet fileprivate weak var _wakeGoalieBackUpLabel: UILabel!
   @IBOutlet fileprivate weak var _goalieTableView: GoalieTableView!
   fileprivate var _shouldGiveNextCreatedCellFocus = false
   
   fileprivate typealias DataProvider = FetchedResultsDataProvider<MainTasksViewController>
   fileprivate var _tableViewDataSource: TableViewDataSource<MainTasksViewController, DataProvider, TasksTableViewCell>!
   fileprivate var _tableViewDataProvider: DataProvider!
   fileprivate var _tableViewDelegate: TableViewDelegate<DataProvider, MainTasksViewController>!
   
   fileprivate var _tableViewTasksFRC: NSFetchedResultsController<NSFetchRequestResult> {
      
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
   
   fileprivate var _accessoriesViewController: AccessoriesViewController!
   fileprivate let _transitionManager = MenuTransitionManager()
   fileprivate var _settingsController: SettingsViewController!
   fileprivate var _editTaskViewController: EditTaskViewController!
   fileprivate var _currentTaskCell: TasksTableViewCell?
   fileprivate var _shouldCreateMoreCellsOnReturnKeyPressed = false
   fileprivate var _shouldShowCongratulationsDialogWhenKeyboardIsDismissed = false
   fileprivate var _shouldShowUnlockedHomePackDialogWhenKeyboardIsDismissed = false
   
   fileprivate var _sourceDraggingIndexPath: IndexPath?
   fileprivate var _destinationDraggingIndexPath: IndexPath?
   
   // Mark: - Lifecycle
   override func viewDidLoad()
   {
      super.viewDidLoad()
      definesPresentationContext = true
      
      _setupTableViewDataSourceAndDelegate()
      _tasksDataProvider.contentDidChangeBlock = {
         // There is probably a better way to do this.  We need this because when tasks are moved around/created in the table,
         // we may need to update the left bar on the table cells (rounded corners depending on the cells position)
         DispatchQueue.main.async(execute: { () -> Void in
            self._updateTableViewHeaderDisplay()
            self._updateTaskCellsLeftBar()
            self._updateTableViewFooter()
         })
      }
      
      _tasksDataProvider.updateFetchRequest()
      _updateTableViewHeaderDisplay()
      
      NotificationCenter.default.addObserver(self,
                                                       selector: #selector(MainTasksViewController.keyboardDidHide),
                                                       name: NSNotification.Name.UIKeyboardDidHide,
                                                       object: nil)
      
      _goalieTableView.longPressReorderDelegate = self
      _goalieTableView.konamiDelegate = self
   }
   
   func keyboardDidHide()
   {
      if _shouldShowCongratulationsDialogWhenKeyboardIsDismissed {
         _shouldShowCongratulationsDialogWhenKeyboardIsDismissed = false
         GoalieSettingsManager.setUserCreatedFirstTask(true)
         _showCongratulationsDialog()
      }
      else if _shouldShowUnlockedHomePackDialogWhenKeyboardIsDismissed {
         _shouldShowUnlockedHomePackDialogWhenKeyboardIsDismissed = false
         
         guard !AccessoryPackManager.accessoryPackUnlocked(.home) else { return }
         
         AccessoryPackManager.unlockAccessoryPack(.home)
         _showUnlockedAccessoryPackViewController(.home)
      }
      _shouldCreateMoreCellsOnReturnKeyPressed = false
   }
   
   override func viewDidAppear(_ animated: Bool)
   {
      super.viewDidAppear(animated)
      _updateTaskCellsLeftBar()
      
      let secondsSinceFirstOpen = Date().secondsFrom(GoalieSettingsManager.firstTimeAppOpened)
      
      if !_tryToUnlockDurationBasedAccessoryPack(.work, withSecondsSinceFirstAppUse: secondsSinceFirstOpen) {
         _tryToUnlockDurationBasedAccessoryPack(.gym, withSecondsSinceFirstAppUse: secondsSinceFirstOpen)
      }
   }
   
   fileprivate func _tryToUnlockDurationBasedAccessoryPack(_ pack: AccessoryPack, withSecondsSinceFirstAppUse seconds: Int) -> Bool
   {
      guard !AccessoryPackManager.accessoryPackUnlocked(pack) else { return false }
      guard let duration = pack.useToUnlockDurationInSeconds else { return false }
      guard seconds >= duration else { return false }
      
      AccessoryPackManager.unlockAccessoryPack(pack)
      _showUnlockedAccessoryPackViewController(pack)
      
      return true
   }
   
   override func viewWillAppear(_ animated: Bool)
   {
      super.viewWillAppear(animated)
      _goalieTableView.reloadData()
      _createEmptyTaskIfNecessary()
      _updateTableViewFooter()
      _wakeGoalieBackUpLabel.text = _wakeCharacterBackUpText()
      
      _accessoriesViewController.updateAccessoryPack(AccessoryPackManager.currentAccessoryPack)
      _goalieTableView.updateCharacter(CharacterManager.currentCharacter)
      _goalieTableView.stopGoalieMovement()
      _goalieTableView.startGoalieMovement()
   }
   
   fileprivate func _wakeCharacterBackUpText() -> String
   {
      return "Add some new tasks to wake \(CharacterManager.currentCharacter.name) back up."
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?)
   {
      if let childViewController = segue.destination as? AccessoriesViewController
      {
         _accessoriesViewController = childViewController
      }
   }
   
   override var preferredStatusBarStyle : UIStatusBarStyle
   {
      return .lightContent
   }
   
   @IBAction fileprivate func _tableHeaderViewTapped(_ recognizer: UIGestureRecognizer)
   {
      _currentTaskCell?.stopEditing()
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
   
   // MARK: - Private
   fileprivate func _updateTableViewFooter()
   {
      if _tasksDataProvider.incompletedTasks().count > 0 {
         _goalieTableView.hideFooterView()
      }
      else {
         _goalieTableView.showFooterView()
      }
   }
   
   fileprivate func _updateTableViewHeaderDisplay()
   {
      let priority = _tasksDataProvider.averagePriority()
      _goalieTableView.updateWithPriority(priority)
      _accessoriesViewController.updateWithPriority(priority)
   }
   
   fileprivate func _updateTaskCellsLeftBar()
   {
      if let indexPaths = self._goalieTableView.indexPathsForVisibleRows {
         for ip in indexPaths {
            if let cell = self._goalieTableView.cellForRow(at: ip) as? TasksTableViewCell {
               let task = self._tableViewDataProvider.objectAtIndexPath(ip)
               cell.updateSeparatorsAndLeftBarLayerMaskWithTask(task, dataProvider: self._tasksDataProvider)
            }
         }
      }
   }
   
   fileprivate func _createEmptyTaskIfNecessary() -> Task?
   {
      var createdTask: Task?
      var emptyTaskAtBottom = true
      if let lastIndexPath = _goalieTableView.lastIndexPath {
         let task = _tableViewDataProvider.objectAtIndexPath(lastIndexPath)
         emptyTaskAtBottom = task.title == ""
      }
      else if _goalieTableView.numberOfRows(inSection: 0) == 0 {
         emptyTaskAtBottom = false
      }
      
      if !emptyTaskAtBottom {
         createdTask = Task.insertEmptyTaskIntoContext(moc)
      }
      return createdTask
   }
   
   fileprivate func _setupTableViewDataSourceAndDelegate()
   {
      _tableViewDataProvider = FetchedResultsDataProvider(fetchedResultsController: _tableViewTasksFRC, delegate: self)
      _tableViewDataSource = TableViewDataSource(tableView: _goalieTableView, dataProvider: _tableViewDataProvider, delegate: self)
      _tableViewDataSource.allowEditingLast = false
      _tableViewDelegate = TableViewDelegate(tableView: _goalieTableView, dataProvider: _tableViewDataProvider, delegate: self)
   }
   
   fileprivate func _advanceCellFocusFromIndexPath(_ indexPath: IndexPath)
   {
      if let nextSubgoalCell = _goalieTableView.taskCellForIndexPath(indexPath.next) {
         nextSubgoalCell.startEditing()
      }
   }
   
   fileprivate func _presentDetailsForTask(_ task: Task)
   {
      _transitionManager.presenting = true
      _editTaskViewController.configureWithTask(task)
      present(_editTaskViewController, animated: true) { () -> Void in
         self._transitionManager.presenting = false
      }
   }
   
   // MARK: - IBActions
   @IBAction fileprivate func _settingsButtonPressed()
   {
      guard _currentTaskCell == nil else {
         _currentTaskCell?.stopEditing()
         return
      }
      
      _transitionManager.presenting = true
      present(_settingsController, animated: true) { () -> Void in
         self._transitionManager.presenting = false
      }
   }
   
   @IBAction fileprivate func _editListButtonPressed()
   {
      let controller = UIStoryboard.editListViewController()
      present(controller, animated: true, completion: nil)
   }
}

extension MainTasksViewController: TasksTableViewCellDelegate
{
   func textFieldShouldEndEditing(_ cell: TasksTableViewCell, forTask task: Task?) -> Bool
   {
      if let task = task, !_tasksDataProvider.taskIsLast(task) && cell.titleText == "" {
         cell.titleText = "untitled"
      }
      return true
   }
   
   func taskCellBeganEditing(_ cell: TasksTableViewCell, plusButtonPressed: Bool)
   {
      _currentTaskCell = cell
      if _shouldCreateMoreCellsOnReturnKeyPressed == false && plusButtonPressed {
         _shouldCreateMoreCellsOnReturnKeyPressed = plusButtonPressed
      }
   }
   
   func taskCellFinishedEditing(_ cell: TasksTableViewCell, forTask task: Task?)
   {
      moc.performChanges { () -> () in
         if task?.priority == .unknown && cell.titleText != ""
         {
            task?.priority = .later
            if !GoalieSettingsManager.userCreatedFirstTask {
               self._shouldShowCongratulationsDialogWhenKeyboardIsDismissed = true
            }
            if GoalieSettingsManager.totalTasksCreated >= 5 {
               self._shouldShowUnlockedHomePackDialogWhenKeyboardIsDismissed = true
            }
         }
      }
      _currentTaskCell = nil
      _createEmptyTaskIfNecessary()
   }
   
   // These next two methods are so fucking messy.  They produce the exact behavior that Nico wants though...
   func titleTextFieldShouldReturnForCell(_ cell: TasksTableViewCell) -> Bool
   {
      var shouldReturn = false
      if _shouldCreateMoreCellsOnReturnKeyPressed {
         guard let cellIndexPath = _goalieTableView.indexPath(for: cell) else { return shouldReturn }
         if _goalieTableView.indexPathIsLast(cellIndexPath) {
            if cell.titleText == "" {
               shouldReturn = true
               cell.stopEditing()
               _shouldCreateMoreCellsOnReturnKeyPressed = false
            }
            else {
               Task.insertEmptyTaskIntoContext(moc)
               GoalieSettingsManager.incrementTotalTasksCreated()
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
   
   func returnKeyTypeForCell(_ cell: TasksTableViewCell) -> UIReturnKeyType
   {
      var returnKeyType: UIReturnKeyType = .next
      if let cellIndexPath = _goalieTableView.indexPath(for: cell),
         _goalieTableView.indexPathIsLast(cellIndexPath) {
            returnKeyType = .default
      }
      else if !_shouldCreateMoreCellsOnReturnKeyPressed {
         returnKeyType = .done
      }
      return returnKeyType
   }
   
   func disclosureButtonPressedForTask(_ task: Task)
   {
      _currentTaskCell?.stopEditing()
      if !task.title.isEmpty {
         _presentDetailsForTask(task)
      }
   }
   
   func completeButtonPressedForCell(_ cell: TasksTableViewCell, task: Task)
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
   
   fileprivate func _showCongratulationsDialog()
   {
      let congratsController = UIStoryboard.congratulationsViewController()
      congratsController.transitioningDelegate = _transitionManager
      congratsController.delegate = self
      _transitionManager.presenting = true
      present(congratsController, animated: true, completion: { finished in
         self._transitionManager.presenting = false
      })
   }
   
   fileprivate func _showUnlockedAccessoryPackViewController(_ pack: AccessoryPack)
   {
      let controller = UIStoryboard.unlockedAccessoryPackViewController()
      controller.transitioningDelegate = _transitionManager
      controller.accessoryPack = pack
      controller.delegate = self
      
      _transitionManager.presenting = true
      present(controller, animated: true) { () -> Void in
         self._transitionManager.presenting = false
      }
   }
}

// MARK: - DataProviderDelegate
extension MainTasksViewController: DataProviderDelegate
{
   // This is embarrassing.  Basically, all this messy code is here to deal with the keybaord being
   // in the way when a new task is created at the bottom by pressing the return key.  This code will
   // scroll to the new cell as it's created, and then it'll give it focus.  I know it looks crazy
   func dataProviderDidUpdate(_ updates: [DataProviderUpdate<Task>]?)
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
                        case .insert(let indexPath):
                           if let newSubgoalCell = self._goalieTableView.taskCellForIndexPath(indexPath),
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
   func cellIdentifierForObject(_ object: Task) -> String
   {
      return "TasksTableViewCell"
   }
   
   func configureCell(_ cell: UITableViewCell, atIndexPath indexPath: IndexPath)
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
   func objectSelected(_ goal: Task)
   {
   }
   
   func heightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat
   {
      return indexPath.row == 0 ? kFirstCellHeight : kNormalCellHeight
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

extension MainTasksViewController: LPRTableViewDelegate
{
   /** Provides the delegate a chance to modify the cell visually before dragging occurs. Defaults to using the cell as-is if not implemented. */
   func tableView(_ tableView: UITableView, draggingCell cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell
   {
      let frame = cell.frame
      let newFrame = CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: kNormalCellHeight))
      cell.frame = newFrame
      return cell
   }
   
   /** Called within an animation block when the dragging view is about to show. */
   func tableView(_ tableView: UITableView, showDraggingView view: UIView, atIndexPath indexPath: IndexPath)
   {
      _currentTaskCell?.stopEditing()
      _sourceDraggingIndexPath = indexPath
   }
   
   /** Called within an animation block when the dragging view is about to hide. */
   func tableView(_ tableView: UITableView, hideDraggingView view: UIView, atIndexPath indexPath: IndexPath)
   {
      _destinationDraggingIndexPath = indexPath
   }
   
   func performCompletion()
   {
      guard let sourceIP = _sourceDraggingIndexPath, let destIP = _destinationDraggingIndexPath, sourceIP.row != destIP.row else { return }
      
      let sourceTask = _tableViewDataProvider.objectAtIndexPath(sourceIP)
      let destTask = _tableViewDataProvider.objectAtIndexPath(destIP)
      
      let newCreationDate = destTask.creationDate
      
      _sourceDraggingIndexPath = nil
      _destinationDraggingIndexPath = nil
      
      moc.performAndWait { () -> Void in
         
         let movedDown = sourceIP.row < destIP.row
         if movedDown {
            // go backwards and subtract from creation dates
            for task in self._tasksDataProvider.allTasks() {
               if task != sourceTask && task.creationDate <= newCreationDate {
                  task.creationDate = task.creationDate.addingTimeInterval(-1)
               }
            }
         }
         else {
            // go forwards and subtract from creation dates
            for task in self._tasksDataProvider.allTasks() {
               if task != sourceTask && task.creationDate >= newCreationDate {
                  task.creationDate = task.creationDate.addingTimeInterval(1)
               }
            }
         }
         sourceTask.creationDate = newCreationDate
         sourceTask.priority = destTask.priority
         
         self._goalieTableView.reloadData()
         self.moc.saveOrRollback()
      }
   }
}

extension MainTasksViewController: KonamiDelegate
{
   func konamiRecognized()
   {
      let alertController = UIAlertController(title: "Konami Code Entered", message: "Enjoy all of the free characters and accessory packs.", preferredStyle: .alert)
      
      let action = UIAlertAction(title: "Thank You", style: .default) { (action) -> Void in
         CharacterManager.unlockAllCharacters()
         AccessoryPackManager.unlockAllAccessoryPacks()
      }
      
      alertController.addAction(action)
      
      present(alertController, animated: true, completion: nil)
   }
}

extension MainTasksViewController: CongratulationsViewControllerDelegate
{
   func congratulationsViewControllerDidDismiss(_ controller: CongratulationsViewController)
   {
      if _shouldShowUnlockedHomePackDialogWhenKeyboardIsDismissed {
         _shouldShowUnlockedHomePackDialogWhenKeyboardIsDismissed = false
         
         guard !AccessoryPackManager.accessoryPackUnlocked(.home) else { return }
         
         AccessoryPackManager.unlockAccessoryPack(.home)
         _showUnlockedAccessoryPackViewController(.home)
      }
   }
}

extension MainTasksViewController: UnlockedAccessoryPackViewControllerDelegate
{
   func unlockedAccessoryPackViewControllerIgnoreButtonPressed(_ controller: UnlockedAccessoryPackViewController)
   {
      _transitionManager.presenting = false
      controller.dismiss(animated: true, completion: nil)
   }
   
   func unlockedAccessoryPackViewControllerUnlockButtonPressed(_ controller: UnlockedAccessoryPackViewController)
   {
      AccessoryPackManager.updateCurrentAccessoryPack(controller.accessoryPack)
      
      _transitionManager.presenting = false
      controller.dismiss(animated: true) { () -> Void in
         DispatchQueue.main.async(execute: { () -> Void in
            self._editListButtonPressed()
         })
      }
   }
}
