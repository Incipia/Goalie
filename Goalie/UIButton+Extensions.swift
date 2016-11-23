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
   func removeAllActionsForTarget(_ target: AnyObject)
   {
      let events = UIControlEvents.touchUpInside
      if let actions = actions(forTarget: target, forControlEvent: events) {
         for action in actions {
            removeTarget(target, action: Selector(stringLiteral: action), for: events)
         }
      }
   }
   
   func updateTarget(_ target: AnyObject, selectorName: String)
   {
      removeAllActionsForTarget(target)
      addTarget(target, action: Selector(stringLiteral: selectorName), for: UIControlEvents.touchUpInside)
   }
}
