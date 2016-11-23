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
   class func drawAccessoriesForPriority(_ priority: TaskPriority)
   {
      _drawWeirdEyeThingWithPriority(priority)
      _drawMouthWithPriority(priority)
      switch priority
      {
      case .unknown: _drawSleepingFace() // considered accessory for now
      default:
         break
      }
   }
   
   static func _drawWeirdEyeThingWithPriority(_ priority: TaskPriority)
   {
      UIColor(priority: priority, headComponent: .cheek).setFill()
      let ovalPath = UIBezierPath(ovalIn: CGRect(x: 29.85, y: 20.07, width: 19.3, height: 19.3))
      ovalPath.fill()
   }
   
   fileprivate static func _drawMouthWithPriority(_ priority: TaskPriority)
   {
      switch priority {
      case .unknown: return
      case .ages: _drawAgesMouth()
      case .later: _drawLaterMouth()
      case .soon: _drawSoonMouth()
      case .asap: _drawASAPMouth()
      }
   }
   
   fileprivate static func _drawAgesMouth()
   {
      let toungeColor = UIColor(red: 0.987, green: 0.210, blue: 0.320, alpha: 1.000)
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.move(to: CGPoint(x: 39.46, y: 46.03))
      bezier2Path.addCurve(to: CGPoint(x: 29.71, y: 44.51), controlPoint1: CGPoint(x: 35.92, y: 46.03), controlPoint2: CGPoint(x: 32.56, y: 45.48))
      bezier2Path.addCurve(to: CGPoint(x: 28.01, y: 46.03), controlPoint1: CGPoint(x: 28.7, y: 44.15), controlPoint2: CGPoint(x: 27.74, y: 45.07))
      bezier2Path.addCurve(to: CGPoint(x: 39.46, y: 54.54), controlPoint1: CGPoint(x: 29.35, y: 50.95), controlPoint2: CGPoint(x: 33.94, y: 54.54))
      bezier2Path.addCurve(to: CGPoint(x: 50.91, y: 46.03), controlPoint1: CGPoint(x: 44.98, y: 54.54), controlPoint2: CGPoint(x: 49.53, y: 50.9))
      bezier2Path.addCurve(to: CGPoint(x: 49.21, y: 44.51), controlPoint1: CGPoint(x: 51.19, y: 45.07), controlPoint2: CGPoint(x: 50.22, y: 44.15))
      bezier2Path.addCurve(to: CGPoint(x: 39.46, y: 46.03), controlPoint1: CGPoint(x: 46.31, y: 45.48), controlPoint2: CGPoint(x: 43, y: 46.03))
      bezier2Path.close()
      UIColor.eyeColorForPriority(.ages).setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.move(to: CGPoint(x: 41.9, y: 45.94))
      bezier3Path.addCurve(to: CGPoint(x: 39.46, y: 46.03), controlPoint1: CGPoint(x: 41.12, y: 45.98), controlPoint2: CGPoint(x: 40.29, y: 46.03))
      bezier3Path.addCurve(to: CGPoint(x: 34.86, y: 45.71), controlPoint1: CGPoint(x: 37.9, y: 46.03), controlPoint2: CGPoint(x: 36.33, y: 45.89))
      bezier3Path.addCurve(to: CGPoint(x: 34.95, y: 49.34), controlPoint1: CGPoint(x: 34.31, y: 46.81), controlPoint2: CGPoint(x: 34.31, y: 48.19))
      bezier3Path.addLine(to: CGPoint(x: 38.91, y: 56.19))
      bezier3Path.addCurve(to: CGPoint(x: 44.15, y: 57.62), controlPoint1: CGPoint(x: 39.97, y: 58.03), controlPoint2: CGPoint(x: 42.36, y: 58.67))
      bezier3Path.addCurve(to: CGPoint(x: 45.58, y: 52.38), controlPoint1: CGPoint(x: 45.99, y: 56.56), controlPoint2: CGPoint(x: 46.63, y: 54.17))
      bezier3Path.addLine(to: CGPoint(x: 41.9, y: 45.94))
      bezier3Path.close()
      toungeColor.setFill()
      bezier3Path.fill()
      
      
      //// Teeth Drawing
      let teethPath = UIBezierPath()
      teethPath.move(to: CGPoint(x: 39.46, y: 46.03))
      teethPath.addCurve(to: CGPoint(x: 34.17, y: 45.62), controlPoint1: CGPoint(x: 37.62, y: 46.03), controlPoint2: CGPoint(x: 35.87, y: 45.89))
      teethPath.addLine(to: CGPoint(x: 34.17, y: 49.25))
      teethPath.addCurve(to: CGPoint(x: 35.83, y: 50.86), controlPoint1: CGPoint(x: 34.17, y: 50.12), controlPoint2: CGPoint(x: 34.91, y: 50.86))
      teethPath.addLine(to: CGPoint(x: 38.31, y: 50.86))
      teethPath.addCurve(to: CGPoint(x: 39.97, y: 49.25), controlPoint1: CGPoint(x: 39.23, y: 50.86), controlPoint2: CGPoint(x: 39.97, y: 50.12))
      teethPath.addCurve(to: CGPoint(x: 41.62, y: 50.86), controlPoint1: CGPoint(x: 39.97, y: 50.12), controlPoint2: CGPoint(x: 40.7, y: 50.86))
      teethPath.addLine(to: CGPoint(x: 44.1, y: 50.86))
      teethPath.addCurve(to: CGPoint(x: 45.76, y: 49.25), controlPoint1: CGPoint(x: 45.02, y: 50.86), controlPoint2: CGPoint(x: 45.76, y: 50.12))
      teethPath.addLine(to: CGPoint(x: 45.76, y: 45.43))
      teethPath.addCurve(to: CGPoint(x: 39.46, y: 46.03), controlPoint1: CGPoint(x: 43.78, y: 45.85), controlPoint2: CGPoint(x: 41.67, y: 46.03))
      teethPath.close()
      UIColor.white.setFill()
      teethPath.fill()
   }
   
   fileprivate static func _drawLaterMouth()
   {
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.move(to: CGPoint(x: 39.46, y: 46.03))
      bezier2Path.addCurve(to: CGPoint(x: 29.71, y: 44.51), controlPoint1: CGPoint(x: 35.92, y: 46.03), controlPoint2: CGPoint(x: 32.56, y: 45.48))
      bezier2Path.addCurve(to: CGPoint(x: 28.01, y: 46.03), controlPoint1: CGPoint(x: 28.7, y: 44.15), controlPoint2: CGPoint(x: 27.74, y: 45.07))
      bezier2Path.addCurve(to: CGPoint(x: 39.46, y: 54.54), controlPoint1: CGPoint(x: 29.35, y: 50.95), controlPoint2: CGPoint(x: 33.94, y: 54.54))
      bezier2Path.addCurve(to: CGPoint(x: 50.91, y: 46.03), controlPoint1: CGPoint(x: 44.98, y: 54.54), controlPoint2: CGPoint(x: 49.53, y: 50.9))
      bezier2Path.addCurve(to: CGPoint(x: 49.21, y: 44.51), controlPoint1: CGPoint(x: 51.19, y: 45.07), controlPoint2: CGPoint(x: 50.22, y: 44.15))
      bezier2Path.addCurve(to: CGPoint(x: 39.46, y: 46.03), controlPoint1: CGPoint(x: 46.31, y: 45.48), controlPoint2: CGPoint(x: 43, y: 46.03))
      bezier2Path.close()
      UIColor.eyeColorForPriority(.later).setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.move(to: CGPoint(x: 39.46, y: 46.03))
      bezier3Path.addCurve(to: CGPoint(x: 34.17, y: 45.62), controlPoint1: CGPoint(x: 37.62, y: 46.03), controlPoint2: CGPoint(x: 35.87, y: 45.89))
      bezier3Path.addLine(to: CGPoint(x: 34.17, y: 49.25))
      bezier3Path.addCurve(to: CGPoint(x: 35.83, y: 50.86), controlPoint1: CGPoint(x: 34.17, y: 50.12), controlPoint2: CGPoint(x: 34.91, y: 50.86))
      bezier3Path.addLine(to: CGPoint(x: 38.31, y: 50.86))
      bezier3Path.addCurve(to: CGPoint(x: 39.97, y: 49.25), controlPoint1: CGPoint(x: 39.23, y: 50.86), controlPoint2: CGPoint(x: 39.97, y: 50.12))
      bezier3Path.addCurve(to: CGPoint(x: 41.62, y: 50.86), controlPoint1: CGPoint(x: 39.97, y: 50.12), controlPoint2: CGPoint(x: 40.7, y: 50.86))
      bezier3Path.addLine(to: CGPoint(x: 44.1, y: 50.86))
      bezier3Path.addCurve(to: CGPoint(x: 45.76, y: 49.25), controlPoint1: CGPoint(x: 45.02, y: 50.86), controlPoint2: CGPoint(x: 45.76, y: 50.12))
      bezier3Path.addLine(to: CGPoint(x: 45.76, y: 45.43))
      bezier3Path.addCurve(to: CGPoint(x: 39.46, y: 46.03), controlPoint1: CGPoint(x: 43.78, y: 45.85), controlPoint2: CGPoint(x: 41.67, y: 46.03))
      bezier3Path.close()
      UIColor.white.setFill()
      bezier3Path.fill()
   }
   
   fileprivate static func _drawSoonMouth()
   {
      //// /Users/gregoryklein/Desktop/checklistor-yellow.pdf Group
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.move(to: CGPoint(x: 39.46, y: 52.93))
      bezier2Path.addCurve(to: CGPoint(x: 49.21, y: 54.44), controlPoint1: CGPoint(x: 43, y: 52.93), controlPoint2: CGPoint(x: 46.36, y: 53.48))
      bezier2Path.addCurve(to: CGPoint(x: 50.91, y: 52.93), controlPoint1: CGPoint(x: 50.22, y: 54.81), controlPoint2: CGPoint(x: 51.19, y: 53.89))
      bezier2Path.addCurve(to: CGPoint(x: 39.46, y: 44.42), controlPoint1: CGPoint(x: 49.58, y: 48.01), controlPoint2: CGPoint(x: 44.98, y: 44.42))
      bezier2Path.addCurve(to: CGPoint(x: 28.01, y: 52.93), controlPoint1: CGPoint(x: 33.94, y: 44.42), controlPoint2: CGPoint(x: 29.39, y: 48.05))
      bezier2Path.addCurve(to: CGPoint(x: 29.71, y: 54.44), controlPoint1: CGPoint(x: 27.74, y: 53.89), controlPoint2: CGPoint(x: 28.7, y: 54.81))
      bezier2Path.addCurve(to: CGPoint(x: 39.46, y: 52.93), controlPoint1: CGPoint(x: 32.61, y: 53.48), controlPoint2: CGPoint(x: 35.92, y: 52.93))
      bezier2Path.close()
      UIColor.eyeColorForPriority(.soon).setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.move(to: CGPoint(x: 44.75, y: 45.62))
      bezier3Path.addCurve(to: CGPoint(x: 39.46, y: 44.42), controlPoint1: CGPoint(x: 43.14, y: 44.84), controlPoint2: CGPoint(x: 41.35, y: 44.42))
      bezier3Path.addCurve(to: CGPoint(x: 38.95, y: 44.42), controlPoint1: CGPoint(x: 39.28, y: 44.42), controlPoint2: CGPoint(x: 39.09, y: 44.42))
      bezier3Path.addCurve(to: CGPoint(x: 33.16, y: 46.17), controlPoint1: CGPoint(x: 36.84, y: 44.51), controlPoint2: CGPoint(x: 34.86, y: 45.16))
      bezier3Path.addLine(to: CGPoint(x: 33.16, y: 48.88))
      bezier3Path.addCurve(to: CGPoint(x: 34.82, y: 50.49), controlPoint1: CGPoint(x: 33.16, y: 49.76), controlPoint2: CGPoint(x: 33.9, y: 50.49))
      bezier3Path.addLine(to: CGPoint(x: 37.3, y: 50.49))
      bezier3Path.addCurve(to: CGPoint(x: 38.95, y: 48.88), controlPoint1: CGPoint(x: 38.22, y: 50.49), controlPoint2: CGPoint(x: 38.95, y: 49.76))
      bezier3Path.addCurve(to: CGPoint(x: 40.61, y: 50.49), controlPoint1: CGPoint(x: 38.95, y: 49.76), controlPoint2: CGPoint(x: 39.69, y: 50.49))
      bezier3Path.addLine(to: CGPoint(x: 43.09, y: 50.49))
      bezier3Path.addCurve(to: CGPoint(x: 44.75, y: 48.88), controlPoint1: CGPoint(x: 44.01, y: 50.49), controlPoint2: CGPoint(x: 44.75, y: 49.76))
      bezier3Path.addLine(to: CGPoint(x: 44.75, y: 45.62))
      bezier3Path.close()
      UIColor.white.setFill()
      bezier3Path.fill()
   }
   
   fileprivate static func _drawASAPMouth()
   {
      let bezier2Path = UIBezierPath()
      bezier2Path.move(to: CGPoint(x: 45.21, y: 60.51))
      bezier2Path.addLine(to: CGPoint(x: 33.12, y: 60.51))
      bezier2Path.addCurve(to: CGPoint(x: 27.51, y: 55.73), controlPoint1: CGPoint(x: 30.31, y: 60.51), controlPoint2: CGPoint(x: 27.97, y: 58.49))
      bezier2Path.addLine(to: CGPoint(x: 26.82, y: 51.41))
      bezier2Path.addCurve(to: CGPoint(x: 32.43, y: 44.84), controlPoint1: CGPoint(x: 26.27, y: 47.96), controlPoint2: CGPoint(x: 28.93, y: 44.84))
      bezier2Path.addLine(to: CGPoint(x: 45.9, y: 44.84))
      bezier2Path.addCurve(to: CGPoint(x: 51.51, y: 51.41), controlPoint1: CGPoint(x: 49.39, y: 44.84), controlPoint2: CGPoint(x: 52.06, y: 47.96))
      bezier2Path.addLine(to: CGPoint(x: 50.82, y: 55.73))
      bezier2Path.addCurve(to: CGPoint(x: 45.21, y: 60.51), controlPoint1: CGPoint(x: 50.36, y: 58.49), controlPoint2: CGPoint(x: 47.97, y: 60.51))
      bezier2Path.close()
      UIColor.eyeColorForPriority(.asap).setFill()
      bezier2Path.fill()
      
      
      //// Teeth Drawing
      let teethPath = UIBezierPath()
      teethPath.move(to: CGPoint(x: 33.16, y: 48.88))
      teethPath.addCurve(to: CGPoint(x: 34.82, y: 50.49), controlPoint1: CGPoint(x: 33.16, y: 49.76), controlPoint2: CGPoint(x: 33.9, y: 50.49))
      teethPath.addLine(to: CGPoint(x: 37.3, y: 50.49))
      teethPath.addCurve(to: CGPoint(x: 38.95, y: 48.88), controlPoint1: CGPoint(x: 38.22, y: 50.49), controlPoint2: CGPoint(x: 38.95, y: 49.76))
      teethPath.addCurve(to: CGPoint(x: 40.61, y: 50.49), controlPoint1: CGPoint(x: 38.95, y: 49.76), controlPoint2: CGPoint(x: 39.69, y: 50.49))
      teethPath.addLine(to: CGPoint(x: 43.09, y: 50.49))
      teethPath.addCurve(to: CGPoint(x: 44.75, y: 48.88), controlPoint1: CGPoint(x: 44.01, y: 50.49), controlPoint2: CGPoint(x: 44.75, y: 49.76))
      teethPath.addLine(to: CGPoint(x: 44.75, y: 44.88))
      teethPath.addLine(to: CGPoint(x: 33.16, y: 44.88))
      teethPath.addLine(to: CGPoint(x: 33.16, y: 48.88))
      teethPath.close()
      UIColor.white.setFill()
      teethPath.fill()
   }
   
   static func _drawSleepingFace()
   {
      UIColor.eyeColorForPriority(.unknown).setFill()
      
      //// Eye Drawing
      let eyePath = UIBezierPath()
      eyePath.move(to: CGPoint(x: 39.49, y: 35.67))
      eyePath.addCurve(to: CGPoint(x: 48.96, y: 27.86), controlPoint1: CGPoint(x: 44.18, y: 35.67), controlPoint2: CGPoint(x: 48.08, y: 32.31))
      eyePath.addCurve(to: CGPoint(x: 48.63, y: 26.71), controlPoint1: CGPoint(x: 48.86, y: 27.44), controlPoint2: CGPoint(x: 48.77, y: 27.08))
      eyePath.addCurve(to: CGPoint(x: 39.44, y: 33.37), controlPoint1: CGPoint(x: 47.39, y: 30.57), controlPoint2: CGPoint(x: 43.76, y: 33.37))
      eyePath.addCurve(to: CGPoint(x: 30.25, y: 26.71), controlPoint1: CGPoint(x: 35.12, y: 33.37), controlPoint2: CGPoint(x: 31.54, y: 30.57))
      eyePath.addCurve(to: CGPoint(x: 29.93, y: 27.86), controlPoint1: CGPoint(x: 30.12, y: 27.08), controlPoint2: CGPoint(x: 30.02, y: 27.49))
      eyePath.addCurve(to: CGPoint(x: 39.49, y: 35.67), controlPoint1: CGPoint(x: 30.9, y: 32.31), controlPoint2: CGPoint(x: 34.8, y: 35.67))
      eyePath.close()
      eyePath.fill()
      
      let bezier2Path = UIBezierPath()
      bezier2Path.move(to: CGPoint(x: 39.49, y: 52.9))
      bezier2Path.addCurve(to: CGPoint(x: 49.23, y: 54.42), controlPoint1: CGPoint(x: 43.03, y: 52.9), controlPoint2: CGPoint(x: 46.38, y: 53.45))
      bezier2Path.addCurve(to: CGPoint(x: 50.93, y: 52.9), controlPoint1: CGPoint(x: 50.24, y: 54.78), controlPoint2: CGPoint(x: 51.21, y: 53.87))
      bezier2Path.addCurve(to: CGPoint(x: 39.49, y: 44.4), controlPoint1: CGPoint(x: 49.6, y: 47.98), controlPoint2: CGPoint(x: 45, y: 44.4))
      bezier2Path.addCurve(to: CGPoint(x: 28.05, y: 52.9), controlPoint1: CGPoint(x: 33.98, y: 44.4), controlPoint2: CGPoint(x: 29.43, y: 48.03))
      bezier2Path.addCurve(to: CGPoint(x: 29.75, y: 54.42), controlPoint1: CGPoint(x: 27.77, y: 53.87), controlPoint2: CGPoint(x: 28.74, y: 54.78))
      bezier2Path.addCurve(to: CGPoint(x: 39.49, y: 52.9), controlPoint1: CGPoint(x: 32.64, y: 53.45), controlPoint2: CGPoint(x: 35.95, y: 52.9))
      bezier2Path.close()
      bezier2Path.fill()
   }
   
   static func drawBody(_ bodyColor: UIColor, cheekColor: UIColor)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Shadow Declarations
      let shadow = NSShadow()
      shadow.shadowColor = UIColor.black.withAlphaComponent(0.15)
      shadow.shadowOffset = CGSize(width: 0, height: 6)
      shadow.shadowBlurRadius = 10
      
      //// /Users/gregoryklein/Desktop/checklistor-purple.pdf Group
      //// Body Drawing
      let bodyPath = UIBezierPath()
      bodyPath.move(to: CGPoint(x: 21.34, y: 60.12))
      bodyPath.addCurve(to: CGPoint(x: 39.72, y: 66.92), controlPoint1: CGPoint(x: 26.35, y: 64.34), controlPoint2: CGPoint(x: 32.78, y: 66.92))
      bodyPath.addCurve(to: CGPoint(x: 39.95, y: 66.92), controlPoint1: CGPoint(x: 39.81, y: 66.92), controlPoint2: CGPoint(x: 39.86, y: 66.92))
      bodyPath.addCurve(to: CGPoint(x: 49.83, y: 65.17), controlPoint1: CGPoint(x: 43.3, y: 66.92), controlPoint2: CGPoint(x: 46.61, y: 66.36))
      bodyPath.addCurve(to: CGPoint(x: 88.8, y: 47.52), controlPoint1: CGPoint(x: 63.25, y: 60.21), controlPoint2: CGPoint(x: 73.68, y: 47.85))
      bodyPath.addCurve(to: CGPoint(x: 90.68, y: 44.08), controlPoint1: CGPoint(x: 90.54, y: 47.48), controlPoint2: CGPoint(x: 91.55, y: 45.59))
      bodyPath.addCurve(to: CGPoint(x: 49.32, y: 9.61), controlPoint1: CGPoint(x: 81.67, y: 29.1), controlPoint2: CGPoint(x: 67.52, y: 13.06))
      bodyPath.addCurve(to: CGPoint(x: 11, y: 38.2), controlPoint1: CGPoint(x: 30.71, y: 6.08), controlPoint2: CGPoint(x: 11, y: 18.12))
      bodyPath.addCurve(to: CGPoint(x: 21.34, y: 60.12), controlPoint1: CGPoint(x: 11, y: 46.88), controlPoint2: CGPoint(x: 15.04, y: 54.78))
      bodyPath.close()
      context!.saveGState()
      context!.setShadow(offset: shadow.shadowOffset, blur: shadow.shadowBlurRadius, color: (shadow.shadowColor as! UIColor).cgColor)
      bodyColor.setFill()
      bodyPath.fill()
      context!.restoreGState()
      
      //// Right Cheek Drawing
      let rightCheekPath = UIBezierPath(ovalIn: CGRect(x: 55.1, y: 37.52, width: 5.5, height: 5.5))
      cheekColor.setFill()
      rightCheekPath.fill()
      
      
      //// Left Cheek Drawing
      let leftCheekPath = UIBezierPath(ovalIn: CGRect(x: 18.35, y: 37.52, width: 5.5, height: 5.5))
      cheekColor.setFill()
      leftCheekPath.fill()
   }
}
