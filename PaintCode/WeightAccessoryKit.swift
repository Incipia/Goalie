//
//  WeightAccessoryKit.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class WeightAccessoryKit: AccessoryItemDrawing
{
   static func drawWithFrame(frame: CGRect, priority: TaskPriority)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Color Declarations
      let primaryColor = UIColor(priority: priority, headComponent: .Background)
      
      
      //// Subframes
      let group2: CGRect = CGRectMake(frame.minX, frame.minY, frame.width, frame.height)
      
      
      //// Group 2
      //// Group
      CGContextSaveGState(context!)
      CGContextSetAlpha(context!, 0.4)
      CGContextBeginTransparencyLayer(context!, nil)
      
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(group2.minX + 0.95312 * group2.width, group2.minY + 0.60000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.04688 * group2.width, group2.minY + 0.60000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.50000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.02109 * group2.width, group2.minY + 0.60000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.55500 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.50000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.04688 * group2.width, group2.minY + 0.40000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.44500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.02109 * group2.width, group2.minY + 0.40000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.95312 * group2.width, group2.minY + 0.40000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.50000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.97891 * group2.width, group2.minY + 0.40000 * group2.height), controlPoint2: CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.44500 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.50000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.95312 * group2.width, group2.minY + 0.60000 * group2.height), controlPoint1: CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.55500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.97891 * group2.width, group2.minY + 0.60000 * group2.height))
      bezierPath.closePath()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      CGContextEndTransparencyLayer(context!)
      CGContextRestoreGState(context!)
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(group2.minX + 0.12500 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.12500 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.07812 * group2.width, group2.minY + 0.90000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.09922 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.07812 * group2.width, group2.minY + 0.95500 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.07812 * group2.width, group2.minY + 0.10000 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.12500 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.07812 * group2.width, group2.minY + 0.04500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.09922 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.12500 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.17188 * group2.width, group2.minY + 0.10000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.15078 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.17188 * group2.width, group2.minY + 0.04500 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.17188 * group2.width, group2.minY + 0.90000 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.12500 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.17188 * group2.width, group2.minY + 0.95500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.15078 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier2Path.closePath()
      primaryColor.setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(group2.minX + 0.21875 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier3Path.addLineToPoint(CGPointMake(group2.minX + 0.21875 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.17188 * group2.width, group2.minY + 0.90000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.19297 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.17188 * group2.width, group2.minY + 0.95500 * group2.height))
      bezier3Path.addLineToPoint(CGPointMake(group2.minX + 0.17188 * group2.width, group2.minY + 0.10000 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.21875 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.17188 * group2.width, group2.minY + 0.04500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.19297 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier3Path.addLineToPoint(CGPointMake(group2.minX + 0.21875 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.26562 * group2.width, group2.minY + 0.10000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.24453 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.26562 * group2.width, group2.minY + 0.04500 * group2.height))
      bezier3Path.addLineToPoint(CGPointMake(group2.minX + 0.26562 * group2.width, group2.minY + 0.90000 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.21875 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.26562 * group2.width, group2.minY + 0.95500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.24453 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier3Path.closePath()
      primaryColor.setFill()
      bezier3Path.fill()
      
      
      //// Bezier 4 Drawing
      let bezier4Path = UIBezierPath()
      bezier4Path.moveToPoint(CGPointMake(group2.minX + 0.31250 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier4Path.addLineToPoint(CGPointMake(group2.minX + 0.31250 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.26562 * group2.width, group2.minY + 0.90000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.28672 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.26562 * group2.width, group2.minY + 0.95500 * group2.height))
      bezier4Path.addLineToPoint(CGPointMake(group2.minX + 0.26562 * group2.width, group2.minY + 0.10000 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.31250 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.26562 * group2.width, group2.minY + 0.04500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.28672 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier4Path.addLineToPoint(CGPointMake(group2.minX + 0.31250 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.35938 * group2.width, group2.minY + 0.10000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.33828 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.35938 * group2.width, group2.minY + 0.04500 * group2.height))
      bezier4Path.addLineToPoint(CGPointMake(group2.minX + 0.35938 * group2.width, group2.minY + 0.90000 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.31250 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.35938 * group2.width, group2.minY + 0.95500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.33828 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier4Path.closePath()
      primaryColor.setFill()
      bezier4Path.fill()
      
      
      //// Bezier 5 Drawing
      let bezier5Path = UIBezierPath()
      bezier5Path.moveToPoint(CGPointMake(group2.minX + 0.87500 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier5Path.addLineToPoint(CGPointMake(group2.minX + 0.87500 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier5Path.addCurveToPoint(CGPointMake(group2.minX + 0.92188 * group2.width, group2.minY + 0.10000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.90078 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.92188 * group2.width, group2.minY + 0.04500 * group2.height))
      bezier5Path.addLineToPoint(CGPointMake(group2.minX + 0.92188 * group2.width, group2.minY + 0.90000 * group2.height))
      bezier5Path.addCurveToPoint(CGPointMake(group2.minX + 0.87500 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.92188 * group2.width, group2.minY + 0.95500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.90078 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier5Path.addLineToPoint(CGPointMake(group2.minX + 0.87500 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier5Path.addCurveToPoint(CGPointMake(group2.minX + 0.82812 * group2.width, group2.minY + 0.90000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.84922 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.82812 * group2.width, group2.minY + 0.95500 * group2.height))
      bezier5Path.addLineToPoint(CGPointMake(group2.minX + 0.82812 * group2.width, group2.minY + 0.10000 * group2.height))
      bezier5Path.addCurveToPoint(CGPointMake(group2.minX + 0.87500 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.82812 * group2.width, group2.minY + 0.04500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.84922 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier5Path.closePath()
      primaryColor.setFill()
      bezier5Path.fill()
      
      
      //// Bezier 6 Drawing
      let bezier6Path = UIBezierPath()
      bezier6Path.moveToPoint(CGPointMake(group2.minX + 0.78125 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier6Path.addLineToPoint(CGPointMake(group2.minX + 0.78125 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier6Path.addCurveToPoint(CGPointMake(group2.minX + 0.82812 * group2.width, group2.minY + 0.10000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.80703 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.82812 * group2.width, group2.minY + 0.04500 * group2.height))
      bezier6Path.addLineToPoint(CGPointMake(group2.minX + 0.82812 * group2.width, group2.minY + 0.90000 * group2.height))
      bezier6Path.addCurveToPoint(CGPointMake(group2.minX + 0.78125 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.82812 * group2.width, group2.minY + 0.95500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.80703 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier6Path.addLineToPoint(CGPointMake(group2.minX + 0.78125 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier6Path.addCurveToPoint(CGPointMake(group2.minX + 0.73438 * group2.width, group2.minY + 0.90000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.75547 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.73438 * group2.width, group2.minY + 0.95500 * group2.height))
      bezier6Path.addLineToPoint(CGPointMake(group2.minX + 0.73438 * group2.width, group2.minY + 0.10000 * group2.height))
      bezier6Path.addCurveToPoint(CGPointMake(group2.minX + 0.78125 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.73438 * group2.width, group2.minY + 0.04500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.75547 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier6Path.closePath()
      primaryColor.setFill()
      bezier6Path.fill()
      
      
      //// Bezier 7 Drawing
      let bezier7Path = UIBezierPath()
      bezier7Path.moveToPoint(CGPointMake(group2.minX + 0.68750 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier7Path.addLineToPoint(CGPointMake(group2.minX + 0.68750 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier7Path.addCurveToPoint(CGPointMake(group2.minX + 0.73438 * group2.width, group2.minY + 0.10000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.71328 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.73438 * group2.width, group2.minY + 0.04500 * group2.height))
      bezier7Path.addLineToPoint(CGPointMake(group2.minX + 0.73438 * group2.width, group2.minY + 0.90000 * group2.height))
      bezier7Path.addCurveToPoint(CGPointMake(group2.minX + 0.68750 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.73438 * group2.width, group2.minY + 0.95500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.71328 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier7Path.addLineToPoint(CGPointMake(group2.minX + 0.68750 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier7Path.addCurveToPoint(CGPointMake(group2.minX + 0.64062 * group2.width, group2.minY + 0.90000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.66172 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.64062 * group2.width, group2.minY + 0.95500 * group2.height))
      bezier7Path.addLineToPoint(CGPointMake(group2.minX + 0.64062 * group2.width, group2.minY + 0.10000 * group2.height))
      bezier7Path.addCurveToPoint(CGPointMake(group2.minX + 0.68750 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.64062 * group2.width, group2.minY + 0.04500 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.66172 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier7Path.closePath()
      primaryColor.setFill()
      bezier7Path.fill()
   }
}
