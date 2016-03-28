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
   @IBOutlet private weak var _widthConstraint: NSLayoutConstraint!
   @IBOutlet private weak var _heightConstraint: NSLayoutConstraint!
   
   private(set) var accessory: GoalieAccessory = .Unknown
   internal var _currentPriority: TaskPriority = .Unknown
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      backgroundColor = UIColor.clearColor()
   }
   
   // MARK: - Public
   func updateAccessory(accessory: GoalieAccessory)
   {
      if self.accessory != accessory
      {
         self.accessory = accessory
         
         _updateConstraintsWithAccessory(accessory)
         updateWithPriority(_currentPriority)
      }
   }
   
   func updateWithPriority(priority: TaskPriority)
   {
      _currentPriority = priority
      setNeedsDisplay()
   }
   
   // MARK: - Private
   private func _updateConstraintsWithAccessory(a: GoalieAccessory)
   {
      let newSize = CGSize(accessory: a)
      _widthConstraint.constant = newSize.width
      _heightConstraint.constant = newSize.height
   }
   
   override func drawRect(rect: CGRect)
   {
      accessory.drawRect(rect, priority: _currentPriority)
   }
}

