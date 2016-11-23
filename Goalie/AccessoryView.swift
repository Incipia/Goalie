//
//  AccessoryView.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class AccessoryView: UIView
{
   @IBOutlet fileprivate weak var _widthConstraint: NSLayoutConstraint!
   @IBOutlet fileprivate weak var _heightConstraint: NSLayoutConstraint!
   
   fileprivate(set) var accessory: GoalieAccessory = .unknown
   internal var _currentPriority: TaskPriority = .unknown
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      backgroundColor = UIColor.clear
   }
   
   // MARK: - Public
   func updateAccessory(_ accessory: GoalieAccessory)
   {
      if self.accessory != accessory
      {
         self.accessory = accessory
         
         _updateConstraintsWithAccessory(accessory)
         updateWithPriority(_currentPriority)
      }
   }
   
   func updateWithPriority(_ priority: TaskPriority)
   {
      _currentPriority = priority
      setNeedsDisplay()
   }
   
   // MARK: - Private
   fileprivate func _updateConstraintsWithAccessory(_ a: GoalieAccessory)
   {
      let newSize = CGSize(accessory: a)
      _widthConstraint.constant = newSize.width
      _heightConstraint.constant = newSize.height
   }
   
   override func draw(_ rect: CGRect)
   {
      accessory.drawRect(rect, priority: _currentPriority)
   }
}

