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
   static func drawWithFrame(frame: CGRect, priority: TaskPriority)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Color Declarations
      let primaryColor = UIColor(priority: priority, headComponent: .Background)
      
      //// Group
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(frame.minX + 41.45, frame.minY + 4.41))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 28.6, frame.minY + 2.09), controlPoint1: CGPointMake(frame.minX + 37.81, frame.minY + 1.36), controlPoint2: CGPointMake(frame.minX + 32.9, frame.minY + 0.57))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 20.59, frame.minY + 1.24), controlPoint1: CGPointMake(frame.minX + 26.2, frame.minY - 0.31), controlPoint2: CGPointMake(frame.minX + 22.67, frame.minY - 0.71))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 20.83, frame.minY + 9.35), controlPoint1: CGPointMake(frame.minX + 18.51, frame.minY + 3.18), controlPoint2: CGPointMake(frame.minX + 18.64, frame.minY + 6.76))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 22.15, frame.minY + 22.45), controlPoint1: CGPointMake(frame.minX + 19, frame.minY + 13.56), controlPoint2: CGPointMake(frame.minX + 19.42, frame.minY + 18.56))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 24.49, frame.minY + 22.67), controlPoint1: CGPointMake(frame.minX + 22.69, frame.minY + 23.22), controlPoint2: CGPointMake(frame.minX + 23.8, frame.minY + 23.31))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 41.49, frame.minY + 6.77))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 41.45, frame.minY + 4.41), controlPoint1: CGPointMake(frame.minX + 42.18, frame.minY + 6.13), controlPoint2: CGPointMake(frame.minX + 42.17, frame.minY + 5.01))
      bezierPath.closePath()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      //// Group 2
      CGContextSaveGState(context!)
      CGContextSetAlpha(context!, 0.4)
      CGContextBeginTransparencyLayer(context!, nil)
      
      
      //// Bezier 2 Drawing
      CGContextSaveGState(context!)
      CGContextTranslateCTM(context!, frame.minX + 29.08, frame.minY + 9.75)
      CGContextRotateCTM(context!, -3 * CGFloat(M_PI) / 180)
      
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(8.9, 0))
      bezier2Path.addCurveToPoint(CGPointMake(8.51, 9.68), controlPoint1: CGPointMake(11.7, 2.77), controlPoint2: CGPointMake(11.52, 7.11))
      bezier2Path.addCurveToPoint(CGPointMake(-2, 9.31), controlPoint1: CGPointMake(5.5, 12.25), controlPoint2: CGPointMake(0.79, 12.09))
      primaryColor.setFill()
      bezier2Path.fill()
      
      CGContextRestoreGState(context!)
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(frame.minX + 9.88, frame.minY + 39.14))
      bezier3Path.addCurveToPoint(CGPointMake(frame.minX + 19.94, frame.minY + 2.99), controlPoint1: CGPointMake(frame.minX + 6.17, frame.minY + 18.07), controlPoint2: CGPointMake(frame.minX + 19.37, frame.minY + 3.59))
      bezier3Path.addLineToPoint(CGPointMake(frame.minX + 22.76, frame.minY + 5.21))
      bezier3Path.addCurveToPoint(CGPointMake(frame.minX + 13.54, frame.minY + 38.59), controlPoint1: CGPointMake(frame.minX + 22.63, frame.minY + 5.35), controlPoint2: CGPointMake(frame.minX + 10.12, frame.minY + 19.14))
      bezier3Path.addLineToPoint(CGPointMake(frame.minX + 9.88, frame.minY + 39.14))
      bezier3Path.closePath()
      primaryColor.setFill()
      bezier3Path.fill()
      
      
      CGContextEndTransparencyLayer(context!)
      CGContextRestoreGState(context!)
      
      
      //// Bezier 4 Drawing
      let bezier4Path = UIBezierPath()
      bezier4Path.moveToPoint(CGPointMake(frame.minX + 26.65, frame.minY + 43))
      bezier4Path.addLineToPoint(CGPointMake(frame.minX + 26.2, frame.minY + 43))
      bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 14.45, frame.minY + 37.65), controlPoint1: CGPointMake(frame.minX + 24.08, frame.minY + 40), controlPoint2: CGPointMake(frame.minX + 19.62, frame.minY + 37.65))
      bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 2.7, frame.minY + 43), controlPoint1: CGPointMake(frame.minX + 9.29, frame.minY + 37.65), controlPoint2: CGPointMake(frame.minX + 4.83, frame.minY + 40))
      bezier4Path.addLineToPoint(CGPointMake(frame.minX + 2.26, frame.minY + 43))
      bezier4Path.addCurveToPoint(CGPointMake(frame.minX, frame.minY + 45.5), controlPoint1: CGPointMake(frame.minX + 1.01, frame.minY + 43), controlPoint2: CGPointMake(frame.minX, frame.minY + 44.24))
      bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 2.26, frame.minY + 48), controlPoint1: CGPointMake(frame.minX, frame.minY + 46.76), controlPoint2: CGPointMake(frame.minX + 1.01, frame.minY + 48))
      bezier4Path.addLineToPoint(CGPointMake(frame.minX + 26.65, frame.minY + 48))
      bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 28.91, frame.minY + 45.5), controlPoint1: CGPointMake(frame.minX + 27.89, frame.minY + 48), controlPoint2: CGPointMake(frame.minX + 28.91, frame.minY + 46.76))
      bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 26.65, frame.minY + 43), controlPoint1: CGPointMake(frame.minX + 28.91, frame.minY + 44.24), controlPoint2: CGPointMake(frame.minX + 27.89, frame.minY + 43))
      bezier4Path.closePath()
      primaryColor.setFill()
      bezier4Path.fill()
   }
}
