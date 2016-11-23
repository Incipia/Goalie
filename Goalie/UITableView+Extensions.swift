//
//  UITableView+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/10/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

extension IndexPath
{
   var next: IndexPath {
      return IndexPath(row: row + 1, section: section)
   }
   
   var before: IndexPath {
      return IndexPath(row: row - 1, section: section)
   }
}

extension UITableView
{
   var lastIndexPath: IndexPath? {
      var ip: IndexPath?
      let numberOfRows = self.numberOfRows(inSection: 0)
      if numberOfRows > 0 {
         ip = IndexPath(row: numberOfRows - 1, section: 0)
      }
      return ip
   }
   
   func showSeparatorsForEmptyCells(_ show: Bool)
   {
      let footerFrame = CGRect(x: 0, y: 0, width: 0, height: 1)
      self.tableFooterView = show ? nil : UIView(frame: footerFrame)
   }
   
   func flashCellAtIndexPath(_ indexPath: IndexPath, duration: Double)
   {
      if indexPath.row < self.numberOfRows(inSection: 0) {
         UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.scrollToRow(at: indexPath, at: UITableViewScrollPosition.middle, animated: false)
            
            }, completion: { (finished: Bool) -> Void in
               
               if let subgoalCell = self.cellForRow(at: indexPath) {
                  
                  let originalBackgroundColor = subgoalCell.backgroundColor
                  UIView.animate(withDuration: duration * 0.6, animations: { () -> Void in
                     subgoalCell.backgroundColor = UIColor.white.withAlphaComponent(0.2)
                     
                     }, completion: { (finished: Bool) -> Void in
                        
                        UIView.animate(withDuration: duration * 0.4, animations: { () -> Void in
                           subgoalCell.backgroundColor = originalBackgroundColor
                        })
                  }) 
               }
         }) 
      }
   }
   
   func indexPathIsLast(_ indexPath: IndexPath) -> Bool
   {
      return indexPath.row == numberOfRows(inSection: 0) - 1
   }
   
   func scrollByPoints(_ points: CGFloat)
   {
      let offset = self.contentOffset
      self.contentOffset = CGPoint(x: offset.x, y: offset.y + points)
   }
   
   func scrollToBottom()
   {
      if let ip = lastIndexPath {
         scrollToRow(at: ip, at: .bottom, animated: true)
      }
   }
   
   func scrollToBottomWithDuration(_ duration: Double, completion: ((_ finished: Bool) -> ())?)
   {
      UIView.animate(withDuration: duration, animations: { () -> Void in
         
         if let ip = self.lastIndexPath {
            self.scrollToRow(at: ip, at: UITableViewScrollPosition.bottom, animated: false)
         }
         }, completion: completion)
   }
}
