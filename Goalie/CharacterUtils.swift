//
//  CharacterEnums.swift
//  Goalie
//
//  Created by Gregory Klein on 1/14/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

enum GoalieCharacter
{
   case Goalie, Unknown
   
   func drawRect(rect: CGRect, withPriority priority: TaskPriority)
   {
      switch self {
      case .Goalie: _drawGoalieCharacterWithPriority(priority)
      case .Unknown: _drawBlueRect(rect)
      }
   }
   
   private func _drawBlueRect(rect: CGRect)
   {
      UIColor.blueColor().colorWithAlphaComponent(0.5).setFill()
      UIRectFill(rect)
   }
   
   private func _drawGoalieCharacterWithPriority(priority: TaskPriority)
   {
      let bgColor = UIColor(priority: priority, headComponent: .Background)
      let cheekColor = UIColor(priority: priority, headComponent: .Cheek)
      let chinColor = UIColor(priority: priority, headComponent: .Chin)
      
      GoalieCharacterKit.drawGoalieHead(backgroundColor: bgColor, cheekColor: cheekColor, chinColor: chinColor)
      GoalieCharacterKit.drawAccessoriesForPriority(priority)
   }
}

extension CGSize
{
   init(character: GoalieCharacter)
   {
      var size: (w: Int, h: Int)
      switch character
      {
      case .Unknown: size = (130, 100)
      case .Goalie: size = (80, 100)
      }
      self.init(width: size.w, height: size.h)
   }
}