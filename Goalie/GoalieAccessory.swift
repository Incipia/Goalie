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
   case Bricks, Weight, Jumprope, WaterBottle, Clock, Plant, Soda, HomeWindow, WorkClock, Computer, Lamp, WorkWindow, Unknown
   
   func drawRect(frame: CGRect, priority: TaskPriority)
   {
      switch self {
      case Bricks: BricksAccessoryKit.drawWithFrame(frame, priority: priority)
      case Weight: WeightAccessoryKit.drawWithFrame(frame, priority: priority)
      case Jumprope: JumpropeAccessoryKit.drawWithFrame(frame, priority: priority)
      case WaterBottle: WaterBottleAccessoryKit.drawWithFrame(frame, priority: priority)
      case Clock: ClockAccessoryKit.drawWithFrame(frame, priority: priority)
      case Plant: PlantAccessoryKit.drawWithFrame(frame, priority: priority)
      case Soda: SodaAccessoryKit.drawWithFrame(frame, priority: priority)
      case HomeWindow: HomeWindowAccessoryKit.drawWithFrame(frame, priority: priority)
      case WorkClock: WorkClockAccessoryKit.drawWithFrame(frame, priority: priority)
      case Computer: ComputerAccessoryKit.drawWithFrame(frame, priority: priority)
      case Lamp: LampAccessoryKit.drawWithFrame(frame, priority: priority)
      case WorkWindow: WorkWindowAccessoryKit.drawWithFrame(frame, priority: priority)
      case Unknown: _drawPurpleRect(frame)
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
      case .WaterBottle: size = (22, 40)
      case .Clock: size = (42, 44)
      case .Plant: size = (26, 54)
      case .Soda: size = (22, 36)
      case .HomeWindow: size = (58, 56)
      case .WorkClock: size = (42, 42)
      case .Computer: size = (70, 39)
      case .Lamp: size = (42, 48)
      case .WorkWindow: size = (77, 50)
      case .Unknown: size = (100, 100)
      }
      self.init(width: size.w, height: size.h)
   }
}
