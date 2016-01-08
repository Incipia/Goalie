//
//  GoalieTableView.swift
//  Goalie
//
//  Created by Gregory Klein on 12/28/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

let _defaultHeaderHeight: CGFloat = floor(UIScreen.mainScreen().bounds.height / 3.0)
let _minimumHeaderHeight: CGFloat = floor(UIScreen.mainScreen().bounds.height / 5.0)

class GoalieTableView: TPKeyboardAvoidingTableView
{
   private var _goalieHeaderView: UIView!
   private var _goalieFooterView: UIView!
   @IBOutlet private weak var _goalieFaceView: GoalieFaceView!
   @IBOutlet private weak var _leftSpeechBubble: GoalieSpeechBubble!
   @IBOutlet private weak var _rightSpeechBubble: GoalieSpeechBubble!
   
   // MARK: - Lifecycle
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      _leftSpeechBubble.tailDirection = .Right
      _leftSpeechBubble.hidden = true
      
      _goalieFooterView = tableFooterView
      _goalieHeaderView = tableHeaderView
      tableHeaderView = nil
      superview?.addSubview(_goalieHeaderView)
      
      contentInset = UIEdgeInsets(top: _defaultHeaderHeight, left: 0, bottom: 20, right: 0)
      contentOffset = CGPoint(x: 0, y: -_defaultHeaderHeight)
   }
   
   override func layoutSubviews()
   {
      super.layoutSubviews()
      _updateHeaderViewFrame()
      
      // prevent scrolling past bottom
      if contentOffset.y < -_defaultHeaderHeight {
         contentOffset = CGPoint(x: 0, y: -_defaultHeaderHeight)
      }
   }
   
   // MARK: - Public
   func showFooterView()
   {
      tableFooterView = _goalieFooterView
   }
   
   func hideFooterView()
   {
      tableFooterView = UIView()
   }
   
   func taskCellForIndexPath(indexPath: NSIndexPath) -> TasksTableViewCell?
   {
      return cellForRowAtIndexPath(indexPath) as? TasksTableViewCell
   }
   
   func updateWithPriority(priority: TaskPriority)
   {
      _goalieFaceView.updateWithPriority(priority)
      _leftSpeechBubble.updateWithPriority(priority)
      _rightSpeechBubble.updateWithPriority(priority)
      
      let color = UIColor.goalieHeaderBackgroundColor(priority)
      _updateHeaderViewColor(color, animationDuration: 0.3)
   }
   
   // MARK: - Private
   private func _updateHeaderViewColor(color: UIColor, animationDuration: Double)
   {
      UIView.animateWithDuration(animationDuration) { () -> Void in
         self._goalieHeaderView.backgroundColor = color
      }
   }
   
   func updateHeaderViewFrameAnimated()
   {
      UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
         self._updateHeaderViewFrame()
         }, completion: nil)
   }
   
   private func _updateHeaderViewFrame()
   {
      let headerHeight = _headerHeightForContentOffset(contentOffset)
      let size = CGSize(width: bounds.width, height: headerHeight)
      _goalieHeaderView.frame = CGRect(origin: CGPoint.zero, size: size)
      _goalieHeaderView.layoutIfNeeded()
   }
   
   private func _headerHeightForContentOffset(offset: CGPoint) -> CGFloat
   {
      var height = _defaultHeaderHeight
      if offset.y < -_defaultHeaderHeight {
         height = -contentOffset.y
      }
      else if contentOffset.y > -_defaultHeaderHeight {
         let heightSubtraction = _defaultHeaderHeight - abs(contentOffset.y)
         let newHeaderHeight = _defaultHeaderHeight - heightSubtraction
         
         height = max(_minimumHeaderHeight, newHeaderHeight)
         if contentOffset.y > 0 && newHeaderHeight > _minimumHeaderHeight {
            height = _minimumHeaderHeight
         }
         else {
            height = max(_minimumHeaderHeight, newHeaderHeight)
         }
      }
      return height
   }
}
