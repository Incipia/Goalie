//
//  GoalieCharacterView.swift
//  Goalie
//
//  Created by Gregory Klein on 1/5/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class GoalieCharacterView: BaseCharacterView
{
   private var _headBackgroundColor: UIColor {
      return UIColor(priority: _currentPriority, headComponent: .Background)
   }
   private var _cheekColor: UIColor {
      return UIColor(priority: _currentPriority, headComponent: .Cheek)
   }
   private var _chinColor: UIColor {
      return UIColor(priority: _currentPriority, headComponent: .Chin)
   }
   
   override func drawRect(rect: CGRect)
   {
      GoalieCharacterKit.drawGoalieHead(backgroundColor: _headBackgroundColor, cheekColor: _cheekColor, chinColor: _chinColor)
      GoalieCharacterKit.drawAccessoriesForPriority(_currentPriority)
   }
}
