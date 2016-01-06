//
//  UIColor+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/16/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

enum GoalieHeadComponent {
   case Background, Cheeks, Chin
}

/*
Empty:
- background: (106, 104, 181)
- cheeks: (249, 205, 223, 0.2)
- chin: (30, 94, 99, .2)

AGES:
- background: (8, 207, 152)
- cheeks: (249, 205, 223, 0.4)
- chin: (29, 153, 118, 0.2)

LATER:
- background: (14, 127, 204)
- cheeks: (249, 205, 223, 0.4)
- chin: (28, 77, 109, 0.2)

SOON:
- background: (106, 104, 181)
- cheeks: (249, 205, 223, 0.4)
- chin: (198, 133, 16, 0.3)

ASAP:
- background: (211, 57, 87)
- cheeks: (249, 205, 223, 0.3)
- chin: (153, 29, 59, 0.2)
*/

private func _rgb(priority: TaskPriority, component: GoalieHeadComponent) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
   switch component
   {
   case .Background:
      values = _headBackgroundRGBA(priority)
   case .Cheeks:
      values = _headCheeksRGBA(priority)
   case .Chin:
      values = _headChinRGBA(priority)
   }
   return values
}

private func _headBackgroundRGBA(priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
   switch priority
   {
   case .Ages:
      values = (8, 207, 152, 1)
      break
   case .Later:
      values = (14, 127, 204, 1)
      break
   case .Soon:
      values = (229, 161, 23, 1)
      break
   case .ASAP:
      values = (211, 57, 87, 1)
      break
   case .Unknown:
      values = (106, 104, 181, 1)
      break
   }
   values = (values.r/255.0, values.g/255.0, values.b/255.0, values.a)
   return values
}

private func _headCheeksRGBA(priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
   switch priority
   {
   case .Ages:
      values = (249, 205, 223, 0.4)
      break
   case .Later:
      values = (249, 205, 223, 0.4)
      break
   case .Soon:
      values = (249, 205, 223, 0.4)
      break
   case .ASAP:
      values = (249, 205, 223, 0.3)
      break
   case .Unknown:
      values = (249, 205, 223, 0.2)
      break
   }
   values = (values.r/255.0, values.g/255.0, values.b/255.0, values.a)
   return values
}

private func _headChinRGBA(priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
   switch priority
   {
   case .Ages:
      values = (29, 153, 118, 0.2)
      break
   case .Later:
      values = (28, 77, 109, 0.2)
      break
   case .Soon:
      values = (198, 133, 16, 0.3)
      break
   case .ASAP:
      values = (153, 29, 59, 0.2)
      break
   case .Unknown:
      values = (30, 94, 99, 0.2)
      break
   }
   values = (values.r/255.0, values.g/255.0, values.b/255.0, values.a)
   return values
}

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
   case .Unknown:
      values = (228, 229, 231)
      break
   }
   values = (values.r/255.0, values.g/255.0, values.b/255.0)
   return values
}


private func _headerBackgroundRGBValuesForPriority(priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat)
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
   case .Unknown:
      values = (130, 122, 209)
      break
   }
   values = (values.r/255.0, values.g/255.0, values.b/255.0)
   return values
}

extension UIColor
{
   convenience init(priority: TaskPriority, headComponent: GoalieHeadComponent)
   {
      let values = _rgb(priority, component: headComponent)
      let color = UIColor(colorLiteralRed: Float(values.r), green: Float(values.g), blue: Float(values.b), alpha: Float(values.a))
      self.init(CGColor: color.CGColor)
   }
   
   convenience init(priority: TaskPriority)
   {
      let values = _rgbValuesForPriority(priority)
      let color = UIColor(colorLiteralRed: Float(values.r), green: Float(values.g), blue: Float(values.b), alpha: 1)
      self.init(CGColor: color.CGColor)
   }
   
   static func goalieHeaderBackgroundColor(averagePriority: TaskPriority) -> UIColor
   {
      let values = _headerBackgroundRGBValuesForPriority(averagePriority)
      return UIColor(colorLiteralRed: Float(values.r), green: Float(values.g), blue: Float(values.b), alpha: 1)
   }
   
   private convenience init(r: CGFloat, g: CGFloat, b: CGFloat)
   {
      self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
   }
   
   static func goalieEmptyTasksColor() -> UIColor
   {
      return UIColor(colorLiteralRed: 130/255.0, green: 122/255.0, blue: 209/255.0, alpha: 1)
   }
   
   static func goalieGrayColor() -> UIColor
   {
      return UIColor(colorLiteralRed: 228/255.0, green: 229/255.0, blue: 231/255.0, alpha: 1)
   }
}
