//
//  UIColor+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/16/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

enum GoalieHeadComponent {
   case background, cheek, chin, stripe
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

private func _rgb(_ priority: TaskPriority, component: GoalieHeadComponent) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
   switch component
   {
   case .background:
      values = _headBackgroundRGBA(priority)
   case .cheek:
      values = _headCheeksRGBA(priority)
   case .chin:
      values = _headChinRGBA(priority)
   case .stripe:
      values = _headStripeRGBA(priority)
   }
   return values
}

private func _headBackgroundRGBA(_ priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
   switch priority
   {
   case .ages:
      values = (4, 191, 133, 1)
      break
   case .later:
      values = (14, 127, 204, 1)
      break
   case .soon:
      values = (229, 161, 23, 1)
      break
   case .asap:
      values = (211, 57, 87, 1)
      break
   case .unknown:
      values = (106, 104, 181, 1)
      break
   }
   values = (values.r/255.0, values.g/255.0, values.b/255.0, values.a)
   return values
}

private func _headCheeksRGBA(_ priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
   switch priority
   {
   case .ages:
      values = (249, 205, 223, 0.4)
      break
   case .later:
      values = (249, 205, 223, 0.4)
      break
   case .soon:
      values = (249, 205, 223, 0.4)
      break
   case .asap:
      values = (249, 205, 223, 0.3)
      break
   case .unknown:
      values = (249, 205, 223, 0.2)
      break
   }
   values = (values.r/255.0, values.g/255.0, values.b/255.0, values.a)
   return values
}

private func _headChinRGBA(_ priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
   switch priority
   {
   case .ages:
      values = (29, 153, 118, 0.2)
      break
   case .later:
      values = (28, 77, 109, 0.2)
      break
   case .soon:
      values = (198, 133, 16, 0.3)
      break
   case .asap:
      values = (153, 29, 59, 0.2)
      break
   case .unknown:
      values = (30, 94, 99, 0.2)
      break
   }
   values = (values.r/255.0, values.g/255.0, values.b/255.0, values.a)
   return values
}

private func _headStripeRGBA(_ priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
   switch priority
   {
   case .ages:
      values = (29, 100, 79, 1)
      break
   case .later:
      values = (28, 77, 109, 1)
      break
   case .soon:
      values = (198, 133, 16, 1)
      break
   case .asap:
      values = (153, 29, 59, 1)
      break
   case .unknown:
      values = (74, 74, 147, 1)
      break
   }
   values = (values.r/255.0, values.g/255.0, values.b/255.0, values.a)
   return values
}

private func _rgbValuesForPriority(_ priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat) = (0, 0, 0)
   switch priority
   {
   case .ages:
      values = (18, 225, 168)
      break
   case .later:
      values = (18, 164, 255)
      break
   case .soon:
      values = (255, 200, 31)
      break
   case .asap:
      values = (255, 80, 100)
      break
   case .unknown:
      values = (228, 229, 231)
      break
   }
   values = (values.r/255.0, values.g/255.0, values.b/255.0)
   return values
}


private func _headerBackgroundRGBValuesForPriority(_ priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat) = (0, 0, 0)
   switch priority
   {
   case .ages:
      values = (18, 225, 168)
      break
   case .later:
      values = (18, 164, 255)
      break
   case .soon:
      values = (255, 200, 31)
      break
   case .asap:
      values = (255, 80, 100)
      break
   case .unknown:
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
      self.init(cgColor: color.cgColor)
   }
   
   convenience init(priority: TaskPriority)
   {
      let values = _rgbValuesForPriority(priority)
      let color = UIColor(colorLiteralRed: Float(values.r), green: Float(values.g), blue: Float(values.b), alpha: 1)
      self.init(cgColor: color.cgColor)
   }
   
   static func goalieHeaderBackgroundColor(_ averagePriority: TaskPriority) -> UIColor
   {
      let values = _headerBackgroundRGBValuesForPriority(averagePriority)
      return UIColor(colorLiteralRed: Float(values.r), green: Float(values.g), blue: Float(values.b), alpha: 1)
   }
   
   fileprivate convenience init(r: CGFloat, g: CGFloat, b: CGFloat)
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
   
   static func lightGoalieGrayColor() -> UIColor
   {
      return UIColor(colorLiteralRed: 228/255.0, green: 229/255.0, blue: 231/255.0, alpha: 0.6)
   }
   
   static func eyeColorForPriority(_ priority: TaskPriority) -> UIColor
   {
      switch priority
      {
      case .ages: return UIColor(red: 0.098, green: 0.324, blue: 0.243, alpha: 1.000)
      case .later: return UIColor(red: 0.090, green: 0.233, blue: 0.352, alpha: 1.000)
      case .soon: return UIColor(red: 0.611, green: 0.356, blue: 0.044, alpha: 1.000)
      case .asap: return UIColor(red: 0.522, green: 0.053, blue: 0.177, alpha: 1.000)
      case .unknown: return UIColor(red: 0.225, green: 0.211, blue: 0.504, alpha: 1.000)
      }
   }
   
   static func bizeeBeeCheeckColor(_ priority: TaskPriority) -> UIColor
   {
      switch priority
      {
      case .ages: return UIColor(red: 0.945, green: 0.890, blue: 0.914, alpha: 0.400)
      case .later: return UIColor(red: 0.965, green: 0.752, blue: 0.845, alpha: 0.300)
      case .soon: return UIColor(red: 0.965, green: 0.752, blue: 0.845, alpha: 0.300)
      case .asap: return UIColor(red: 0.965, green: 0.752, blue: 0.845, alpha: 0.300)
      case .unknown: return UIColor(red: 0.965, green: 0.752, blue: 0.845, alpha: 0.300)
      }
   }
   
   static func bizeeBeeStripeColor(_ priority: TaskPriority) -> UIColor
   {
      switch priority
      {
      case .ages: return UIColor(red: 0.098, green: 0.325, blue: 0.243, alpha: 0.400)
      case .later: return UIColor(red: 0.090, green: 0.233, blue: 0.352, alpha: 0.400)
      case .soon: return UIColor(red: 0.722, green: 0.448, blue: 0.061, alpha: 1.000)
      case .asap: return UIColor(red: 0.522, green: 0.053, blue: 0.177, alpha: 0.400)
      case .unknown: return UIColor(red: 0.225, green: 0.211, blue: 0.504, alpha: 0.400)
      }
   }
}
