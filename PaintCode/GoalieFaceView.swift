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
   private var _cheekColor: UIColor {
      return UIColor(priority: _currentPriority, headComponent: .Cheek)
   }
   private var _chinColor: UIColor {
      return UIColor(priority: _currentPriority, headComponent: .Chin)
   }
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      backgroundColor = UIColor.clearColor()
   }
   
   // MARK: - Public
   func updateWithPriority(priority: TaskPriority)
   {
      _currentPriority = priority
      setNeedsDisplay()
   }
   
   // MARK: - Private
   private func _drawHead()
   {
      GoalieHeadKit.drawGoalieHead(backgroundColor: _headBackgroundColor, cheekColor: _cheekColor, chinColor: _chinColor)
   }
   
   private func _drawFace()
   {
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
   
   override func drawRect(rect: CGRect)
   {
      _drawHead()
      _drawFace()
   }
}
