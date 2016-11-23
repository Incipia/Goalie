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
   case bricks, weight, jumprope, waterBottle, clock, plant, soda, homeWindow, workClock, computer, lamp, workWindow, unknown
   
   func drawRect(_ frame: CGRect, priority: TaskPriority)
   {
      switch self {
      case .bricks: BricksAccessoryKit.drawWithFrame(frame, priority: priority)
      case .weight: WeightAccessoryKit.drawWithFrame(frame, priority: priority)
      case .jumprope: JumpropeAccessoryKit.drawWithFrame(frame, priority: priority)
      case .waterBottle: WaterBottleAccessoryKit.drawWithFrame(frame, priority: priority)
      case .clock: ClockAccessoryKit.drawWithFrame(frame, priority: priority)
      case .plant: PlantAccessoryKit.drawWithFrame(frame, priority: priority)
      case .soda: SodaAccessoryKit.drawWithFrame(frame, priority: priority)
      case .homeWindow: HomeWindowAccessoryKit.drawWithFrame(frame, priority: priority)
      case .workClock: WorkClockAccessoryKit.drawWithFrame(frame, priority: priority)
      case .computer: ComputerAccessoryKit.drawWithFrame(frame, priority: priority)
      case .lamp: LampAccessoryKit.drawWithFrame(frame, priority: priority)
      case .workWindow: WorkWindowAccessoryKit.drawWithFrame(frame, priority: priority)
      case .unknown: _drawPurpleRect(frame)
      }
   }
   
   fileprivate func _drawPurpleRect(_ rect: CGRect)
   {
      UIColor.purple.setFill()
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
      case .bricks: size = (79, 40)
      case .weight: size = (60, 30)
      case .jumprope: size = (36, 58)
      case .waterBottle: size = (22, 40)
      case .clock: size = (42, 44)
      case .plant: size = (26, 54)
      case .soda: size = (22, 36)
      case .homeWindow: size = (58, 56)
      case .workClock: size = (42, 42)
      case .computer: size = (70, 39)
      case .lamp: size = (42, 48)
      case .workWindow: size = (77, 50)
      case .unknown: size = (100, 100)
      }
      self.init(width: size.w, height: size.h)
   }
}
