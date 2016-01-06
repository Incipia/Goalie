//
//  GoalieFaceView.swift
//  Goalie
//
//  Created by Gregory Klein on 1/5/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class GoalieFaceView: UIView
{
   private var _currentPriority: TaskPriority = .Unknown
   
   private var _headBackgroundColor: UIColor {
      return UIColor(priority: _currentPriority, headComponent: .Background)
   }
   private var _cheeksColor: UIColor {
      return UIColor(priority: _currentPriority, headComponent: .Cheeks)
   }
   private var _chinColor: UIColor {
      return UIColor(priority: _currentPriority, headComponent: .Chin)
   }
   
   func updateColorsForPriority(priority: TaskPriority)
   {
      _currentPriority = priority
      setNeedsDisplay()
   }
   
   override func drawRect(rect: CGRect)
   {
      // Drawing code
      GoalieStyleKit.drawGoalieHead(backgroundColor: _headBackgroundColor, cheekColor: _cheeksColor, chinColor: _chinColor)
      
      switch _currentPriority
      {
      case .Unknown:
         GoalieFaceKit.drawSleepingFace()
      case .Ages:
         GoalieFaceKit.drawAgesFace()
      case .Later:
         GoalieFaceKit.drawLaterFace()
      case .Soon:
         GoalieFaceKit.drawSoonFace()
      case .ASAP:
         GoalieFaceKit.drawASAPFace()
      }
   }
}
