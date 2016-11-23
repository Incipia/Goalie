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
   class func drawAccessoriesForPriority(_ priority: TaskPriority)
   {
      switch priority
      {
      case .unknown: _drawSleepingEyes() // considered accessory for now
      case .ages: _drawSunglasses()
      default:
         break
      }
   }
   
   fileprivate static func _drawSunglasses()
   {
      //// Color Declarations
      let fillColor25 = UIColor(priority: .ages, headComponent: .stripe)
      
      //// Sunglasses
      //// Bezier 14 Drawing
      let bezier14Path = UIBezierPath()
      bezier14Path.move(to: CGPoint(x: 36.38, y: 36.2))
      bezier14Path.addLine(to: CGPoint(x: 31.92, y: 36.2))
      bezier14Path.addCurve(to: CGPoint(x: 28.01, y: 32.03), controlPoint1: CGPoint(x: 29.75, y: 36.2), controlPoint2: CGPoint(x: 28.01, y: 34.34))
      bezier14Path.addLine(to: CGPoint(x: 28.01, y: 26.44))
      bezier14Path.addCurve(to: CGPoint(x: 28.67, y: 25.73), controlPoint1: CGPoint(x: 28.01, y: 26.03), controlPoint2: CGPoint(x: 28.3, y: 25.73))
      bezier14Path.addLine(to: CGPoint(x: 36.38, y: 25.73))
      bezier14Path.addCurve(to: CGPoint(x: 40.29, y: 29.91), controlPoint1: CGPoint(x: 38.55, y: 25.73), controlPoint2: CGPoint(x: 40.29, y: 27.6))
      bezier14Path.addLine(to: CGPoint(x: 40.29, y: 32.03))
      bezier14Path.addCurve(to: CGPoint(x: 36.38, y: 36.2), controlPoint1: CGPoint(x: 40.29, y: 34.29), controlPoint2: CGPoint(x: 38.55, y: 36.2))
      bezier14Path.close()
      fillColor25.setFill()
      bezier14Path.fill()
      
      
      //// Bezier 15 Drawing
      let bezier15Path = UIBezierPath()
      bezier15Path.move(to: CGPoint(x: 60.13, y: 36.2))
      bezier15Path.addLine(to: CGPoint(x: 64.6, y: 36.2))
      bezier15Path.addCurve(to: CGPoint(x: 68.5, y: 32.03), controlPoint1: CGPoint(x: 66.76, y: 36.2), controlPoint2: CGPoint(x: 68.5, y: 34.34))
      bezier15Path.addLine(to: CGPoint(x: 68.5, y: 26.44))
      bezier15Path.addCurve(to: CGPoint(x: 67.84, y: 25.73), controlPoint1: CGPoint(x: 68.5, y: 26.03), controlPoint2: CGPoint(x: 68.22, y: 25.73))
      bezier15Path.addLine(to: CGPoint(x: 60.13, y: 25.73))
      bezier15Path.addCurve(to: CGPoint(x: 56.23, y: 29.91), controlPoint1: CGPoint(x: 57.97, y: 25.73), controlPoint2: CGPoint(x: 56.23, y: 27.6))
      bezier15Path.addLine(to: CGPoint(x: 56.23, y: 32.03))
      bezier15Path.addCurve(to: CGPoint(x: 60.13, y: 36.2), controlPoint1: CGPoint(x: 56.23, y: 34.29), controlPoint2: CGPoint(x: 57.97, y: 36.2))
      bezier15Path.close()
      fillColor25.setFill()
      bezier15Path.fill()
      
      
      //// Rectangle Drawing
      let rectanglePath = UIBezierPath(rect: CGRect(x: 35.48, y: 25.75, width: 25.75, height: 2.1))
      fillColor25.setFill()
      rectanglePath.fill()
      
      
      //// Rectangle 2 Drawing
      let rectangle2Path = UIBezierPath(rect: CGRect(x: 35.48, y: 29.1, width: 25.75, height: 2.1))
      fillColor25.setFill()
      rectangle2Path.fill()
   }
   
   fileprivate static func _drawSleepingEyes()
   {
      let eyeColor = UIColor.eyeColorForPriority(.unknown)
      
      let fillColor21 = eyeColor
      
      //// Bezier 12 Drawing
      let bezier12Path = UIBezierPath()
      bezier12Path.move(to: CGPoint(x: 66.97, y: 29.46))
      bezier12Path.addLine(to: CGPoint(x: 61.92, y: 29.46))
      bezier12Path.addCurve(to: CGPoint(x: 60.83, y: 30.05), controlPoint1: CGPoint(x: 61.44, y: 29.46), controlPoint2: CGPoint(x: 61.07, y: 29.71))
      bezier12Path.addCurve(to: CGPoint(x: 60.59, y: 31.28), controlPoint1: CGPoint(x: 60.59, y: 30.39), controlPoint2: CGPoint(x: 60.5, y: 30.83))
      bezier12Path.addCurve(to: CGPoint(x: 64.42, y: 34.22), controlPoint1: CGPoint(x: 61.11, y: 33.04), controlPoint2: CGPoint(x: 62.67, y: 34.22))
      bezier12Path.addCurve(to: CGPoint(x: 68.24, y: 31.28), controlPoint1: CGPoint(x: 66.17, y: 34.22), controlPoint2: CGPoint(x: 67.72, y: 32.99))
      bezier12Path.addCurve(to: CGPoint(x: 68.01, y: 30.05), controlPoint1: CGPoint(x: 68.34, y: 30.83), controlPoint2: CGPoint(x: 68.29, y: 30.44))
      bezier12Path.addCurve(to: CGPoint(x: 66.97, y: 29.46), controlPoint1: CGPoint(x: 67.82, y: 29.71), controlPoint2: CGPoint(x: 67.44, y: 29.46))
      bezier12Path.close()
      fillColor21.setFill()
      bezier12Path.fill()
      
      
      //// Bezier 13 Drawing
      let bezier13Path = UIBezierPath()
      bezier13Path.move(to: CGPoint(x: 35.94, y: 30.05))
      bezier13Path.addCurve(to: CGPoint(x: 34.86, y: 29.46), controlPoint1: CGPoint(x: 35.66, y: 29.71), controlPoint2: CGPoint(x: 35.24, y: 29.46))
      bezier13Path.addLine(to: CGPoint(x: 29.85, y: 29.46))
      bezier13Path.addCurve(to: CGPoint(x: 28.77, y: 30.05), controlPoint1: CGPoint(x: 29.38, y: 29.46), controlPoint2: CGPoint(x: 29, y: 29.71))
      bezier13Path.addCurve(to: CGPoint(x: 28.53, y: 31.28), controlPoint1: CGPoint(x: 28.53, y: 30.39), controlPoint2: CGPoint(x: 28.44, y: 30.83))
      bezier13Path.addCurve(to: CGPoint(x: 32.36, y: 34.22), controlPoint1: CGPoint(x: 29.05, y: 33.04), controlPoint2: CGPoint(x: 30.61, y: 34.22))
      bezier13Path.addCurve(to: CGPoint(x: 36.18, y: 31.28), controlPoint1: CGPoint(x: 34.15, y: 34.22), controlPoint2: CGPoint(x: 35.66, y: 32.99))
      bezier13Path.addCurve(to: CGPoint(x: 35.94, y: 30.05), controlPoint1: CGPoint(x: 36.23, y: 30.83), controlPoint2: CGPoint(x: 36.18, y: 30.39))
      bezier13Path.close()
      fillColor21.setFill()
      bezier13Path.fill()
   }
   
   static func drawBody(_ bodyColor: UIColor, cheekColor: UIColor, outerCheekColor: UIColor, noseColor: UIColor)
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
      shadow.shadowColor = UIColor.black.withAlphaComponent(0.2)
      shadow.shadowOffset = CGSize(width: -1.3, height: 6.1)
      shadow.shadowBlurRadius = 8
      
      //// Group
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.move(to: CGPoint(x: 47.09, y: 26.57))
      bezierPath.addCurve(to: CGPoint(x: 35, y: 38.58), controlPoint1: CGPoint(x: 41.99, y: 28.92), controlPoint2: CGPoint(x: 37.6, y: 33.04))
      bezierPath.addCurve(to: CGPoint(x: 34.91, y: 38.78), controlPoint1: CGPoint(x: 34.95, y: 38.63), controlPoint2: CGPoint(x: 34.95, y: 38.68))
      bezierPath.addCurve(to: CGPoint(x: 32.54, y: 47.31), controlPoint1: CGPoint(x: 33.68, y: 41.42), controlPoint2: CGPoint(x: 32.83, y: 44.32))
      bezierPath.addCurve(to: CGPoint(x: 31.51, y: 85.15), controlPoint1: CGPoint(x: 31.36, y: 59.91), controlPoint2: CGPoint(x: 36.89, y: 72.99))
      bezierPath.addCurve(to: CGPoint(x: 33.44, y: 88), controlPoint1: CGPoint(x: 30.89, y: 86.52), controlPoint2: CGPoint(x: 31.98, y: 88.09))
      bezierPath.addCurve(to: CGPoint(x: 78.49, y: 62.85), controlPoint1: CGPoint(x: 50.3, y: 86.43), controlPoint2: CGPoint(x: 70.79, y: 80.05))
      bezierPath.addCurve(to: CGPoint(x: 67.72, y: 26.91), controlPoint1: CGPoint(x: 84.39, y: 49.66), controlPoint2: CGPoint(x: 80.85, y: 33.58))
      bezierPath.addCurve(to: CGPoint(x: 47.09, y: 26.57), controlPoint1: CGPoint(x: 61.07, y: 23.48), controlPoint2: CGPoint(x: 53.51, y: 23.63))
      bezierPath.close()
      fillColor18.setFill()
      bezierPath.fill()
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.move(to: CGPoint(x: 47.09, y: 26.57))
      bezier2Path.addCurve(to: CGPoint(x: 35, y: 38.58), controlPoint1: CGPoint(x: 41.99, y: 28.92), controlPoint2: CGPoint(x: 37.6, y: 33.04))
      bezier2Path.addCurve(to: CGPoint(x: 34.91, y: 38.78), controlPoint1: CGPoint(x: 34.95, y: 38.63), controlPoint2: CGPoint(x: 34.95, y: 38.68))
      bezier2Path.addCurve(to: CGPoint(x: 32.54, y: 47.31), controlPoint1: CGPoint(x: 33.68, y: 41.42), controlPoint2: CGPoint(x: 32.83, y: 44.32))
      bezier2Path.addCurve(to: CGPoint(x: 31.51, y: 85.15), controlPoint1: CGPoint(x: 31.36, y: 59.91), controlPoint2: CGPoint(x: 36.89, y: 72.99))
      bezier2Path.addCurve(to: CGPoint(x: 33.44, y: 88), controlPoint1: CGPoint(x: 30.89, y: 86.52), controlPoint2: CGPoint(x: 31.98, y: 88.09))
      bezier2Path.addCurve(to: CGPoint(x: 78.49, y: 62.85), controlPoint1: CGPoint(x: 50.3, y: 86.43), controlPoint2: CGPoint(x: 70.79, y: 80.05))
      bezier2Path.addCurve(to: CGPoint(x: 67.72, y: 26.91), controlPoint1: CGPoint(x: 84.39, y: 49.66), controlPoint2: CGPoint(x: 80.85, y: 33.58))
      bezier2Path.addCurve(to: CGPoint(x: 47.09, y: 26.57), controlPoint1: CGPoint(x: 61.07, y: 23.48), controlPoint2: CGPoint(x: 53.51, y: 23.63))
      bezier2Path.close()
      context!.saveGState()
      context!.setShadow(offset: shadow.shadowOffset, blur: shadow.shadowBlurRadius, color: (shadow.shadowColor as! UIColor).cgColor)
      fillColor19.setFill()
      bezier2Path.fill()
      context!.restoreGState()
      
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.move(to: CGPoint(x: 40.86, y: 15.98))
      bezier3Path.addCurve(to: CGPoint(x: 26.93, y: 8.04), controlPoint1: CGPoint(x: 40.86, y: 15.98), controlPoint2: CGPoint(x: 32.45, y: 7.35))
      bezier3Path.addCurve(to: CGPoint(x: 25.23, y: 28.33), controlPoint1: CGPoint(x: 26.93, y: 8.04), controlPoint2: CGPoint(x: 21.4, y: 18.63))
      fillColor18.setFill()
      bezier3Path.fill()
      
      
      //// Bezier 4 Drawing
      let bezier4Path = UIBezierPath()
      bezier4Path.move(to: CGPoint(x: 54.69, y: 15.98))
      bezier4Path.addCurve(to: CGPoint(x: 68.62, y: 8.04), controlPoint1: CGPoint(x: 54.69, y: 15.98), controlPoint2: CGPoint(x: 63.1, y: 7.35))
      bezier4Path.addCurve(to: CGPoint(x: 70.32, y: 28.33), controlPoint1: CGPoint(x: 68.62, y: 8.04), controlPoint2: CGPoint(x: 74.15, y: 18.63))
      fillColor18.setFill()
      bezier4Path.fill()
      
      
      //// Bezier 5 Drawing
      let bezier5Path = UIBezierPath()
      bezier5Path.move(to: CGPoint(x: 40.86, y: 15.98))
      bezier5Path.addCurve(to: CGPoint(x: 26.93, y: 8.04), controlPoint1: CGPoint(x: 40.86, y: 15.98), controlPoint2: CGPoint(x: 32.45, y: 7.35))
      bezier5Path.addCurve(to: CGPoint(x: 25.23, y: 28.33), controlPoint1: CGPoint(x: 26.93, y: 8.04), controlPoint2: CGPoint(x: 21.4, y: 18.63))
      fillColor19.setFill()
      bezier5Path.fill()
      
      
      //// Bezier 6 Drawing
      let bezier6Path = UIBezierPath()
      bezier6Path.move(to: CGPoint(x: 54.69, y: 15.98))
      bezier6Path.addCurve(to: CGPoint(x: 68.62, y: 8.04), controlPoint1: CGPoint(x: 54.69, y: 15.98), controlPoint2: CGPoint(x: 63.1, y: 7.35))
      bezier6Path.addCurve(to: CGPoint(x: 70.32, y: 28.33), controlPoint1: CGPoint(x: 68.62, y: 8.04), controlPoint2: CGPoint(x: 74.15, y: 18.63))
      fillColor19.setFill()
      bezier6Path.fill()
      
      
      //// Bezier 7 Drawing
      let bezier7Path = UIBezierPath()
      bezier7Path.move(to: CGPoint(x: 47.8, y: 13.04))
      bezier7Path.addCurve(to: CGPoint(x: 15.88, y: 40.59), controlPoint1: CGPoint(x: 47.8, y: 13.04), controlPoint2: CGPoint(x: 21.64, y: 11.81))
      bezier7Path.addCurve(to: CGPoint(x: 18.47, y: 44.46), controlPoint1: CGPoint(x: 15.5, y: 42.4), controlPoint2: CGPoint(x: 16.73, y: 44.17))
      bezier7Path.addCurve(to: CGPoint(x: 41.99, y: 61.62), controlPoint1: CGPoint(x: 23.67, y: 45.35), controlPoint2: CGPoint(x: 34.24, y: 48.78))
      bezier7Path.addCurve(to: CGPoint(x: 42.22, y: 61.96), controlPoint1: CGPoint(x: 42.08, y: 61.77), controlPoint2: CGPoint(x: 42.13, y: 61.87))
      bezier7Path.addCurve(to: CGPoint(x: 47.56, y: 65.59), controlPoint1: CGPoint(x: 42.89, y: 62.75), controlPoint2: CGPoint(x: 45.53, y: 65.84))
      bezier7Path.addCurve(to: CGPoint(x: 48.08, y: 65.59), controlPoint1: CGPoint(x: 47.75, y: 65.59), controlPoint2: CGPoint(x: 47.89, y: 65.59))
      bezier7Path.addCurve(to: CGPoint(x: 53.42, y: 61.96), controlPoint1: CGPoint(x: 50.11, y: 65.84), controlPoint2: CGPoint(x: 52.75, y: 62.75))
      bezier7Path.addCurve(to: CGPoint(x: 53.65, y: 61.62), controlPoint1: CGPoint(x: 53.51, y: 61.87), controlPoint2: CGPoint(x: 53.6, y: 61.72))
      bezier7Path.addCurve(to: CGPoint(x: 77.17, y: 44.46), controlPoint1: CGPoint(x: 61.35, y: 48.78), controlPoint2: CGPoint(x: 71.93, y: 45.35))
      bezier7Path.addCurve(to: CGPoint(x: 79.76, y: 40.59), controlPoint1: CGPoint(x: 78.91, y: 44.17), controlPoint2: CGPoint(x: 80.14, y: 42.4))
      bezier7Path.addCurve(to: CGPoint(x: 47.8, y: 13.04), controlPoint1: CGPoint(x: 73.96, y: 11.81), controlPoint2: CGPoint(x: 47.8, y: 13.04))
      bezier7Path.close()
      fillColor18.setFill()
      bezier7Path.fill()
      
      
      //// Bezier 8 Drawing
      let bezier8Path = UIBezierPath()
      bezier8Path.move(to: CGPoint(x: 47.8, y: 13.04))
      bezier8Path.addCurve(to: CGPoint(x: 15.88, y: 40.59), controlPoint1: CGPoint(x: 47.8, y: 13.04), controlPoint2: CGPoint(x: 21.64, y: 11.81))
      bezier8Path.addCurve(to: CGPoint(x: 18.47, y: 44.46), controlPoint1: CGPoint(x: 15.5, y: 42.4), controlPoint2: CGPoint(x: 16.73, y: 44.17))
      bezier8Path.addCurve(to: CGPoint(x: 41.99, y: 61.62), controlPoint1: CGPoint(x: 23.67, y: 45.35), controlPoint2: CGPoint(x: 34.24, y: 48.78))
      bezier8Path.addCurve(to: CGPoint(x: 42.22, y: 61.96), controlPoint1: CGPoint(x: 42.08, y: 61.77), controlPoint2: CGPoint(x: 42.13, y: 61.87))
      bezier8Path.addCurve(to: CGPoint(x: 47.56, y: 65.59), controlPoint1: CGPoint(x: 42.89, y: 62.75), controlPoint2: CGPoint(x: 45.53, y: 65.84))
      bezier8Path.addCurve(to: CGPoint(x: 48.08, y: 65.59), controlPoint1: CGPoint(x: 47.75, y: 65.59), controlPoint2: CGPoint(x: 47.89, y: 65.59))
      bezier8Path.addCurve(to: CGPoint(x: 53.42, y: 61.96), controlPoint1: CGPoint(x: 50.11, y: 65.84), controlPoint2: CGPoint(x: 52.75, y: 62.75))
      bezier8Path.addCurve(to: CGPoint(x: 53.65, y: 61.62), controlPoint1: CGPoint(x: 53.51, y: 61.87), controlPoint2: CGPoint(x: 53.6, y: 61.72))
      bezier8Path.addCurve(to: CGPoint(x: 77.17, y: 44.46), controlPoint1: CGPoint(x: 61.35, y: 48.78), controlPoint2: CGPoint(x: 71.93, y: 45.35))
      bezier8Path.addCurve(to: CGPoint(x: 79.76, y: 40.59), controlPoint1: CGPoint(x: 78.91, y: 44.17), controlPoint2: CGPoint(x: 80.14, y: 42.4))
      bezier8Path.addCurve(to: CGPoint(x: 47.8, y: 13.04), controlPoint1: CGPoint(x: 73.96, y: 11.81), controlPoint2: CGPoint(x: 47.8, y: 13.04))
      bezier8Path.close()
      fillColor19.setFill()
      bezier8Path.fill()
      
      
      //// Left Outer Cheek Drawing
      let leftOuterCheekPath = UIBezierPath()
      leftOuterCheekPath.move(to: CGPoint(x: 15.83, y: 40.59))
      leftOuterCheekPath.addCurve(to: CGPoint(x: 18.43, y: 44.46), controlPoint1: CGPoint(x: 15.45, y: 42.4), controlPoint2: CGPoint(x: 16.68, y: 44.17))
      leftOuterCheekPath.addCurve(to: CGPoint(x: 41.94, y: 61.62), controlPoint1: CGPoint(x: 23.62, y: 45.35), controlPoint2: CGPoint(x: 34.2, y: 48.78))
      leftOuterCheekPath.addCurve(to: CGPoint(x: 42.18, y: 61.96), controlPoint1: CGPoint(x: 42.04, y: 61.77), controlPoint2: CGPoint(x: 42.08, y: 61.87))
      leftOuterCheekPath.addCurve(to: CGPoint(x: 29.99, y: 18.14), controlPoint1: CGPoint(x: 42.18, y: 61.96), controlPoint2: CGPoint(x: 44.96, y: 30.49))
      leftOuterCheekPath.addCurve(to: CGPoint(x: 15.83, y: 40.59), controlPoint1: CGPoint(x: 24, y: 22.01), controlPoint2: CGPoint(x: 18.19, y: 28.78))
      leftOuterCheekPath.close()
      fillColor18.setFill()
      leftOuterCheekPath.fill()
      
      
      //// Right Outer Cheek Drawing
      let rightOuterCheekPath = UIBezierPath()
      rightOuterCheekPath.move(to: CGPoint(x: 79.72, y: 40.59))
      rightOuterCheekPath.addCurve(to: CGPoint(x: 77.12, y: 44.46), controlPoint1: CGPoint(x: 80.09, y: 42.4), controlPoint2: CGPoint(x: 78.87, y: 44.17))
      rightOuterCheekPath.addCurve(to: CGPoint(x: 53.6, y: 61.62), controlPoint1: CGPoint(x: 71.93, y: 45.35), controlPoint2: CGPoint(x: 61.35, y: 48.78))
      rightOuterCheekPath.addCurve(to: CGPoint(x: 53.37, y: 61.96), controlPoint1: CGPoint(x: 53.51, y: 61.77), controlPoint2: CGPoint(x: 53.46, y: 61.87))
      rightOuterCheekPath.addCurve(to: CGPoint(x: 65.55, y: 18.14), controlPoint1: CGPoint(x: 53.37, y: 61.96), controlPoint2: CGPoint(x: 50.58, y: 30.49))
      rightOuterCheekPath.addCurve(to: CGPoint(x: 79.72, y: 40.59), controlPoint1: CGPoint(x: 71.55, y: 22.01), controlPoint2: CGPoint(x: 77.36, y: 28.78))
      rightOuterCheekPath.close()
      fillColor18.setFill()
      rightOuterCheekPath.fill()
      
      
      //// Left Cheek Drawing
      let leftCheekPath = UIBezierPath(ovalIn: CGRect(x: 21.71, y: 35.7, width: 5.1, height: 7.1))
      fillColor20.setFill()
      leftCheekPath.fill()
      
      
      //// Right Cheek Drawing
      let rightCheekPath = UIBezierPath(ovalIn: CGRect(x: 68.86, y: 35.7, width: 6.1, height: 7.1))
      fillColor20.setFill()
      rightCheekPath.fill()
      
      
      //// Nose Drawing
      let nosePath = UIBezierPath()
      nosePath.move(to: CGPoint(x: 42.13, y: 61.87))
      nosePath.addCurve(to: CGPoint(x: 42.18, y: 61.96), controlPoint1: CGPoint(x: 42.13, y: 61.92), controlPoint2: CGPoint(x: 42.18, y: 61.92))
      nosePath.addCurve(to: CGPoint(x: 47.51, y: 65.59), controlPoint1: CGPoint(x: 42.84, y: 62.75), controlPoint2: CGPoint(x: 45.48, y: 65.84))
      nosePath.addCurve(to: CGPoint(x: 48.03, y: 65.59), controlPoint1: CGPoint(x: 47.7, y: 65.59), controlPoint2: CGPoint(x: 47.84, y: 65.59))
      nosePath.addCurve(to: CGPoint(x: 53.37, y: 61.96), controlPoint1: CGPoint(x: 50.06, y: 65.84), controlPoint2: CGPoint(x: 52.71, y: 62.75))
      nosePath.addCurve(to: CGPoint(x: 53.6, y: 61.62), controlPoint1: CGPoint(x: 53.46, y: 61.87), controlPoint2: CGPoint(x: 53.56, y: 61.72))
      nosePath.addCurve(to: CGPoint(x: 53.65, y: 61.57), controlPoint1: CGPoint(x: 53.6, y: 61.57), controlPoint2: CGPoint(x: 53.65, y: 61.57))
      nosePath.addCurve(to: CGPoint(x: 42.13, y: 61.87), controlPoint1: CGPoint(x: 48.13, y: 57.9), controlPoint2: CGPoint(x: 44.07, y: 60.2))
      nosePath.close()
      fillColor21.setFill()
      nosePath.fill()
   }
}
