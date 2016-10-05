//
//  README.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class WorkClockAccessoryKit: AccessoryItemDrawing
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
      bezierPath.moveToPoint(CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.50000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.50000 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.77614 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.77614 * group2.width, group2.minY + 1.00000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.50000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.22386 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.77614 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.50000 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.22386 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.22386 * group2.width, group2.minY + 0.00000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.50000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.77614 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.22386 * group2.height))
      bezierPath.closePath()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      CGContextEndTransparencyLayer(context!)
      CGContextRestoreGState(context!)
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(group2.minX + 0.62713 * group2.width, group2.minY + 0.67301 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.61127 * group2.width, group2.minY + 0.66737 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.62011 * group2.width, group2.minY + 0.67301 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.61770 * group2.width, group2.minY + 0.67120 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.44404 * group2.width, group2.minY + 0.56556 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.44404 * group2.width, group2.minY + 0.34004 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.47975 * group2.width, group2.minY + 0.30051 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.44404 * group2.width, group2.minY + 0.31820 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.45763 * group2.width, group2.minY + 0.30051 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.51546 * group2.width, group2.minY + 0.34004 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.50185 * group2.width, group2.minY + 0.30051 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.51546 * group2.width, group2.minY + 0.31820 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.51546 * group2.width, group2.minY + 0.52085 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.64815 * group2.width, group2.minY + 0.59963 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.66168 * group2.width, group2.minY + 0.65382 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.66711 * group2.width, group2.minY + 0.61085 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.67306 * group2.width, group2.minY + 0.63511 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.62713 * group2.width, group2.minY + 0.67301 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.65418 * group2.width, group2.minY + 0.66618 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.64073 * group2.width, group2.minY + 0.67301 * group2.height))
      bezier2Path.closePath()
      primaryColor.setFill()
      bezier2Path.fill()
   }
}
