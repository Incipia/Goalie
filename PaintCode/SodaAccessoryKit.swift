//
//  SodaAccessoryKit.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class SodaAccessoryKit: AccessoryItemDrawing
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
      CGContextSaveGState(context)
      CGContextSetAlpha(context, 0.4)
      CGContextBeginTransparencyLayer(context, nil)
      
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(group2.minX + 0.71862 * group2.width, group2.minY + 0.22222 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.09155 * group2.width, group2.minY + 0.22222 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.00024 * group2.width, group2.minY + 0.28175 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.03842 * group2.width, group2.minY + 0.22222 * group2.height), controlPoint2: CGPointMake(group2.minX + -0.00354 * group2.width, group2.minY + 0.24958 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.07878 * group2.width, group2.minY + 0.94842 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.17005 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.08219 * group2.width, group2.minY + 0.97747 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.12205 * group2.width, group2.minY + 1.00000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.64013 * group2.width, group2.minY + 1.00000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.73140 * group2.width, group2.minY + 0.94842 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.68813 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.72799 * group2.width, group2.minY + 0.97747 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.80990 * group2.width, group2.minY + 0.28175 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.71862 * group2.width, group2.minY + 0.22222 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.81371 * group2.width, group2.minY + 0.24958 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.77176 * group2.width, group2.minY + 0.22222 * group2.height))
      bezierPath.closePath()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      CGContextEndTransparencyLayer(context)
      CGContextRestoreGState(context)
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(group2.minX + 0.34993 * group2.width, group2.minY + 0.41634 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.61306 * group2.width, group2.minY + 0.59556 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.46397 * group2.width, group2.minY + 0.46039 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.53783 * group2.width, group2.minY + 0.52959 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.76169 * group2.width, group2.minY + 0.69120 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.65165 * group2.width, group2.minY + 0.62939 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.70642 * group2.width, group2.minY + 0.66756 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.80992 * group2.width, group2.minY + 0.28173 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.71865 * group2.width, group2.minY + 0.22223 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.81369 * group2.width, group2.minY + 0.24959 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.77174 * group2.width, group2.minY + 0.22223 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.09153 * group2.width, group2.minY + 0.22223 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.00026 * group2.width, group2.minY + 0.28173 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.03844 * group2.width, group2.minY + 0.22223 * group2.height), controlPoint2: CGPointMake(group2.minX + -0.00351 * group2.width, group2.minY + 0.24959 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.01053 * group2.width, group2.minY + 0.36903 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.34993 * group2.width, group2.minY + 0.41634 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.12553 * group2.width, group2.minY + 0.36117 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.24471 * group2.width, group2.minY + 0.37567 * group2.height))
      bezier2Path.closePath()
      primaryColor.setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(group2.minX + 0.64895 * group2.width, group2.minY + 0.92839 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.31551 * group2.width, group2.minY + 0.74453 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.50164 * group2.width, group2.minY + 0.89100 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.40537 * group2.width, group2.minY + 0.82203 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.03806 * group2.width, group2.minY + 0.60281 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.24319 * group2.width, group2.minY + 0.68214 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.15229 * group2.width, group2.minY + 0.58939 * group2.height))
      bezier3Path.addLineToPoint(CGPointMake(group2.minX + 0.07874 * group2.width, group2.minY + 0.94842 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.17006 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.08220 * group2.width, group2.minY + 0.97747 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.12201 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier3Path.addLineToPoint(CGPointMake(group2.minX + 0.64014 * group2.width, group2.minY + 1.00000 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.73141 * group2.width, group2.minY + 0.94842 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.68813 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.72800 * group2.width, group2.minY + 0.97747 * group2.height))
      bezier3Path.addLineToPoint(CGPointMake(group2.minX + 0.73177 * group2.width, group2.minY + 0.94528 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.64895 * group2.width, group2.minY + 0.92839 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.70459 * group2.width, group2.minY + 0.94081 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.67709 * group2.width, group2.minY + 0.93553 * group2.height))
      bezier3Path.closePath()
      primaryColor.setFill()
      bezier3Path.fill()
      
      
      //// Bezier 4 Drawing
      let bezier4Path = UIBezierPath()
      bezier4Path.moveToPoint(CGPointMake(group2.minX + 0.54238 * group2.width, group2.minY + 0.33337 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.51106 * group2.width, group2.minY + 0.33001 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.53197 * group2.width, group2.minY + 0.33337 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.52138 * group2.width, group2.minY + 0.33229 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.45638 * group2.width, group2.minY + 0.25879 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.46356 * group2.width, group2.minY + 0.31948 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.43911 * group2.width, group2.minY + 0.28762 * group2.height))
      bezier4Path.addLineToPoint(CGPointMake(group2.minX + 0.58069 * group2.width, group2.minY + 0.05173 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.64778 * group2.width, group2.minY + 0.00712 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.59265 * group2.width, group2.minY + 0.03179 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.61646 * group2.width, group2.minY + 0.01593 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.74464 * group2.width, group2.minY + 0.00479 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.67864 * group2.width, group2.minY + -0.00149 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.71301 * group2.width, group2.minY + -0.00232 * group2.height))
      bezier4Path.addLineToPoint(CGPointMake(group2.minX + 0.94014 * group2.width, group2.minY + 0.04857 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.99432 * group2.width, group2.minY + 0.11990 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.98754 * group2.width, group2.minY + 0.05918 * group2.height), controlPoint2: CGPointMake(group2.minX + 1.01182 * group2.width, group2.minY + 0.09112 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.87677 * group2.width, group2.minY + 0.15282 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.97682 * group2.width, group2.minY + 0.14871 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.92414 * group2.width, group2.minY + 0.16337 * group2.height))
      bezier4Path.addLineToPoint(CGPointMake(group2.minX + 0.73401 * group2.width, group2.minY + 0.12084 * group2.height))
      bezier4Path.addLineToPoint(CGPointMake(group2.minX + 0.62837 * group2.width, group2.minY + 0.29682 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.54238 * group2.width, group2.minY + 0.33337 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.61483 * group2.width, group2.minY + 0.31937 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.57974 * group2.width, group2.minY + 0.33337 * group2.height))
      bezier4Path.closePath()
      primaryColor.setFill()
      bezier4Path.fill()
   }
}