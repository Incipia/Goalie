//
//  ChecklistorCharacterKit.swift
//  Goalie
//
//  Created by Gregory Klein on 3/25/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class ChecklistorCharacterKit
{
   class func drawAccessoriesForPriority(priority: TaskPriority)
   {
      _drawWeirdEyeThingWithPriority(priority)
      _drawMouthWithPriority(priority)
      switch priority
      {
      case .Unknown: _drawSleepingFace() // considered accessory for now
      default:
         break
      }
   }
   
   static func _drawWeirdEyeThingWithPriority(priority: TaskPriority)
   {
      UIColor(priority: priority, headComponent: .Cheek).setFill()
      let ovalPath = UIBezierPath(ovalInRect: CGRectMake(29.85, 20.07, 19.3, 19.3))
      ovalPath.fill()
   }
   
   private static func _drawMouthWithPriority(priority: TaskPriority)
   {
      switch priority {
      case .Unknown: return
      case .Ages: _drawAgesMouth()
      case .Later: _drawLaterMouth()
      case .Soon: _drawSoonMouth()
      case .ASAP: _drawASAPMouth()
      }
   }
   
   private static func _drawAgesMouth()
   {
      let toungeColor = UIColor(red: 0.987, green: 0.210, blue: 0.320, alpha: 1.000)
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(39.46, 46.03))
      bezier2Path.addCurveToPoint(CGPointMake(29.71, 44.51), controlPoint1: CGPointMake(35.92, 46.03), controlPoint2: CGPointMake(32.56, 45.48))
      bezier2Path.addCurveToPoint(CGPointMake(28.01, 46.03), controlPoint1: CGPointMake(28.7, 44.15), controlPoint2: CGPointMake(27.74, 45.07))
      bezier2Path.addCurveToPoint(CGPointMake(39.46, 54.54), controlPoint1: CGPointMake(29.35, 50.95), controlPoint2: CGPointMake(33.94, 54.54))
      bezier2Path.addCurveToPoint(CGPointMake(50.91, 46.03), controlPoint1: CGPointMake(44.98, 54.54), controlPoint2: CGPointMake(49.53, 50.9))
      bezier2Path.addCurveToPoint(CGPointMake(49.21, 44.51), controlPoint1: CGPointMake(51.19, 45.07), controlPoint2: CGPointMake(50.22, 44.15))
      bezier2Path.addCurveToPoint(CGPointMake(39.46, 46.03), controlPoint1: CGPointMake(46.31, 45.48), controlPoint2: CGPointMake(43, 46.03))
      bezier2Path.closePath()
      UIColor.eyeColorForPriority(.Ages).setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(41.9, 45.94))
      bezier3Path.addCurveToPoint(CGPointMake(39.46, 46.03), controlPoint1: CGPointMake(41.12, 45.98), controlPoint2: CGPointMake(40.29, 46.03))
      bezier3Path.addCurveToPoint(CGPointMake(34.86, 45.71), controlPoint1: CGPointMake(37.9, 46.03), controlPoint2: CGPointMake(36.33, 45.89))
      bezier3Path.addCurveToPoint(CGPointMake(34.95, 49.34), controlPoint1: CGPointMake(34.31, 46.81), controlPoint2: CGPointMake(34.31, 48.19))
      bezier3Path.addLineToPoint(CGPointMake(38.91, 56.19))
      bezier3Path.addCurveToPoint(CGPointMake(44.15, 57.62), controlPoint1: CGPointMake(39.97, 58.03), controlPoint2: CGPointMake(42.36, 58.67))
      bezier3Path.addCurveToPoint(CGPointMake(45.58, 52.38), controlPoint1: CGPointMake(45.99, 56.56), controlPoint2: CGPointMake(46.63, 54.17))
      bezier3Path.addLineToPoint(CGPointMake(41.9, 45.94))
      bezier3Path.closePath()
      toungeColor.setFill()
      bezier3Path.fill()
      
      
      //// Teeth Drawing
      let teethPath = UIBezierPath()
      teethPath.moveToPoint(CGPointMake(39.46, 46.03))
      teethPath.addCurveToPoint(CGPointMake(34.17, 45.62), controlPoint1: CGPointMake(37.62, 46.03), controlPoint2: CGPointMake(35.87, 45.89))
      teethPath.addLineToPoint(CGPointMake(34.17, 49.25))
      teethPath.addCurveToPoint(CGPointMake(35.83, 50.86), controlPoint1: CGPointMake(34.17, 50.12), controlPoint2: CGPointMake(34.91, 50.86))
      teethPath.addLineToPoint(CGPointMake(38.31, 50.86))
      teethPath.addCurveToPoint(CGPointMake(39.97, 49.25), controlPoint1: CGPointMake(39.23, 50.86), controlPoint2: CGPointMake(39.97, 50.12))
      teethPath.addCurveToPoint(CGPointMake(41.62, 50.86), controlPoint1: CGPointMake(39.97, 50.12), controlPoint2: CGPointMake(40.7, 50.86))
      teethPath.addLineToPoint(CGPointMake(44.1, 50.86))
      teethPath.addCurveToPoint(CGPointMake(45.76, 49.25), controlPoint1: CGPointMake(45.02, 50.86), controlPoint2: CGPointMake(45.76, 50.12))
      teethPath.addLineToPoint(CGPointMake(45.76, 45.43))
      teethPath.addCurveToPoint(CGPointMake(39.46, 46.03), controlPoint1: CGPointMake(43.78, 45.85), controlPoint2: CGPointMake(41.67, 46.03))
      teethPath.closePath()
      UIColor.whiteColor().setFill()
      teethPath.fill()
   }
   
   private static func _drawLaterMouth()
   {
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(39.46, 46.03))
      bezier2Path.addCurveToPoint(CGPointMake(29.71, 44.51), controlPoint1: CGPointMake(35.92, 46.03), controlPoint2: CGPointMake(32.56, 45.48))
      bezier2Path.addCurveToPoint(CGPointMake(28.01, 46.03), controlPoint1: CGPointMake(28.7, 44.15), controlPoint2: CGPointMake(27.74, 45.07))
      bezier2Path.addCurveToPoint(CGPointMake(39.46, 54.54), controlPoint1: CGPointMake(29.35, 50.95), controlPoint2: CGPointMake(33.94, 54.54))
      bezier2Path.addCurveToPoint(CGPointMake(50.91, 46.03), controlPoint1: CGPointMake(44.98, 54.54), controlPoint2: CGPointMake(49.53, 50.9))
      bezier2Path.addCurveToPoint(CGPointMake(49.21, 44.51), controlPoint1: CGPointMake(51.19, 45.07), controlPoint2: CGPointMake(50.22, 44.15))
      bezier2Path.addCurveToPoint(CGPointMake(39.46, 46.03), controlPoint1: CGPointMake(46.31, 45.48), controlPoint2: CGPointMake(43, 46.03))
      bezier2Path.closePath()
      UIColor.eyeColorForPriority(.Later).setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(39.46, 46.03))
      bezier3Path.addCurveToPoint(CGPointMake(34.17, 45.62), controlPoint1: CGPointMake(37.62, 46.03), controlPoint2: CGPointMake(35.87, 45.89))
      bezier3Path.addLineToPoint(CGPointMake(34.17, 49.25))
      bezier3Path.addCurveToPoint(CGPointMake(35.83, 50.86), controlPoint1: CGPointMake(34.17, 50.12), controlPoint2: CGPointMake(34.91, 50.86))
      bezier3Path.addLineToPoint(CGPointMake(38.31, 50.86))
      bezier3Path.addCurveToPoint(CGPointMake(39.97, 49.25), controlPoint1: CGPointMake(39.23, 50.86), controlPoint2: CGPointMake(39.97, 50.12))
      bezier3Path.addCurveToPoint(CGPointMake(41.62, 50.86), controlPoint1: CGPointMake(39.97, 50.12), controlPoint2: CGPointMake(40.7, 50.86))
      bezier3Path.addLineToPoint(CGPointMake(44.1, 50.86))
      bezier3Path.addCurveToPoint(CGPointMake(45.76, 49.25), controlPoint1: CGPointMake(45.02, 50.86), controlPoint2: CGPointMake(45.76, 50.12))
      bezier3Path.addLineToPoint(CGPointMake(45.76, 45.43))
      bezier3Path.addCurveToPoint(CGPointMake(39.46, 46.03), controlPoint1: CGPointMake(43.78, 45.85), controlPoint2: CGPointMake(41.67, 46.03))
      bezier3Path.closePath()
      UIColor.whiteColor().setFill()
      bezier3Path.fill()
   }
   
   private static func _drawSoonMouth()
   {
      //// /Users/gregoryklein/Desktop/checklistor-yellow.pdf Group
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(39.46, 52.93))
      bezier2Path.addCurveToPoint(CGPointMake(49.21, 54.44), controlPoint1: CGPointMake(43, 52.93), controlPoint2: CGPointMake(46.36, 53.48))
      bezier2Path.addCurveToPoint(CGPointMake(50.91, 52.93), controlPoint1: CGPointMake(50.22, 54.81), controlPoint2: CGPointMake(51.19, 53.89))
      bezier2Path.addCurveToPoint(CGPointMake(39.46, 44.42), controlPoint1: CGPointMake(49.58, 48.01), controlPoint2: CGPointMake(44.98, 44.42))
      bezier2Path.addCurveToPoint(CGPointMake(28.01, 52.93), controlPoint1: CGPointMake(33.94, 44.42), controlPoint2: CGPointMake(29.39, 48.05))
      bezier2Path.addCurveToPoint(CGPointMake(29.71, 54.44), controlPoint1: CGPointMake(27.74, 53.89), controlPoint2: CGPointMake(28.7, 54.81))
      bezier2Path.addCurveToPoint(CGPointMake(39.46, 52.93), controlPoint1: CGPointMake(32.61, 53.48), controlPoint2: CGPointMake(35.92, 52.93))
      bezier2Path.closePath()
      UIColor.eyeColorForPriority(.Soon).setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(44.75, 45.62))
      bezier3Path.addCurveToPoint(CGPointMake(39.46, 44.42), controlPoint1: CGPointMake(43.14, 44.84), controlPoint2: CGPointMake(41.35, 44.42))
      bezier3Path.addCurveToPoint(CGPointMake(38.95, 44.42), controlPoint1: CGPointMake(39.28, 44.42), controlPoint2: CGPointMake(39.09, 44.42))
      bezier3Path.addCurveToPoint(CGPointMake(33.16, 46.17), controlPoint1: CGPointMake(36.84, 44.51), controlPoint2: CGPointMake(34.86, 45.16))
      bezier3Path.addLineToPoint(CGPointMake(33.16, 48.88))
      bezier3Path.addCurveToPoint(CGPointMake(34.82, 50.49), controlPoint1: CGPointMake(33.16, 49.76), controlPoint2: CGPointMake(33.9, 50.49))
      bezier3Path.addLineToPoint(CGPointMake(37.3, 50.49))
      bezier3Path.addCurveToPoint(CGPointMake(38.95, 48.88), controlPoint1: CGPointMake(38.22, 50.49), controlPoint2: CGPointMake(38.95, 49.76))
      bezier3Path.addCurveToPoint(CGPointMake(40.61, 50.49), controlPoint1: CGPointMake(38.95, 49.76), controlPoint2: CGPointMake(39.69, 50.49))
      bezier3Path.addLineToPoint(CGPointMake(43.09, 50.49))
      bezier3Path.addCurveToPoint(CGPointMake(44.75, 48.88), controlPoint1: CGPointMake(44.01, 50.49), controlPoint2: CGPointMake(44.75, 49.76))
      bezier3Path.addLineToPoint(CGPointMake(44.75, 45.62))
      bezier3Path.closePath()
      UIColor.whiteColor().setFill()
      bezier3Path.fill()
   }
   
   private static func _drawASAPMouth()
   {
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(45.21, 60.51))
      bezier2Path.addLineToPoint(CGPointMake(33.12, 60.51))
      bezier2Path.addCurveToPoint(CGPointMake(27.51, 55.73), controlPoint1: CGPointMake(30.31, 60.51), controlPoint2: CGPointMake(27.97, 58.49))
      bezier2Path.addLineToPoint(CGPointMake(26.82, 51.41))
      bezier2Path.addCurveToPoint(CGPointMake(32.43, 44.84), controlPoint1: CGPointMake(26.27, 47.96), controlPoint2: CGPointMake(28.93, 44.84))
      bezier2Path.addLineToPoint(CGPointMake(45.9, 44.84))
      bezier2Path.addCurveToPoint(CGPointMake(51.51, 51.41), controlPoint1: CGPointMake(49.39, 44.84), controlPoint2: CGPointMake(52.06, 47.96))
      bezier2Path.addLineToPoint(CGPointMake(50.82, 55.73))
      bezier2Path.addCurveToPoint(CGPointMake(45.21, 60.51), controlPoint1: CGPointMake(50.36, 58.49), controlPoint2: CGPointMake(47.97, 60.51))
      bezier2Path.closePath()
      UIColor.eyeColorForPriority(.ASAP).setFill()
      bezier2Path.fill()
      
      
      //// Teeth Drawing
      let teethPath = UIBezierPath()
      teethPath.moveToPoint(CGPointMake(33.16, 48.88))
      teethPath.addCurveToPoint(CGPointMake(34.82, 50.49), controlPoint1: CGPointMake(33.16, 49.76), controlPoint2: CGPointMake(33.9, 50.49))
      teethPath.addLineToPoint(CGPointMake(37.3, 50.49))
      teethPath.addCurveToPoint(CGPointMake(38.95, 48.88), controlPoint1: CGPointMake(38.22, 50.49), controlPoint2: CGPointMake(38.95, 49.76))
      teethPath.addCurveToPoint(CGPointMake(40.61, 50.49), controlPoint1: CGPointMake(38.95, 49.76), controlPoint2: CGPointMake(39.69, 50.49))
      teethPath.addLineToPoint(CGPointMake(43.09, 50.49))
      teethPath.addCurveToPoint(CGPointMake(44.75, 48.88), controlPoint1: CGPointMake(44.01, 50.49), controlPoint2: CGPointMake(44.75, 49.76))
      teethPath.addLineToPoint(CGPointMake(44.75, 44.88))
      teethPath.addLineToPoint(CGPointMake(33.16, 44.88))
      teethPath.addLineToPoint(CGPointMake(33.16, 48.88))
      teethPath.closePath()
      UIColor.whiteColor().setFill()
      teethPath.fill()
   }
   
   static func _drawSleepingFace()
   {
      UIColor.eyeColorForPriority(.Unknown).setFill()
      
      //// Eye Drawing
      let eyePath = UIBezierPath()
      eyePath.moveToPoint(CGPointMake(39.49, 35.67))
      eyePath.addCurveToPoint(CGPointMake(48.96, 27.86), controlPoint1: CGPointMake(44.18, 35.67), controlPoint2: CGPointMake(48.08, 32.31))
      eyePath.addCurveToPoint(CGPointMake(48.63, 26.71), controlPoint1: CGPointMake(48.86, 27.44), controlPoint2: CGPointMake(48.77, 27.08))
      eyePath.addCurveToPoint(CGPointMake(39.44, 33.37), controlPoint1: CGPointMake(47.39, 30.57), controlPoint2: CGPointMake(43.76, 33.37))
      eyePath.addCurveToPoint(CGPointMake(30.25, 26.71), controlPoint1: CGPointMake(35.12, 33.37), controlPoint2: CGPointMake(31.54, 30.57))
      eyePath.addCurveToPoint(CGPointMake(29.93, 27.86), controlPoint1: CGPointMake(30.12, 27.08), controlPoint2: CGPointMake(30.02, 27.49))
      eyePath.addCurveToPoint(CGPointMake(39.49, 35.67), controlPoint1: CGPointMake(30.9, 32.31), controlPoint2: CGPointMake(34.8, 35.67))
      eyePath.closePath()
      eyePath.fill()
      
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(39.49, 52.9))
      bezier2Path.addCurveToPoint(CGPointMake(49.23, 54.42), controlPoint1: CGPointMake(43.03, 52.9), controlPoint2: CGPointMake(46.38, 53.45))
      bezier2Path.addCurveToPoint(CGPointMake(50.93, 52.9), controlPoint1: CGPointMake(50.24, 54.78), controlPoint2: CGPointMake(51.21, 53.87))
      bezier2Path.addCurveToPoint(CGPointMake(39.49, 44.4), controlPoint1: CGPointMake(49.6, 47.98), controlPoint2: CGPointMake(45, 44.4))
      bezier2Path.addCurveToPoint(CGPointMake(28.05, 52.9), controlPoint1: CGPointMake(33.98, 44.4), controlPoint2: CGPointMake(29.43, 48.03))
      bezier2Path.addCurveToPoint(CGPointMake(29.75, 54.42), controlPoint1: CGPointMake(27.77, 53.87), controlPoint2: CGPointMake(28.74, 54.78))
      bezier2Path.addCurveToPoint(CGPointMake(39.49, 52.9), controlPoint1: CGPointMake(32.64, 53.45), controlPoint2: CGPointMake(35.95, 52.9))
      bezier2Path.closePath()
      bezier2Path.fill()
   }
   
   static func drawBody(bodyColor: UIColor, cheekColor: UIColor)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Shadow Declarations
      let shadow = NSShadow()
      shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.15)
      shadow.shadowOffset = CGSizeMake(0, 6)
      shadow.shadowBlurRadius = 10
      
      //// /Users/gregoryklein/Desktop/checklistor-purple.pdf Group
      //// Body Drawing
      let bodyPath = UIBezierPath()
      bodyPath.moveToPoint(CGPointMake(21.34, 60.12))
      bodyPath.addCurveToPoint(CGPointMake(39.72, 66.92), controlPoint1: CGPointMake(26.35, 64.34), controlPoint2: CGPointMake(32.78, 66.92))
      bodyPath.addCurveToPoint(CGPointMake(39.95, 66.92), controlPoint1: CGPointMake(39.81, 66.92), controlPoint2: CGPointMake(39.86, 66.92))
      bodyPath.addCurveToPoint(CGPointMake(49.83, 65.17), controlPoint1: CGPointMake(43.3, 66.92), controlPoint2: CGPointMake(46.61, 66.36))
      bodyPath.addCurveToPoint(CGPointMake(88.8, 47.52), controlPoint1: CGPointMake(63.25, 60.21), controlPoint2: CGPointMake(73.68, 47.85))
      bodyPath.addCurveToPoint(CGPointMake(90.68, 44.08), controlPoint1: CGPointMake(90.54, 47.48), controlPoint2: CGPointMake(91.55, 45.59))
      bodyPath.addCurveToPoint(CGPointMake(49.32, 9.61), controlPoint1: CGPointMake(81.67, 29.1), controlPoint2: CGPointMake(67.52, 13.06))
      bodyPath.addCurveToPoint(CGPointMake(11, 38.2), controlPoint1: CGPointMake(30.71, 6.08), controlPoint2: CGPointMake(11, 18.12))
      bodyPath.addCurveToPoint(CGPointMake(21.34, 60.12), controlPoint1: CGPointMake(11, 46.88), controlPoint2: CGPointMake(15.04, 54.78))
      bodyPath.closePath()
      CGContextSaveGState(context!)
      CGContextSetShadowWithColor(context!, shadow.shadowOffset, shadow.shadowBlurRadius, (shadow.shadowColor as! UIColor).CGColor)
      bodyColor.setFill()
      bodyPath.fill()
      CGContextRestoreGState(context!)
      
      //// Right Cheek Drawing
      let rightCheekPath = UIBezierPath(ovalInRect: CGRectMake(55.1, 37.52, 5.5, 5.5))
      cheekColor.setFill()
      rightCheekPath.fill()
      
      
      //// Left Cheek Drawing
      let leftCheekPath = UIBezierPath(ovalInRect: CGRectMake(18.35, 37.52, 5.5, 5.5))
      cheekColor.setFill()
      leftCheekPath.fill()
   }
}
