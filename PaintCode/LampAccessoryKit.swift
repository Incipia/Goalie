//
//  LampAccessoryKit.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class LampAccessoryKit: AccessoryItemDrawing
{
   static func drawWithFrame(_ frame: CGRect, priority: TaskPriority)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Color Declarations
      let primaryColor = UIColor(priority: priority, headComponent: .background)
      
      //// Group
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.move(to: CGPoint(x: frame.minX + 41.45, y: frame.minY + 4.41))
      bezierPath.addCurve(to: CGPoint(x: frame.minX + 28.6, y: frame.minY + 2.09), controlPoint1: CGPoint(x: frame.minX + 37.81, y: frame.minY + 1.36), controlPoint2: CGPoint(x: frame.minX + 32.9, y: frame.minY + 0.57))
      bezierPath.addCurve(to: CGPoint(x: frame.minX + 20.59, y: frame.minY + 1.24), controlPoint1: CGPoint(x: frame.minX + 26.2, y: frame.minY - 0.31), controlPoint2: CGPoint(x: frame.minX + 22.67, y: frame.minY - 0.71))
      bezierPath.addCurve(to: CGPoint(x: frame.minX + 20.83, y: frame.minY + 9.35), controlPoint1: CGPoint(x: frame.minX + 18.51, y: frame.minY + 3.18), controlPoint2: CGPoint(x: frame.minX + 18.64, y: frame.minY + 6.76))
      bezierPath.addCurve(to: CGPoint(x: frame.minX + 22.15, y: frame.minY + 22.45), controlPoint1: CGPoint(x: frame.minX + 19, y: frame.minY + 13.56), controlPoint2: CGPoint(x: frame.minX + 19.42, y: frame.minY + 18.56))
      bezierPath.addCurve(to: CGPoint(x: frame.minX + 24.49, y: frame.minY + 22.67), controlPoint1: CGPoint(x: frame.minX + 22.69, y: frame.minY + 23.22), controlPoint2: CGPoint(x: frame.minX + 23.8, y: frame.minY + 23.31))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 41.49, y: frame.minY + 6.77))
      bezierPath.addCurve(to: CGPoint(x: frame.minX + 41.45, y: frame.minY + 4.41), controlPoint1: CGPoint(x: frame.minX + 42.18, y: frame.minY + 6.13), controlPoint2: CGPoint(x: frame.minX + 42.17, y: frame.minY + 5.01))
      bezierPath.close()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      //// Group 2
      context!.saveGState()
      context!.setAlpha(0.4)
      context!.beginTransparencyLayer(auxiliaryInfo: nil)
      
      
      //// Bezier 2 Drawing
      context!.saveGState()
      context!.translateBy(x: frame.minX + 29.08, y: frame.minY + 9.75)
      context!.rotate(by: -3 * CGFloat(M_PI) / 180)
      
      let bezier2Path = UIBezierPath()
      bezier2Path.move(to: CGPoint(x: 8.9, y: 0))
      bezier2Path.addCurve(to: CGPoint(x: 8.51, y: 9.68), controlPoint1: CGPoint(x: 11.7, y: 2.77), controlPoint2: CGPoint(x: 11.52, y: 7.11))
      bezier2Path.addCurve(to: CGPoint(x: -2, y: 9.31), controlPoint1: CGPoint(x: 5.5, y: 12.25), controlPoint2: CGPoint(x: 0.79, y: 12.09))
      primaryColor.setFill()
      bezier2Path.fill()
      
      context!.restoreGState()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.move(to: CGPoint(x: frame.minX + 9.88, y: frame.minY + 39.14))
      bezier3Path.addCurve(to: CGPoint(x: frame.minX + 19.94, y: frame.minY + 2.99), controlPoint1: CGPoint(x: frame.minX + 6.17, y: frame.minY + 18.07), controlPoint2: CGPoint(x: frame.minX + 19.37, y: frame.minY + 3.59))
      bezier3Path.addLine(to: CGPoint(x: frame.minX + 22.76, y: frame.minY + 5.21))
      bezier3Path.addCurve(to: CGPoint(x: frame.minX + 13.54, y: frame.minY + 38.59), controlPoint1: CGPoint(x: frame.minX + 22.63, y: frame.minY + 5.35), controlPoint2: CGPoint(x: frame.minX + 10.12, y: frame.minY + 19.14))
      bezier3Path.addLine(to: CGPoint(x: frame.minX + 9.88, y: frame.minY + 39.14))
      bezier3Path.close()
      primaryColor.setFill()
      bezier3Path.fill()
      
      
      context!.endTransparencyLayer()
      context!.restoreGState()
      
      
      //// Bezier 4 Drawing
      let bezier4Path = UIBezierPath()
      bezier4Path.move(to: CGPoint(x: frame.minX + 26.65, y: frame.minY + 43))
      bezier4Path.addLine(to: CGPoint(x: frame.minX + 26.2, y: frame.minY + 43))
      bezier4Path.addCurve(to: CGPoint(x: frame.minX + 14.45, y: frame.minY + 37.65), controlPoint1: CGPoint(x: frame.minX + 24.08, y: frame.minY + 40), controlPoint2: CGPoint(x: frame.minX + 19.62, y: frame.minY + 37.65))
      bezier4Path.addCurve(to: CGPoint(x: frame.minX + 2.7, y: frame.minY + 43), controlPoint1: CGPoint(x: frame.minX + 9.29, y: frame.minY + 37.65), controlPoint2: CGPoint(x: frame.minX + 4.83, y: frame.minY + 40))
      bezier4Path.addLine(to: CGPoint(x: frame.minX + 2.26, y: frame.minY + 43))
      bezier4Path.addCurve(to: CGPoint(x: frame.minX, y: frame.minY + 45.5), controlPoint1: CGPoint(x: frame.minX + 1.01, y: frame.minY + 43), controlPoint2: CGPoint(x: frame.minX, y: frame.minY + 44.24))
      bezier4Path.addCurve(to: CGPoint(x: frame.minX + 2.26, y: frame.minY + 48), controlPoint1: CGPoint(x: frame.minX, y: frame.minY + 46.76), controlPoint2: CGPoint(x: frame.minX + 1.01, y: frame.minY + 48))
      bezier4Path.addLine(to: CGPoint(x: frame.minX + 26.65, y: frame.minY + 48))
      bezier4Path.addCurve(to: CGPoint(x: frame.minX + 28.91, y: frame.minY + 45.5), controlPoint1: CGPoint(x: frame.minX + 27.89, y: frame.minY + 48), controlPoint2: CGPoint(x: frame.minX + 28.91, y: frame.minY + 46.76))
      bezier4Path.addCurve(to: CGPoint(x: frame.minX + 26.65, y: frame.minY + 43), controlPoint1: CGPoint(x: frame.minX + 28.91, y: frame.minY + 44.24), controlPoint2: CGPoint(x: frame.minX + 27.89, y: frame.minY + 43))
      bezier4Path.close()
      primaryColor.setFill()
      bezier4Path.fill()
   }
}
