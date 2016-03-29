//
//  CharacterEnums.swift
//  Goalie
//
//  Created by Gregory Klein on 1/14/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

enum GoalieCharacter: Int
{
   case Goalie, BizeeBee, Fox, Checklistor, Unknown
   
   func drawRect(rect: CGRect, withPriority priority: TaskPriority)
   {
      switch self {
      case .Goalie: _drawGoalieCharacterWithPriority(priority)
      case .BizeeBee: _drawBizeeBeeCharacterWithPriority(priority)
      case .Fox: _drawFoxCharacterWithPriority(priority)
      case .Checklistor: _drawChecklistorWithPriority(priority)
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
      let cheekColor = UIColor.bizeeBeeCheeckColor(priority)
      let stripeColor = UIColor.bizeeBeeStripeColor(priority)
      
      BizeeBeeCharacterKit.drawBody(bgColor, cheekColor: cheekColor, stripeColor: stripeColor)
      BizeeBeeCharacterKit.drawAccessoriesForPriority(priority)
   }
   
   private func _drawFoxCharacterWithPriority(priority: TaskPriority)
   {
      let bgColor = UIColor(priority: priority, headComponent: .Background)
      let cheekColor = UIColor(priority: priority, headComponent: .Cheek)
      let stripeColor = UIColor.bizeeBeeStripeColor(priority)
      let noseColor = UIColor.eyeColorForPriority(priority)
      
      FoxCharacterKit.drawBody(bgColor, cheekColor: cheekColor, outerCheekColor: stripeColor, noseColor: noseColor)
      FoxCharacterKit.drawAccessoriesForPriority(priority)
   }
   
   private func _drawChecklistorWithPriority(priority: TaskPriority)
   {
      let bgColor = UIColor(priority: priority, headComponent: .Background)
      let cheekColor = UIColor(priority: priority, headComponent: .Cheek)
      
      ChecklistorCharacterKit.drawBody(bgColor, cheekColor: cheekColor)
      ChecklistorCharacterKit.drawAccessoriesForPriority(priority)
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
      case .BizeeBee: size = (90, 100)
      case .Fox: size = (100, 105)
      case .Checklistor: size = (100, 100)
      }
      self.init(width: size.w, height: size.h)
   }
}