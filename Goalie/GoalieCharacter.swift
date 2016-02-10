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
   case Goalie, BizeeBee, Unknown
   
   func drawRect(rect: CGRect, withPriority priority: TaskPriority)
   {
      switch self {
      case .Goalie: _drawGoalieCharacterWithPriority(priority)
      case .BizeeBee: _drawBizeeBeeCharacterWithPriority(priority)
      case .Unknown: _drawPurpleRect(rect)
      }
   }
   
   private func _drawPurpleRect(rect: CGRect)
   {
      UIColor.purpleColor().setFill()
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
   
   private func _drawBizeeBeeCharacterWithPriority(priority: TaskPriority)
   {
      let bgColor = UIColor(priority: priority, headComponent: .Background)
      let cheekColor = UIColor(priority: priority, headComponent: .Cheek)
      let stripeColor = UIColor(priority: priority, headComponent: .Stripe)
      
      BizeeBeeCharacterKit.drawBody(bgColor, cheekColor: cheekColor, stripeColor: stripeColor)
      BizeeBeeCharacterKit.drawAccessoriesForPriority(priority)
   }
}

extension CGSize
{
   init(character: GoalieCharacter)
   {
      var size: (w: Int, h: Int)
      switch character
      {
      case .Unknown: size = (100, 100)
      case .Goalie: size = (80, 100)
      case .BizeeBee: size = (85, 100)
      }
      self.init(width: size.w, height: size.h)
   }
}