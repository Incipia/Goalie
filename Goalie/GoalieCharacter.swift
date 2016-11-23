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
   case goalie, bizeeBee, fox, checklistor, unknown
   
   func drawRect(_ rect: CGRect, withPriority priority: TaskPriority)
   {
      switch self {
      case .goalie: _drawGoalieCharacterWithPriority(priority)
      case .bizeeBee: _drawBizeeBeeCharacterWithPriority(priority)
      case .fox: _drawFoxCharacterWithPriority(priority)
      case .checklistor: _drawChecklistorWithPriority(priority)
      case .unknown: _drawPurpleRect(rect)
      }
   }
   
   fileprivate func _drawPurpleRect(_ rect: CGRect)
   {
      UIColor.purple.setFill()
      UIRectFill(rect)
   }
   
   fileprivate func _drawGoalieCharacterWithPriority(_ priority: TaskPriority)
   {
      let bgColor = UIColor(priority: priority, headComponent: .background)
      let cheekColor = UIColor(priority: priority, headComponent: .cheek)
      let chinColor = UIColor(priority: priority, headComponent: .chin)
      
      GoalieCharacterKit.drawGoalieHead(backgroundColor: bgColor, cheekColor: cheekColor, chinColor: chinColor)
      GoalieCharacterKit.drawAccessoriesForPriority(priority)
   }
   
   fileprivate func _drawBizeeBeeCharacterWithPriority(_ priority: TaskPriority)
   {
      let bgColor = UIColor(priority: priority, headComponent: .background)
      let cheekColor = UIColor.bizeeBeeCheeckColor(priority)
      let stripeColor = UIColor.bizeeBeeStripeColor(priority)
      let bowtieColor = UIColor.eyeColorForPriority(priority)
      
      BizeeBeeCharacterKit.drawBody(bgColor, cheekColor: cheekColor, stripeColor: stripeColor, bowtieColor: bowtieColor)
      BizeeBeeCharacterKit.drawAccessoriesForPriority(priority)
   }
   
   fileprivate func _drawFoxCharacterWithPriority(_ priority: TaskPriority)
   {
      let bgColor = UIColor(priority: priority, headComponent: .background)
      let cheekColor = UIColor(priority: priority, headComponent: .cheek)
      let stripeColor = UIColor.bizeeBeeStripeColor(priority)
      let noseColor = UIColor.eyeColorForPriority(priority)
      
      FoxCharacterKit.drawBody(bgColor, cheekColor: cheekColor, outerCheekColor: stripeColor, noseColor: noseColor)
      FoxCharacterKit.drawAccessoriesForPriority(priority)
   }
   
   fileprivate func _drawChecklistorWithPriority(_ priority: TaskPriority)
   {
      let bgColor = UIColor(priority: priority, headComponent: .background)
      let cheekColor = UIColor(priority: priority, headComponent: .cheek)
      
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
      case .unknown: size = (100, 100)
      case .goalie: size = (80, 100)
      case .bizeeBee: size = (90, 100)
      case .fox: size = (100, 105)
      case .checklistor: size = (100, 100)
      }
      self.init(width: size.w, height: size.h)
   }
}
