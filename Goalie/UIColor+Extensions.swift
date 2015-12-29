//
//  UIColor+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/16/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

private func _rgbValuesForPriority(priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat) = (0, 0, 0)
   switch priority
   {
   case .Ages:
      values = (18, 225, 168)
      break
   case .Later:
      values = (18, 164, 255)
      break
   case .Soon:
      values = (255, 200, 31)
      break
   case .ASAP:
      values = (255, 80, 100)
      break
   }
   return values
}

extension UIColor
{
   convenience init(priority: TaskPriority)
   {
      let values = _rgbValuesForPriority(priority)
      self.init(r: values.r, g: values.b, b: values.b)
   }
   
   private convenience init(r: CGFloat, g: CGFloat, b: CGFloat)
   {
      self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
   }
   
   static func mainTabBarColor() -> UIColor
   {
      return UIColor(r: 39, g: 44, b: 67)
   }
   
   static func mainNavBarColor() -> UIColor
   {
      return UIColor(r: 39, g: 44, b: 67)
   }
   
   static func lightBlueTextColor() -> UIColor
   {
      return UIColor(r: 109, g: 202, b: 203)
   }
   
   static func lightPurpleTextColor() -> UIColor
   {
      return UIColor(r: 124, g: 124, b: 163)
   }
   
   static func lightPurpleBackgroundColor() -> UIColor
   {
      return UIColor(r: 59, g: 63, b: 90)
   }
   
   static func todayTomorrowTableBackgroundColor() -> UIColor
   {
      return UIColor(r: 59, g: 63, b: 90)
   }
   
   static func mainBackgroundColor() -> UIColor
   {
      return UIColor(r: 46, g: 49, b: 79)
   }
   
   static func darkCellAlternateColor() -> UIColor
   {
      return UIColor(r: 45, g: 49, b: 78)
   }
   
   static func lightCellAlternateColor() -> UIColor
   {
      return UIColor(r: 55, g: 57, b: 86)
   }
}
