//
//  UIButton+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/30/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

extension UIButton
{
   func removeAllActionsForTarget(target: AnyObject)
   {
      let events = UIControlEvents.TouchUpInside
      if let actions = actionsForTarget(target, forControlEvent: events) {
         for action in actions {
            removeTarget(target, action: Selector(stringLiteral: action), forControlEvents: events)
         }
      }
   }
   
   func updateTarget(target: AnyObject, selectorName: String)
   {
      removeAllActionsForTarget(target)
      addTarget(target, action: Selector(stringLiteral: selectorName), forControlEvents: UIControlEvents.TouchUpInside)
   }
}
