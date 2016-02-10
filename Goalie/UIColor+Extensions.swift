//
//  UIColor+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/16/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

enum GoalieHeadComponent {
   case Background, Cheek, Chin, Stripe
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
   case .Cheek:
      values = _headCheeksRGBA(priority)
   case .Chin:
      values = _headChinRGBA(priority)
   case .Stripe:
      values = _headStripeRGBA(priority)
   }
   return values
}

private func _headBackgroundRGBA(priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
   switch priority
   {
   case .Ages:
      values = (4, 191, 133, 1)
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

private func _headStripeRGBA(priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
   switch priority
   {
   case .Ages:
      values = (29, 100, 79, 1)
      break
   case .Later:
      values = (28, 77, 109, 1)
      break
   case .Soon:
      values = (198, 133, 16, 1)
      break
   case .ASAP:
      values = (153, 29, 59, 1)
      break
   case .Unknown:
      values = (74, 74, 147, 1)
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
   
   convenience init(rgbValues: (r: Float, g: Float, b: Float))
   {
      self.init(colorLiteralRed: rgbValues.r/255.0, green: rgbValues.g/255.0, blue: rgbValues.b/255.0, alpha: 1)
   }
   
   static func goalieEmptyTasksColor() -> UIColor
   {
      return UIColor(colorLiteralRed: 130/255.0, green: 122/255.0, blue: 209/255.0, alpha: 1)
   }
   
   static func goalieGrayColor() -> UIColor
   {
      return UIColor(colorLiteralRed: 228/255.0, green: 229/255.0, blue: 231/255.0, alpha: 1)
   }
   
   static func eyeColorForPriority(priority: TaskPriority) -> UIColor
   {
      switch priority
      {
      case .Ages: return UIColor(red: 0.098, green: 0.324, blue: 0.243, alpha: 1.000)
      case .Later: return UIColor(red: 0.090, green: 0.233, blue: 0.352, alpha: 1.000)
      case .Soon: return UIColor(red: 0.611, green: 0.356, blue: 0.044, alpha: 1.000)
      case .ASAP: return UIColor(red: 0.522, green: 0.053, blue: 0.177, alpha: 1.000)
      case .Unknown: return UIColor(red: 0.225, green: 0.211, blue: 0.504, alpha: 1.000)
      }
   }
   
   static func bizeeBeeCheeckColor(priority: TaskPriority) -> UIColor
   {
      switch priority
      {
      case .Ages: return UIColor(red: 0.945, green: 0.890, blue: 0.914, alpha: 0.400)
      case .Later: return UIColor(red: 0.965, green: 0.752, blue: 0.845, alpha: 0.300)
      case .Soon: return UIColor(red: 0.965, green: 0.752, blue: 0.845, alpha: 0.300)
      case .ASAP: return UIColor(red: 0.965, green: 0.752, blue: 0.845, alpha: 0.300)
      case .Unknown: return UIColor(red: 0.965, green: 0.752, blue: 0.845, alpha: 0.300)
      }
   }
   
   static func bizeeBeeStripeColor(priority: TaskPriority) -> UIColor
   {
      switch priority
      {
      case .Ages: return UIColor(red: 0.098, green: 0.325, blue: 0.243, alpha: 0.400)
      case .Later: return UIColor(red: 0.090, green: 0.233, blue: 0.352, alpha: 0.400)
      case .Soon: return UIColor(red: 0.722, green: 0.448, blue: 0.061, alpha: 1.000)
      case .ASAP: return UIColor(red: 0.522, green: 0.053, blue: 0.177, alpha: 0.400)
      case .Unknown: return UIColor(red: 0.225, green: 0.211, blue: 0.504, alpha: 0.400)
      }
   }
}
