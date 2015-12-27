//
//  GoalsTableViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 12/26/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

let _defaultHeaderHeight: CGFloat = UIScreen.mainScreen().bounds.height / 3.0
let _minimumHeaderHeight: CGFloat = 100

class GoalsTableViewController: UITableViewController
{
   private var _goalieHeaderView: UIView!
   
   // Mark: - Lifecycle
   override func viewDidLoad()
   {
      super.viewDidLoad()
      
      _setupGoalieHeaderView()
      _setupTableView()
      _updateHeaderViewFrame()
   }
   
   // Mark: - Private
   private func _setupGoalieHeaderView()
   {
      _goalieHeaderView = tableView.tableHeaderView
      tableView.tableHeaderView = nil
      tableView.addSubview(_goalieHeaderView)
   }
   
   private func _setupTableView()
   {
      tableView.contentInset = UIEdgeInsets(top: _defaultHeaderHeight, left: 0, bottom: 0, right: 0)
      tableView.contentOffset = CGPoint(x: 0, y: -_defaultHeaderHeight)
   }
   
   private func _updateHeaderViewFrame()
   {
      let origin = CGPoint(x: 0, y: -_defaultHeaderHeight)
      let size = CGSize(width: tableView.bounds.width, height: _defaultHeaderHeight)
      var headerRect = CGRect(origin: origin, size: size)
      
      if tableView.contentOffset.y < -_defaultHeaderHeight {
         headerRect.origin.y = tableView.contentOffset.y
         headerRect.size.height = -tableView.contentOffset.y
      }
      else if tableView.contentOffset.y > -_defaultHeaderHeight {
         let heightSubtraction = _defaultHeaderHeight - abs(tableView.contentOffset.y)
         let newHeaderHeight = _defaultHeaderHeight - heightSubtraction
         
         // weird logic that I'll clean up later
         headerRect.origin.y = tableView.contentOffset.y
         headerRect.size.height = max(_minimumHeaderHeight, newHeaderHeight)
         if tableView.contentOffset.y > 0 && newHeaderHeight > _minimumHeaderHeight {
            headerRect.size.height = _minimumHeaderHeight
         }
         else {
            headerRect.size.height = max(_minimumHeaderHeight, newHeaderHeight)
         }
      }
      
      _goalieHeaderView.frame = headerRect
   }
   
   override func preferredStatusBarStyle() -> UIStatusBarStyle
   {
      return .LightContent
   }
   
   // MARK: - Table view data source
   override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      // #warning Incomplete implementation, return the number of sections
      return 1
   }
   
   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      // #warning Incomplete implementation, return the number of rows
      return 20
   }
   
   override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      return 70
   }
   
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
   {
      let cell = tableView.dequeueReusableCellWithIdentifier("GoalsTableViewCell", forIndexPath: indexPath)
      return cell
   }
   
   // MARK: - Scroll view delegate
   override func scrollViewDidScroll(scrollView: UIScrollView)
   {
      _updateHeaderViewFrame()
      if scrollView.contentOffset.y < -_defaultHeaderHeight {
         scrollView.contentOffset = CGPoint(x: 0, y: -_defaultHeaderHeight)
      }
   }
}
