//
//  GoalieAccessory.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

enum GoalieAccessory
{
   case Bricks, Weight, Jumprope, WaterBottle, Unknown
   
   func drawRect(frame: CGRect, priority: TaskPriority)
   {
      switch self {
      case .Bricks: BricksAccessoryKit.drawWithFrame(frame, priority: priority)
      case .Weight: WeightAccessoryKit.drawWithFrame(frame, priority: priority)
      case .Jumprope: JumpropeAccessoryKit.drawWithFrame(frame, priority: priority)
      case .WaterBottle: WaterBottleAccessoryKit.drawWithFrame(frame, priority: priority)
      case .Unknown: _drawPurpleRect(frame)
      }
   }
   
   private func _drawPurpleRect(rect: CGRect)
   {
      UIColor.purpleColor().setFill()
      UIRectFill(rect)
   }
}

extension CGSize
{
   init(accessory: GoalieAccessory)
   {
      var size: (w: Int, h: Int)
      switch accessory
      {
      case .Bricks: size = (79, 40)
      case .Weight: size = (60, 30)
      case .Jumprope: size = (36, 58)
      case .Unknown: size = (100, 100)
      case .WaterBottle: size = (22,40)
      }
      self.init(width: size.w, height: size.h)
   }
}
