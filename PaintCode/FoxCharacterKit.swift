//
//  File.swift
//  Goalie
//
//  Created by Gregory Klein on 3/25/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class FoxCharacterKit
{
   class func drawAccessoriesForPriority(priority: TaskPriority)
   {
      switch priority
      {
      case .Unknown: _drawSleepingEyes() // considered accessory for now
      case .Ages: _drawSunglasses()
      default:
         break
      }
   }
   
   private static func _drawSunglasses()
   {
      //// Color Declarations
      let fillColor25 = UIColor(priority: .Ages, headComponent: .Stripe)
      
      //// Sunglasses
      //// Bezier 14 Drawing
      let bezier14Path = UIBezierPath()
      bezier14Path.moveToPoint(CGPointMake(36.38, 36.2))
      bezier14Path.addLineToPoint(CGPointMake(31.92, 36.2))
      bezier14Path.addCurveToPoint(CGPointMake(28.01, 32.03), controlPoint1: CGPointMake(29.75, 36.2), controlPoint2: CGPointMake(28.01, 34.34))
      bezier14Path.addLineToPoint(CGPointMake(28.01, 26.44))
      bezier14Path.addCurveToPoint(CGPointMake(28.67, 25.73), controlPoint1: CGPointMake(28.01, 26.03), controlPoint2: CGPointMake(28.3, 25.73))
      bezier14Path.addLineToPoint(CGPointMake(36.38, 25.73))
      bezier14Path.addCurveToPoint(CGPointMake(40.29, 29.91), controlPoint1: CGPointMake(38.55, 25.73), controlPoint2: CGPointMake(40.29, 27.6))
      bezier14Path.addLineToPoint(CGPointMake(40.29, 32.03))
      bezier14Path.addCurveToPoint(CGPointMake(36.38, 36.2), controlPoint1: CGPointMake(40.29, 34.29), controlPoint2: CGPointMake(38.55, 36.2))
      bezier14Path.closePath()
      fillColor25.setFill()
      bezier14Path.fill()
      
      
      //// Bezier 15 Drawing
      let bezier15Path = UIBezierPath()
      bezier15Path.moveToPoint(CGPointMake(60.13, 36.2))
      bezier15Path.addLineToPoint(CGPointMake(64.6, 36.2))
      bezier15Path.addCurveToPoint(CGPointMake(68.5, 32.03), controlPoint1: CGPointMake(66.76, 36.2), controlPoint2: CGPointMake(68.5, 34.34))
      bezier15Path.addLineToPoint(CGPointMake(68.5, 26.44))
      bezier15Path.addCurveToPoint(CGPointMake(67.84, 25.73), controlPoint1: CGPointMake(68.5, 26.03), controlPoint2: CGPointMake(68.22, 25.73))
      bezier15Path.addLineToPoint(CGPointMake(60.13, 25.73))
      bezier15Path.addCurveToPoint(CGPointMake(56.23, 29.91), controlPoint1: CGPointMake(57.97, 25.73), controlPoint2: CGPointMake(56.23, 27.6))
      bezier15Path.addLineToPoint(CGPointMake(56.23, 32.03))
      bezier15Path.addCurveToPoint(CGPointMake(60.13, 36.2), controlPoint1: CGPointMake(56.23, 34.29), controlPoint2: CGPointMake(57.97, 36.2))
      bezier15Path.closePath()
      fillColor25.setFill()
      bezier15Path.fill()
      
      
      //// Rectangle Drawing
      let rectanglePath = UIBezierPath(rect: CGRectMake(35.48, 25.75, 25.75, 2.1))
      fillColor25.setFill()
      rectanglePath.fill()
      
      
      //// Rectangle 2 Drawing
      let rectangle2Path = UIBezierPath(rect: CGRectMake(35.48, 29.1, 25.75, 2.1))
      fillColor25.setFill()
      rectangle2Path.fill()
   }
   
   private static func _drawSleepingEyes()
   {
      let eyeColor = UIColor.eyeColorForPriority(.Unknown)
      
      let fillColor21 = eyeColor
      
      //// Bezier 12 Drawing
      let bezier12Path = UIBezierPath()
      bezier12Path.moveToPoint(CGPointMake(66.97, 29.46))
      bezier12Path.addLineToPoint(CGPointMake(61.92, 29.46))
      bezier12Path.addCurveToPoint(CGPointMake(60.83, 30.05), controlPoint1: CGPointMake(61.44, 29.46), controlPoint2: CGPointMake(61.07, 29.71))
      bezier12Path.addCurveToPoint(CGPointMake(60.59, 31.28), controlPoint1: CGPointMake(60.59, 30.39), controlPoint2: CGPointMake(60.5, 30.83))
      bezier12Path.addCurveToPoint(CGPointMake(64.42, 34.22), controlPoint1: CGPointMake(61.11, 33.04), controlPoint2: CGPointMake(62.67, 34.22))
      bezier12Path.addCurveToPoint(CGPointMake(68.24, 31.28), controlPoint1: CGPointMake(66.17, 34.22), controlPoint2: CGPointMake(67.72, 32.99))
      bezier12Path.addCurveToPoint(CGPointMake(68.01, 30.05), controlPoint1: CGPointMake(68.34, 30.83), controlPoint2: CGPointMake(68.29, 30.44))
      bezier12Path.addCurveToPoint(CGPointMake(66.97, 29.46), controlPoint1: CGPointMake(67.82, 29.71), controlPoint2: CGPointMake(67.44, 29.46))
      bezier12Path.closePath()
      fillColor21.setFill()
      bezier12Path.fill()
      
      
      //// Bezier 13 Drawing
      let bezier13Path = UIBezierPath()
      bezier13Path.moveToPoint(CGPointMake(35.94, 30.05))
      bezier13Path.addCurveToPoint(CGPointMake(34.86, 29.46), controlPoint1: CGPointMake(35.66, 29.71), controlPoint2: CGPointMake(35.24, 29.46))
      bezier13Path.addLineToPoint(CGPointMake(29.85, 29.46))
      bezier13Path.addCurveToPoint(CGPointMake(28.77, 30.05), controlPoint1: CGPointMake(29.38, 29.46), controlPoint2: CGPointMake(29, 29.71))
      bezier13Path.addCurveToPoint(CGPointMake(28.53, 31.28), controlPoint1: CGPointMake(28.53, 30.39), controlPoint2: CGPointMake(28.44, 30.83))
      bezier13Path.addCurveToPoint(CGPointMake(32.36, 34.22), controlPoint1: CGPointMake(29.05, 33.04), controlPoint2: CGPointMake(30.61, 34.22))
      bezier13Path.addCurveToPoint(CGPointMake(36.18, 31.28), controlPoint1: CGPointMake(34.15, 34.22), controlPoint2: CGPointMake(35.66, 32.99))
      bezier13Path.addCurveToPoint(CGPointMake(35.94, 30.05), controlPoint1: CGPointMake(36.23, 30.83), controlPoint2: CGPointMake(36.18, 30.39))
      bezier13Path.closePath()
      fillColor21.setFill()
      bezier13Path.fill()
   }
   
   static func drawBody(bodyColor: UIColor, cheekColor: UIColor, outerCheekColor: UIColor, noseColor: UIColor)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Color Declarations
//      let bodyColor = UIColor(red: 0.340, green: 0.318, blue: 0.650, alpha: 1.000) // 18
//      let outerCheekColor = UIColor(red: 0.225, green: 0.211, blue: 0.504, alpha: 0.400) // 19
//      let cheekColor = UIColor(red: 0.965, green: 0.752, blue: 0.845, alpha: 0.300) // 20
//      let noseColor = UIColor(red: 0.225, green: 0.211, blue: 0.504, alpha: 1.000) // 21
      
      let fillColor18 = bodyColor
      let fillColor19 = outerCheekColor
      let fillColor20 = cheekColor
      let fillColor21 = noseColor
      
      //// Shadow Declarations
      let shadow = NSShadow()
      shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
      shadow.shadowOffset = CGSizeMake(-1.3, 6.1)
      shadow.shadowBlurRadius = 8
      
      //// Group
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(47.09, 26.57))
      bezierPath.addCurveToPoint(CGPointMake(35, 38.58), controlPoint1: CGPointMake(41.99, 28.92), controlPoint2: CGPointMake(37.6, 33.04))
      bezierPath.addCurveToPoint(CGPointMake(34.91, 38.78), controlPoint1: CGPointMake(34.95, 38.63), controlPoint2: CGPointMake(34.95, 38.68))
      bezierPath.addCurveToPoint(CGPointMake(32.54, 47.31), controlPoint1: CGPointMake(33.68, 41.42), controlPoint2: CGPointMake(32.83, 44.32))
      bezierPath.addCurveToPoint(CGPointMake(31.51, 85.15), controlPoint1: CGPointMake(31.36, 59.91), controlPoint2: CGPointMake(36.89, 72.99))
      bezierPath.addCurveToPoint(CGPointMake(33.44, 88), controlPoint1: CGPointMake(30.89, 86.52), controlPoint2: CGPointMake(31.98, 88.09))
      bezierPath.addCurveToPoint(CGPointMake(78.49, 62.85), controlPoint1: CGPointMake(50.3, 86.43), controlPoint2: CGPointMake(70.79, 80.05))
      bezierPath.addCurveToPoint(CGPointMake(67.72, 26.91), controlPoint1: CGPointMake(84.39, 49.66), controlPoint2: CGPointMake(80.85, 33.58))
      bezierPath.addCurveToPoint(CGPointMake(47.09, 26.57), controlPoint1: CGPointMake(61.07, 23.48), controlPoint2: CGPointMake(53.51, 23.63))
      bezierPath.closePath()
      fillColor18.setFill()
      bezierPath.fill()
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(47.09, 26.57))
      bezier2Path.addCurveToPoint(CGPointMake(35, 38.58), controlPoint1: CGPointMake(41.99, 28.92), controlPoint2: CGPointMake(37.6, 33.04))
      bezier2Path.addCurveToPoint(CGPointMake(34.91, 38.78), controlPoint1: CGPointMake(34.95, 38.63), controlPoint2: CGPointMake(34.95, 38.68))
      bezier2Path.addCurveToPoint(CGPointMake(32.54, 47.31), controlPoint1: CGPointMake(33.68, 41.42), controlPoint2: CGPointMake(32.83, 44.32))
      bezier2Path.addCurveToPoint(CGPointMake(31.51, 85.15), controlPoint1: CGPointMake(31.36, 59.91), controlPoint2: CGPointMake(36.89, 72.99))
      bezier2Path.addCurveToPoint(CGPointMake(33.44, 88), controlPoint1: CGPointMake(30.89, 86.52), controlPoint2: CGPointMake(31.98, 88.09))
      bezier2Path.addCurveToPoint(CGPointMake(78.49, 62.85), controlPoint1: CGPointMake(50.3, 86.43), controlPoint2: CGPointMake(70.79, 80.05))
      bezier2Path.addCurveToPoint(CGPointMake(67.72, 26.91), controlPoint1: CGPointMake(84.39, 49.66), controlPoint2: CGPointMake(80.85, 33.58))
      bezier2Path.addCurveToPoint(CGPointMake(47.09, 26.57), controlPoint1: CGPointMake(61.07, 23.48), controlPoint2: CGPointMake(53.51, 23.63))
      bezier2Path.closePath()
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, (shadow.shadowColor as! UIColor).CGColor)
      fillColor19.setFill()
      bezier2Path.fill()
      CGContextRestoreGState(context)
      
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(40.86, 15.98))
      bezier3Path.addCurveToPoint(CGPointMake(26.93, 8.04), controlPoint1: CGPointMake(40.86, 15.98), controlPoint2: CGPointMake(32.45, 7.35))
      bezier3Path.addCurveToPoint(CGPointMake(25.23, 28.33), controlPoint1: CGPointMake(26.93, 8.04), controlPoint2: CGPointMake(21.4, 18.63))
      fillColor18.setFill()
      bezier3Path.fill()
      
      
      //// Bezier 4 Drawing
      let bezier4Path = UIBezierPath()
      bezier4Path.moveToPoint(CGPointMake(54.69, 15.98))
      bezier4Path.addCurveToPoint(CGPointMake(68.62, 8.04), controlPoint1: CGPointMake(54.69, 15.98), controlPoint2: CGPointMake(63.1, 7.35))
      bezier4Path.addCurveToPoint(CGPointMake(70.32, 28.33), controlPoint1: CGPointMake(68.62, 8.04), controlPoint2: CGPointMake(74.15, 18.63))
      fillColor18.setFill()
      bezier4Path.fill()
      
      
      //// Bezier 5 Drawing
      let bezier5Path = UIBezierPath()
      bezier5Path.moveToPoint(CGPointMake(40.86, 15.98))
      bezier5Path.addCurveToPoint(CGPointMake(26.93, 8.04), controlPoint1: CGPointMake(40.86, 15.98), controlPoint2: CGPointMake(32.45, 7.35))
      bezier5Path.addCurveToPoint(CGPointMake(25.23, 28.33), controlPoint1: CGPointMake(26.93, 8.04), controlPoint2: CGPointMake(21.4, 18.63))
      fillColor19.setFill()
      bezier5Path.fill()
      
      
      //// Bezier 6 Drawing
      let bezier6Path = UIBezierPath()
      bezier6Path.moveToPoint(CGPointMake(54.69, 15.98))
      bezier6Path.addCurveToPoint(CGPointMake(68.62, 8.04), controlPoint1: CGPointMake(54.69, 15.98), controlPoint2: CGPointMake(63.1, 7.35))
      bezier6Path.addCurveToPoint(CGPointMake(70.32, 28.33), controlPoint1: CGPointMake(68.62, 8.04), controlPoint2: CGPointMake(74.15, 18.63))
      fillColor19.setFill()
      bezier6Path.fill()
      
      
      //// Bezier 7 Drawing
      let bezier7Path = UIBezierPath()
      bezier7Path.moveToPoint(CGPointMake(47.8, 13.04))
      bezier7Path.addCurveToPoint(CGPointMake(15.88, 40.59), controlPoint1: CGPointMake(47.8, 13.04), controlPoint2: CGPointMake(21.64, 11.81))
      bezier7Path.addCurveToPoint(CGPointMake(18.47, 44.46), controlPoint1: CGPointMake(15.5, 42.4), controlPoint2: CGPointMake(16.73, 44.17))
      bezier7Path.addCurveToPoint(CGPointMake(41.99, 61.62), controlPoint1: CGPointMake(23.67, 45.35), controlPoint2: CGPointMake(34.24, 48.78))
      bezier7Path.addCurveToPoint(CGPointMake(42.22, 61.96), controlPoint1: CGPointMake(42.08, 61.77), controlPoint2: CGPointMake(42.13, 61.87))
      bezier7Path.addCurveToPoint(CGPointMake(47.56, 65.59), controlPoint1: CGPointMake(42.89, 62.75), controlPoint2: CGPointMake(45.53, 65.84))
      bezier7Path.addCurveToPoint(CGPointMake(48.08, 65.59), controlPoint1: CGPointMake(47.75, 65.59), controlPoint2: CGPointMake(47.89, 65.59))
      bezier7Path.addCurveToPoint(CGPointMake(53.42, 61.96), controlPoint1: CGPointMake(50.11, 65.84), controlPoint2: CGPointMake(52.75, 62.75))
      bezier7Path.addCurveToPoint(CGPointMake(53.65, 61.62), controlPoint1: CGPointMake(53.51, 61.87), controlPoint2: CGPointMake(53.6, 61.72))
      bezier7Path.addCurveToPoint(CGPointMake(77.17, 44.46), controlPoint1: CGPointMake(61.35, 48.78), controlPoint2: CGPointMake(71.93, 45.35))
      bezier7Path.addCurveToPoint(CGPointMake(79.76, 40.59), controlPoint1: CGPointMake(78.91, 44.17), controlPoint2: CGPointMake(80.14, 42.4))
      bezier7Path.addCurveToPoint(CGPointMake(47.8, 13.04), controlPoint1: CGPointMake(73.96, 11.81), controlPoint2: CGPointMake(47.8, 13.04))
      bezier7Path.closePath()
      fillColor18.setFill()
      bezier7Path.fill()
      
      
      //// Bezier 8 Drawing
      let bezier8Path = UIBezierPath()
      bezier8Path.moveToPoint(CGPointMake(47.8, 13.04))
      bezier8Path.addCurveToPoint(CGPointMake(15.88, 40.59), controlPoint1: CGPointMake(47.8, 13.04), controlPoint2: CGPointMake(21.64, 11.81))
      bezier8Path.addCurveToPoint(CGPointMake(18.47, 44.46), controlPoint1: CGPointMake(15.5, 42.4), controlPoint2: CGPointMake(16.73, 44.17))
      bezier8Path.addCurveToPoint(CGPointMake(41.99, 61.62), controlPoint1: CGPointMake(23.67, 45.35), controlPoint2: CGPointMake(34.24, 48.78))
      bezier8Path.addCurveToPoint(CGPointMake(42.22, 61.96), controlPoint1: CGPointMake(42.08, 61.77), controlPoint2: CGPointMake(42.13, 61.87))
      bezier8Path.addCurveToPoint(CGPointMake(47.56, 65.59), controlPoint1: CGPointMake(42.89, 62.75), controlPoint2: CGPointMake(45.53, 65.84))
      bezier8Path.addCurveToPoint(CGPointMake(48.08, 65.59), controlPoint1: CGPointMake(47.75, 65.59), controlPoint2: CGPointMake(47.89, 65.59))
      bezier8Path.addCurveToPoint(CGPointMake(53.42, 61.96), controlPoint1: CGPointMake(50.11, 65.84), controlPoint2: CGPointMake(52.75, 62.75))
      bezier8Path.addCurveToPoint(CGPointMake(53.65, 61.62), controlPoint1: CGPointMake(53.51, 61.87), controlPoint2: CGPointMake(53.6, 61.72))
      bezier8Path.addCurveToPoint(CGPointMake(77.17, 44.46), controlPoint1: CGPointMake(61.35, 48.78), controlPoint2: CGPointMake(71.93, 45.35))
      bezier8Path.addCurveToPoint(CGPointMake(79.76, 40.59), controlPoint1: CGPointMake(78.91, 44.17), controlPoint2: CGPointMake(80.14, 42.4))
      bezier8Path.addCurveToPoint(CGPointMake(47.8, 13.04), controlPoint1: CGPointMake(73.96, 11.81), controlPoint2: CGPointMake(47.8, 13.04))
      bezier8Path.closePath()
      fillColor19.setFill()
      bezier8Path.fill()
      
      
      //// Left Outer Cheek Drawing
      let leftOuterCheekPath = UIBezierPath()
      leftOuterCheekPath.moveToPoint(CGPointMake(15.83, 40.59))
      leftOuterCheekPath.addCurveToPoint(CGPointMake(18.43, 44.46), controlPoint1: CGPointMake(15.45, 42.4), controlPoint2: CGPointMake(16.68, 44.17))
      leftOuterCheekPath.addCurveToPoint(CGPointMake(41.94, 61.62), controlPoint1: CGPointMake(23.62, 45.35), controlPoint2: CGPointMake(34.2, 48.78))
      leftOuterCheekPath.addCurveToPoint(CGPointMake(42.18, 61.96), controlPoint1: CGPointMake(42.04, 61.77), controlPoint2: CGPointMake(42.08, 61.87))
      leftOuterCheekPath.addCurveToPoint(CGPointMake(29.99, 18.14), controlPoint1: CGPointMake(42.18, 61.96), controlPoint2: CGPointMake(44.96, 30.49))
      leftOuterCheekPath.addCurveToPoint(CGPointMake(15.83, 40.59), controlPoint1: CGPointMake(24, 22.01), controlPoint2: CGPointMake(18.19, 28.78))
      leftOuterCheekPath.closePath()
      fillColor18.setFill()
      leftOuterCheekPath.fill()
      
      
      //// Right Outer Cheek Drawing
      let rightOuterCheekPath = UIBezierPath()
      rightOuterCheekPath.moveToPoint(CGPointMake(79.72, 40.59))
      rightOuterCheekPath.addCurveToPoint(CGPointMake(77.12, 44.46), controlPoint1: CGPointMake(80.09, 42.4), controlPoint2: CGPointMake(78.87, 44.17))
      rightOuterCheekPath.addCurveToPoint(CGPointMake(53.6, 61.62), controlPoint1: CGPointMake(71.93, 45.35), controlPoint2: CGPointMake(61.35, 48.78))
      rightOuterCheekPath.addCurveToPoint(CGPointMake(53.37, 61.96), controlPoint1: CGPointMake(53.51, 61.77), controlPoint2: CGPointMake(53.46, 61.87))
      rightOuterCheekPath.addCurveToPoint(CGPointMake(65.55, 18.14), controlPoint1: CGPointMake(53.37, 61.96), controlPoint2: CGPointMake(50.58, 30.49))
      rightOuterCheekPath.addCurveToPoint(CGPointMake(79.72, 40.59), controlPoint1: CGPointMake(71.55, 22.01), controlPoint2: CGPointMake(77.36, 28.78))
      rightOuterCheekPath.closePath()
      fillColor18.setFill()
      rightOuterCheekPath.fill()
      
      
      //// Left Cheek Drawing
      let leftCheekPath = UIBezierPath(ovalInRect: CGRectMake(21.71, 35.7, 5.1, 7.1))
      fillColor20.setFill()
      leftCheekPath.fill()
      
      
      //// Right Cheek Drawing
      let rightCheekPath = UIBezierPath(ovalInRect: CGRectMake(68.86, 35.7, 6.1, 7.1))
      fillColor20.setFill()
      rightCheekPath.fill()
      
      
      //// Nose Drawing
      let nosePath = UIBezierPath()
      nosePath.moveToPoint(CGPointMake(42.13, 61.87))
      nosePath.addCurveToPoint(CGPointMake(42.18, 61.96), controlPoint1: CGPointMake(42.13, 61.92), controlPoint2: CGPointMake(42.18, 61.92))
      nosePath.addCurveToPoint(CGPointMake(47.51, 65.59), controlPoint1: CGPointMake(42.84, 62.75), controlPoint2: CGPointMake(45.48, 65.84))
      nosePath.addCurveToPoint(CGPointMake(48.03, 65.59), controlPoint1: CGPointMake(47.7, 65.59), controlPoint2: CGPointMake(47.84, 65.59))
      nosePath.addCurveToPoint(CGPointMake(53.37, 61.96), controlPoint1: CGPointMake(50.06, 65.84), controlPoint2: CGPointMake(52.71, 62.75))
      nosePath.addCurveToPoint(CGPointMake(53.6, 61.62), controlPoint1: CGPointMake(53.46, 61.87), controlPoint2: CGPointMake(53.56, 61.72))
      nosePath.addCurveToPoint(CGPointMake(53.65, 61.57), controlPoint1: CGPointMake(53.6, 61.57), controlPoint2: CGPointMake(53.65, 61.57))
      nosePath.addCurveToPoint(CGPointMake(42.13, 61.87), controlPoint1: CGPointMake(48.13, 57.9), controlPoint2: CGPointMake(44.07, 60.2))
      nosePath.closePath()
      fillColor21.setFill()
      nosePath.fill()
   }
}