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
      
      //// Group
      //// Sunglasses
      //// Bezier 14 Drawing
      let bezier14Path = UIBezierPath()
      bezier14Path.moveToPoint(CGPointMake(35.83, 35.2))
      bezier14Path.addLineToPoint(CGPointMake(30.59, 35.2))
      bezier14Path.addCurveToPoint(CGPointMake(26.01, 30.63), controlPoint1: CGPointMake(28.05, 35.2), controlPoint2: CGPointMake(26.01, 33.16))
      bezier14Path.addLineToPoint(CGPointMake(26.01, 24.5))
      bezier14Path.addCurveToPoint(CGPointMake(26.79, 23.73), controlPoint1: CGPointMake(26.01, 24.06), controlPoint2: CGPointMake(26.34, 23.73))
      bezier14Path.addLineToPoint(CGPointMake(35.83, 23.73))
      bezier14Path.addCurveToPoint(CGPointMake(40.41, 28.31), controlPoint1: CGPointMake(38.37, 23.73), controlPoint2: CGPointMake(40.41, 25.77))
      bezier14Path.addLineToPoint(CGPointMake(40.41, 30.63))
      bezier14Path.addCurveToPoint(CGPointMake(35.83, 35.2), controlPoint1: CGPointMake(40.41, 33.11), controlPoint2: CGPointMake(38.37, 35.2))
      bezier14Path.closePath()
      fillColor25.setFill()
      bezier14Path.fill()
      
      
      //// Bezier 15 Drawing
      let bezier15Path = UIBezierPath()
      bezier15Path.moveToPoint(CGPointMake(63.68, 35.2))
      bezier15Path.addLineToPoint(CGPointMake(68.92, 35.2))
      bezier15Path.addCurveToPoint(CGPointMake(73.5, 30.63), controlPoint1: CGPointMake(71.46, 35.2), controlPoint2: CGPointMake(73.5, 33.16))
      bezier15Path.addLineToPoint(CGPointMake(73.5, 24.5))
      bezier15Path.addCurveToPoint(CGPointMake(72.73, 23.73), controlPoint1: CGPointMake(73.5, 24.06), controlPoint2: CGPointMake(73.17, 23.73))
      bezier15Path.addLineToPoint(CGPointMake(63.68, 23.73))
      bezier15Path.addCurveToPoint(CGPointMake(59.1, 28.31), controlPoint1: CGPointMake(61.15, 23.73), controlPoint2: CGPointMake(59.1, 25.77))
      bezier15Path.addLineToPoint(CGPointMake(59.1, 30.63))
      bezier15Path.addCurveToPoint(CGPointMake(63.68, 35.2), controlPoint1: CGPointMake(59.1, 33.11), controlPoint2: CGPointMake(61.15, 35.2))
      bezier15Path.closePath()
      fillColor25.setFill()
      bezier15Path.fill()
      
      
      //// Rectangle Drawing
      let rectanglePath = UIBezierPath(rect: CGRectMake(34.48, 23.75, 30.75, 2.1))
      fillColor25.setFill()
      rectanglePath.fill()
      
      
      //// Rectangle 2 Drawing
      let rectangle2Path = UIBezierPath(rect: CGRectMake(34.48, 27.1, 30.75, 2.1))
      fillColor25.setFill()
      rectangle2Path.fill()
   }
   
   private static func _drawSleepingEyes()
   {
      let eyeColor = UIColor.eyeColorForPriority(.Unknown)
      
      //// Bezier 12 Drawing
      let bezier12Path = UIBezierPath()
      bezier12Path.moveToPoint(CGPointMake(69.22, 28.14))
      bezier12Path.addLineToPoint(CGPointMake(63.55, 28.14))
      bezier12Path.addCurveToPoint(CGPointMake(62.33, 28.81), controlPoint1: CGPointMake(63.02, 28.14), controlPoint2: CGPointMake(62.6, 28.42))
      bezier12Path.addCurveToPoint(CGPointMake(62.07, 30.19), controlPoint1: CGPointMake(62.07, 29.19), controlPoint2: CGPointMake(61.96, 29.69))
      bezier12Path.addCurveToPoint(CGPointMake(66.36, 33.49), controlPoint1: CGPointMake(62.65, 32.17), controlPoint2: CGPointMake(64.4, 33.49))
      bezier12Path.addCurveToPoint(CGPointMake(70.65, 30.19), controlPoint1: CGPointMake(68.32, 33.49), controlPoint2: CGPointMake(70.07, 32.12))
      bezier12Path.addCurveToPoint(CGPointMake(70.39, 28.81), controlPoint1: CGPointMake(70.76, 29.69), controlPoint2: CGPointMake(70.71, 29.25))
      bezier12Path.addCurveToPoint(CGPointMake(69.22, 28.14), controlPoint1: CGPointMake(70.18, 28.42), controlPoint2: CGPointMake(69.75, 28.14))
      bezier12Path.closePath()
      eyeColor.setFill()
      bezier12Path.fill()
      
      
      //// Bezier 13 Drawing
      let bezier13Path = UIBezierPath()
      bezier13Path.moveToPoint(CGPointMake(34.41, 28.81))
      bezier13Path.addCurveToPoint(CGPointMake(33.19, 28.14), controlPoint1: CGPointMake(34.09, 28.42), controlPoint2: CGPointMake(33.61, 28.14))
      bezier13Path.addLineToPoint(CGPointMake(27.57, 28.14))
      bezier13Path.addCurveToPoint(CGPointMake(26.36, 28.81), controlPoint1: CGPointMake(27.04, 28.14), controlPoint2: CGPointMake(26.62, 28.42))
      bezier13Path.addCurveToPoint(CGPointMake(26.09, 30.19), controlPoint1: CGPointMake(26.09, 29.19), controlPoint2: CGPointMake(25.98, 29.69))
      bezier13Path.addCurveToPoint(CGPointMake(30.38, 33.49), controlPoint1: CGPointMake(26.67, 32.17), controlPoint2: CGPointMake(28.42, 33.49))
      bezier13Path.addCurveToPoint(CGPointMake(34.67, 30.19), controlPoint1: CGPointMake(32.4, 33.49), controlPoint2: CGPointMake(34.09, 32.12))
      bezier13Path.addCurveToPoint(CGPointMake(34.41, 28.81), controlPoint1: CGPointMake(34.73, 29.69), controlPoint2: CGPointMake(34.67, 29.19))
      bezier13Path.closePath()
      eyeColor.setFill()
      bezier13Path.fill()

   }
   
   static func drawBody(bodyColor: UIColor, cheekColor: UIColor, outerCheekColor: UIColor, noseColor: UIColor, frame: CGRect)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Color Declarations
//      let bodyColor = UIColor(red: 0.340, green: 0.318, blue: 0.650, alpha: 1.000) // 18
//      let outerCheekColor = UIColor(red: 0.225, green: 0.211, blue: 0.504, alpha: 0.400) // 19
//      let cheekColor = UIColor(red: 0.965, green: 0.752, blue: 0.845, alpha: 0.300) // 20
//      let noseColor = UIColor(red: 0.225, green: 0.211, blue: 0.504, alpha: 1.000) // 21
      
      //// Shadow Declarations
      let shadow = NSShadow()
      shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
      shadow.shadowOffset = CGSizeMake(-1.1, 4.1)
      shadow.shadowBlurRadius = 8
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(46.91, 24.89))
      bezierPath.addCurveToPoint(CGPointMake(33.35, 38.4), controlPoint1: CGPointMake(41.19, 27.54), controlPoint2: CGPointMake(36.26, 32.17))
      bezierPath.addCurveToPoint(CGPointMake(33.24, 38.62), controlPoint1: CGPointMake(33.3, 38.46), controlPoint2: CGPointMake(33.3, 38.51))
      bezierPath.addCurveToPoint(CGPointMake(30.59, 48.22), controlPoint1: CGPointMake(31.87, 41.6), controlPoint2: CGPointMake(30.91, 44.86))
      bezierPath.addCurveToPoint(CGPointMake(29.43, 90.8), controlPoint1: CGPointMake(29.27, 62.39), controlPoint2: CGPointMake(35.47, 77.12))
      bezierPath.addCurveToPoint(CGPointMake(31.6, 94), controlPoint1: CGPointMake(28.74, 92.34), controlPoint2: CGPointMake(29.96, 94.11))
      bezierPath.addCurveToPoint(CGPointMake(82.15, 65.7), controlPoint1: CGPointMake(50.52, 92.23), controlPoint2: CGPointMake(73.51, 85.06))
      bezierPath.addCurveToPoint(CGPointMake(70.07, 25.28), controlPoint1: CGPointMake(88.78, 50.87), controlPoint2: CGPointMake(84.8, 32.78))
      bezierPath.addCurveToPoint(CGPointMake(46.91, 24.89), controlPoint1: CGPointMake(62.6, 21.42), controlPoint2: CGPointMake(54.12, 21.58))
      bezierPath.closePath()
      bodyColor.setFill()
      bezierPath.fill()
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(46.91, 24.89))
      bezier2Path.addCurveToPoint(CGPointMake(33.35, 38.4), controlPoint1: CGPointMake(41.19, 27.54), controlPoint2: CGPointMake(36.26, 32.17))
      bezier2Path.addCurveToPoint(CGPointMake(33.24, 38.62), controlPoint1: CGPointMake(33.3, 38.46), controlPoint2: CGPointMake(33.3, 38.51))
      bezier2Path.addCurveToPoint(CGPointMake(30.59, 48.22), controlPoint1: CGPointMake(31.87, 41.6), controlPoint2: CGPointMake(30.91, 44.86))
      bezier2Path.addCurveToPoint(CGPointMake(29.43, 90.8), controlPoint1: CGPointMake(29.27, 62.39), controlPoint2: CGPointMake(35.47, 77.12))
      bezier2Path.addCurveToPoint(CGPointMake(31.6, 94), controlPoint1: CGPointMake(28.74, 92.34), controlPoint2: CGPointMake(29.96, 94.11))
      bezier2Path.addCurveToPoint(CGPointMake(82.15, 65.7), controlPoint1: CGPointMake(50.52, 92.23), controlPoint2: CGPointMake(73.51, 85.06))
      bezier2Path.addCurveToPoint(CGPointMake(70.07, 25.28), controlPoint1: CGPointMake(88.78, 50.87), controlPoint2: CGPointMake(84.8, 32.78))
      bezier2Path.addCurveToPoint(CGPointMake(46.91, 24.89), controlPoint1: CGPointMake(62.6, 21.42), controlPoint2: CGPointMake(54.12, 21.58))
      bezier2Path.closePath()
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, (shadow.shadowColor as! UIColor).CGColor)
      outerCheekColor.setFill()
      bezier2Path.fill()
      CGContextRestoreGState(context)
      
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(39.92, 12.98))
      bezier3Path.addCurveToPoint(CGPointMake(24.29, 4.04), controlPoint1: CGPointMake(39.92, 12.98), controlPoint2: CGPointMake(30.49, 3.27))
      bezier3Path.addCurveToPoint(CGPointMake(22.38, 26.88), controlPoint1: CGPointMake(24.29, 4.04), controlPoint2: CGPointMake(18.09, 15.96))
      bodyColor.setFill()
      bezier3Path.fill()
      
      
      //// Bezier 4 Drawing
      let bezier4Path = UIBezierPath()
      bezier4Path.moveToPoint(CGPointMake(55.45, 12.98))
      bezier4Path.addCurveToPoint(CGPointMake(71.08, 4.04), controlPoint1: CGPointMake(55.45, 12.98), controlPoint2: CGPointMake(64.88, 3.27))
      bezier4Path.addCurveToPoint(CGPointMake(72.99, 26.88), controlPoint1: CGPointMake(71.08, 4.04), controlPoint2: CGPointMake(77.28, 15.96))
      bodyColor.setFill()
      bezier4Path.fill()
      
      
      //// Bezier 5 Drawing
      let bezier5Path = UIBezierPath()
      bezier5Path.moveToPoint(CGPointMake(39.92, 12.98))
      bezier5Path.addCurveToPoint(CGPointMake(24.29, 4.04), controlPoint1: CGPointMake(39.92, 12.98), controlPoint2: CGPointMake(30.49, 3.27))
      bezier5Path.addCurveToPoint(CGPointMake(22.38, 26.88), controlPoint1: CGPointMake(24.29, 4.04), controlPoint2: CGPointMake(18.09, 15.96))
      outerCheekColor.setFill()
      bezier5Path.fill()
      
      
      //// Bezier 6 Drawing
      let bezier6Path = UIBezierPath()
      bezier6Path.moveToPoint(CGPointMake(55.45, 12.98))
      bezier6Path.addCurveToPoint(CGPointMake(71.08, 4.04), controlPoint1: CGPointMake(55.45, 12.98), controlPoint2: CGPointMake(64.88, 3.27))
      bezier6Path.addCurveToPoint(CGPointMake(72.99, 26.88), controlPoint1: CGPointMake(71.08, 4.04), controlPoint2: CGPointMake(77.28, 15.96))
      outerCheekColor.setFill()
      bezier6Path.fill()
      
      
      //// Bezier 7 Drawing
      let bezier7Path = UIBezierPath()
      bezier7Path.moveToPoint(CGPointMake(47.71, 9.67))
      bezier7Path.addCurveToPoint(CGPointMake(11.89, 40.66), controlPoint1: CGPointMake(47.71, 9.67), controlPoint2: CGPointMake(18.35, 8.29))
      bezier7Path.addCurveToPoint(CGPointMake(14.8, 45.02), controlPoint1: CGPointMake(11.47, 42.7), controlPoint2: CGPointMake(12.84, 44.69))
      bezier7Path.addCurveToPoint(CGPointMake(41.19, 64.32), controlPoint1: CGPointMake(20.63, 46.01), controlPoint2: CGPointMake(32.5, 49.87))
      bezier7Path.addCurveToPoint(CGPointMake(41.46, 64.71), controlPoint1: CGPointMake(41.3, 64.49), controlPoint2: CGPointMake(41.35, 64.6))
      bezier7Path.addCurveToPoint(CGPointMake(47.44, 68.79), controlPoint1: CGPointMake(42.2, 65.59), controlPoint2: CGPointMake(45.17, 69.07))
      bezier7Path.addCurveToPoint(CGPointMake(48.03, 68.79), controlPoint1: CGPointMake(47.66, 68.79), controlPoint2: CGPointMake(47.82, 68.79))
      bezier7Path.addCurveToPoint(CGPointMake(54.02, 64.71), controlPoint1: CGPointMake(50.31, 69.07), controlPoint2: CGPointMake(53.27, 65.59))
      bezier7Path.addCurveToPoint(CGPointMake(54.28, 64.32), controlPoint1: CGPointMake(54.12, 64.6), controlPoint2: CGPointMake(54.23, 64.43))
      bezier7Path.addCurveToPoint(CGPointMake(80.67, 45.02), controlPoint1: CGPointMake(62.92, 49.87), controlPoint2: CGPointMake(74.79, 46.01))
      bezier7Path.addCurveToPoint(CGPointMake(83.58, 40.66), controlPoint1: CGPointMake(82.63, 44.69), controlPoint2: CGPointMake(84.01, 42.7))
      bezier7Path.addCurveToPoint(CGPointMake(47.71, 9.67), controlPoint1: CGPointMake(77.07, 8.29), controlPoint2: CGPointMake(47.71, 9.67))
      bezier7Path.closePath()
      bodyColor.setFill()
      bezier7Path.fill()
      
      
      //// Bezier 8 Drawing
      let bezier8Path = UIBezierPath()
      bezier8Path.moveToPoint(CGPointMake(47.71, 9.67))
      bezier8Path.addCurveToPoint(CGPointMake(11.89, 40.66), controlPoint1: CGPointMake(47.71, 9.67), controlPoint2: CGPointMake(18.35, 8.29))
      bezier8Path.addCurveToPoint(CGPointMake(14.8, 45.02), controlPoint1: CGPointMake(11.47, 42.7), controlPoint2: CGPointMake(12.84, 44.69))
      bezier8Path.addCurveToPoint(CGPointMake(41.19, 64.32), controlPoint1: CGPointMake(20.63, 46.01), controlPoint2: CGPointMake(32.5, 49.87))
      bezier8Path.addCurveToPoint(CGPointMake(41.46, 64.71), controlPoint1: CGPointMake(41.3, 64.49), controlPoint2: CGPointMake(41.35, 64.6))
      bezier8Path.addCurveToPoint(CGPointMake(47.44, 68.79), controlPoint1: CGPointMake(42.2, 65.59), controlPoint2: CGPointMake(45.17, 69.07))
      bezier8Path.addCurveToPoint(CGPointMake(48.03, 68.79), controlPoint1: CGPointMake(47.66, 68.79), controlPoint2: CGPointMake(47.82, 68.79))
      bezier8Path.addCurveToPoint(CGPointMake(54.02, 64.71), controlPoint1: CGPointMake(50.31, 69.07), controlPoint2: CGPointMake(53.27, 65.59))
      bezier8Path.addCurveToPoint(CGPointMake(54.28, 64.32), controlPoint1: CGPointMake(54.12, 64.6), controlPoint2: CGPointMake(54.23, 64.43))
      bezier8Path.addCurveToPoint(CGPointMake(80.67, 45.02), controlPoint1: CGPointMake(62.92, 49.87), controlPoint2: CGPointMake(74.79, 46.01))
      bezier8Path.addCurveToPoint(CGPointMake(83.58, 40.66), controlPoint1: CGPointMake(82.63, 44.69), controlPoint2: CGPointMake(84.01, 42.7))
      bezier8Path.addCurveToPoint(CGPointMake(47.71, 9.67), controlPoint1: CGPointMake(77.07, 8.29), controlPoint2: CGPointMake(47.71, 9.67))
      bezier8Path.closePath()
      outerCheekColor.setFill()
      bezier8Path.fill()
      
      
      //// Left Outer Cheek Drawing
      let leftOuterCheekPath = UIBezierPath()
      leftOuterCheekPath.moveToPoint(CGPointMake(11.84, 40.66))
      leftOuterCheekPath.addCurveToPoint(CGPointMake(14.75, 45.02), controlPoint1: CGPointMake(11.41, 42.7), controlPoint2: CGPointMake(12.79, 44.69))
      leftOuterCheekPath.addCurveToPoint(CGPointMake(41.14, 64.32), controlPoint1: CGPointMake(20.58, 46.01), controlPoint2: CGPointMake(32.45, 49.87))
      leftOuterCheekPath.addCurveToPoint(CGPointMake(41.4, 64.71), controlPoint1: CGPointMake(41.25, 64.49), controlPoint2: CGPointMake(41.3, 64.6))
      leftOuterCheekPath.addCurveToPoint(CGPointMake(27.73, 15.4), controlPoint1: CGPointMake(41.4, 64.71), controlPoint2: CGPointMake(44.53, 29.3))
      leftOuterCheekPath.addCurveToPoint(CGPointMake(11.84, 40.66), controlPoint1: CGPointMake(21, 19.76), controlPoint2: CGPointMake(14.49, 27.37))
      leftOuterCheekPath.closePath()
      bodyColor.setFill()
      leftOuterCheekPath.fill()
      
      
      //// Right Outer Cheek Drawing
      let rightOuterCheekPath = UIBezierPath()
      rightOuterCheekPath.moveToPoint(CGPointMake(83.53, 40.66))
      rightOuterCheekPath.addCurveToPoint(CGPointMake(80.62, 45.02), controlPoint1: CGPointMake(83.95, 42.7), controlPoint2: CGPointMake(82.58, 44.69))
      rightOuterCheekPath.addCurveToPoint(CGPointMake(54.23, 64.32), controlPoint1: CGPointMake(74.79, 46.01), controlPoint2: CGPointMake(62.92, 49.87))
      rightOuterCheekPath.addCurveToPoint(CGPointMake(53.96, 64.71), controlPoint1: CGPointMake(54.12, 64.49), controlPoint2: CGPointMake(54.07, 64.6))
      rightOuterCheekPath.addCurveToPoint(CGPointMake(67.63, 15.4), controlPoint1: CGPointMake(53.96, 64.71), controlPoint2: CGPointMake(50.84, 29.3))
      rightOuterCheekPath.addCurveToPoint(CGPointMake(83.53, 40.66), controlPoint1: CGPointMake(74.36, 19.76), controlPoint2: CGPointMake(80.88, 27.37))
      rightOuterCheekPath.closePath()
      bodyColor.setFill()
      rightOuterCheekPath.fill()
      
      
      //// Left Cheek Drawing
      let leftCheekPath = UIBezierPath(ovalInRect: CGRectMake(17.71, 35.7, 6.1, 7.1))
      cheekColor.setFill()
      leftCheekPath.fill()
      
      
      //// Right Cheek Drawing
      let rightCheekPath = UIBezierPath(ovalInRect: CGRectMake(71.86, 35.7, 6.1, 7.1))
      cheekColor.setFill()
      rightCheekPath.fill()
      
      
      //// Nose Drawing
      let nosePath = UIBezierPath()
      nosePath.moveToPoint(CGPointMake(41.35, 64.6))
      nosePath.addCurveToPoint(CGPointMake(41.4, 64.71), controlPoint1: CGPointMake(41.35, 64.65), controlPoint2: CGPointMake(41.4, 64.65))
      nosePath.addCurveToPoint(CGPointMake(47.39, 68.79), controlPoint1: CGPointMake(42.15, 65.59), controlPoint2: CGPointMake(45.11, 69.07))
      nosePath.addCurveToPoint(CGPointMake(47.97, 68.79), controlPoint1: CGPointMake(47.6, 68.79), controlPoint2: CGPointMake(47.76, 68.79))
      nosePath.addCurveToPoint(CGPointMake(53.96, 64.71), controlPoint1: CGPointMake(50.25, 69.07), controlPoint2: CGPointMake(53.22, 65.59))
      nosePath.addCurveToPoint(CGPointMake(54.23, 64.32), controlPoint1: CGPointMake(54.07, 64.6), controlPoint2: CGPointMake(54.17, 64.43))
      nosePath.addCurveToPoint(CGPointMake(54.28, 64.27), controlPoint1: CGPointMake(54.23, 64.27), controlPoint2: CGPointMake(54.28, 64.27))
      nosePath.addCurveToPoint(CGPointMake(41.35, 64.6), controlPoint1: CGPointMake(48.08, 60.13), controlPoint2: CGPointMake(43.52, 62.72))
      nosePath.closePath()
      noseColor.setFill()
      nosePath.fill()

   }
}