//
//  BricksAccessoryKit.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

protocol AccessoryItemDrawing
{
   static func drawWithFrame(frame: CGRect, priority: TaskPriority)
}

class BricksAccessoryKit: AccessoryItemDrawing
{
   static func drawWithFrame(frame: CGRect, priority: TaskPriority)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Color Declarations
      let primaryColor = UIColor(priority: priority, headComponent: .Background)
      
      //// Subframes
      let bricksblueGroup: CGRect = CGRectMake(frame.minX, frame.minY, frame.width - 0.13, frame.height)
      
      
      //// bricks-blue Group
      //// Group 2
      CGContextSaveGState(context)
      CGContextSetAlpha(context, 0.4)
      CGContextBeginTransparencyLayer(context, nil)
      
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(bricksblueGroup.minX + 0.34869 * bricksblueGroup.width, bricksblueGroup.minY + 0.65000 * bricksblueGroup.height))
      bezierPath.addLineToPoint(CGPointMake(bricksblueGroup.minX + 0.03170 * bricksblueGroup.width, bricksblueGroup.minY + 0.65000 * bricksblueGroup.height))
      bezierPath.addCurveToPoint(CGPointMake(bricksblueGroup.minX + 0.00000 * bricksblueGroup.width, bricksblueGroup.minY + 0.58750 * bricksblueGroup.height), controlPoint1: CGPointMake(bricksblueGroup.minX + 0.01419 * bricksblueGroup.width, bricksblueGroup.minY + 0.65000 * bricksblueGroup.height), controlPoint2: CGPointMake(bricksblueGroup.minX + 0.00000 * bricksblueGroup.width, bricksblueGroup.minY + 0.62203 * bricksblueGroup.height))
      bezierPath.addLineToPoint(CGPointMake(bricksblueGroup.minX + 0.00000 * bricksblueGroup.width, bricksblueGroup.minY + 0.41250 * bricksblueGroup.height))
      bezierPath.addCurveToPoint(CGPointMake(bricksblueGroup.minX + 0.03170 * bricksblueGroup.width, bricksblueGroup.minY + 0.35000 * bricksblueGroup.height), controlPoint1: CGPointMake(bricksblueGroup.minX + 0.00000 * bricksblueGroup.width, bricksblueGroup.minY + 0.37798 * bricksblueGroup.height), controlPoint2: CGPointMake(bricksblueGroup.minX + 0.01419 * bricksblueGroup.width, bricksblueGroup.minY + 0.35000 * bricksblueGroup.height))
      bezierPath.addLineToPoint(CGPointMake(bricksblueGroup.minX + 0.34869 * bricksblueGroup.width, bricksblueGroup.minY + 0.35000 * bricksblueGroup.height))
      bezierPath.addCurveToPoint(CGPointMake(bricksblueGroup.minX + 0.38039 * bricksblueGroup.width, bricksblueGroup.minY + 0.41250 * bricksblueGroup.height), controlPoint1: CGPointMake(bricksblueGroup.minX + 0.36620 * bricksblueGroup.width, bricksblueGroup.minY + 0.35000 * bricksblueGroup.height), controlPoint2: CGPointMake(bricksblueGroup.minX + 0.38039 * bricksblueGroup.width, bricksblueGroup.minY + 0.37798 * bricksblueGroup.height))
      bezierPath.addLineToPoint(CGPointMake(bricksblueGroup.minX + 0.38039 * bricksblueGroup.width, bricksblueGroup.minY + 0.58750 * bricksblueGroup.height))
      bezierPath.addCurveToPoint(CGPointMake(bricksblueGroup.minX + 0.34869 * bricksblueGroup.width, bricksblueGroup.minY + 0.65000 * bricksblueGroup.height), controlPoint1: CGPointMake(bricksblueGroup.minX + 0.38039 * bricksblueGroup.width, bricksblueGroup.minY + 0.62203 * bricksblueGroup.height), controlPoint2: CGPointMake(bricksblueGroup.minX + 0.36620 * bricksblueGroup.width, bricksblueGroup.minY + 0.65000 * bricksblueGroup.height))
      bezierPath.closePath()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      CGContextEndTransparencyLayer(context)
      CGContextRestoreGState(context)
      
      
      //// Rectangle Drawing
      let rectanglePath = UIBezierPath(roundedRect: CGRectMake(bricksblueGroup.minX + floor(bricksblueGroup.width * 0.41146 + 0.05) + 0.45, bricksblueGroup.minY + floor(bricksblueGroup.height * 0.35000 + 0.5), floor(bricksblueGroup.width * 0.79185 + 0.05) - floor(bricksblueGroup.width * 0.41146 + 0.05), floor(bricksblueGroup.height * 0.65000 + 0.5) - floor(bricksblueGroup.height * 0.35000 + 0.5)), cornerRadius: 2.6)
      primaryColor.setFill()
      rectanglePath.fill()
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(bricksblueGroup.minX + 0.55706 * bricksblueGroup.width, bricksblueGroup.minY + 1.00000 * bricksblueGroup.height))
      bezier2Path.addLineToPoint(CGPointMake(bricksblueGroup.minX + 0.24007 * bricksblueGroup.width, bricksblueGroup.minY + 1.00000 * bricksblueGroup.height))
      bezier2Path.addCurveToPoint(CGPointMake(bricksblueGroup.minX + 0.20837 * bricksblueGroup.width, bricksblueGroup.minY + 0.93750 * bricksblueGroup.height), controlPoint1: CGPointMake(bricksblueGroup.minX + 0.22255 * bricksblueGroup.width, bricksblueGroup.minY + 1.00000 * bricksblueGroup.height), controlPoint2: CGPointMake(bricksblueGroup.minX + 0.20837 * bricksblueGroup.width, bricksblueGroup.minY + 0.97203 * bricksblueGroup.height))
      bezier2Path.addLineToPoint(CGPointMake(bricksblueGroup.minX + 0.20837 * bricksblueGroup.width, bricksblueGroup.minY + 0.76250 * bricksblueGroup.height))
      bezier2Path.addCurveToPoint(CGPointMake(bricksblueGroup.minX + 0.24007 * bricksblueGroup.width, bricksblueGroup.minY + 0.70000 * bricksblueGroup.height), controlPoint1: CGPointMake(bricksblueGroup.minX + 0.20837 * bricksblueGroup.width, bricksblueGroup.minY + 0.72798 * bricksblueGroup.height), controlPoint2: CGPointMake(bricksblueGroup.minX + 0.22255 * bricksblueGroup.width, bricksblueGroup.minY + 0.70000 * bricksblueGroup.height))
      bezier2Path.addLineToPoint(CGPointMake(bricksblueGroup.minX + 0.55706 * bricksblueGroup.width, bricksblueGroup.minY + 0.70000 * bricksblueGroup.height))
      bezier2Path.addCurveToPoint(CGPointMake(bricksblueGroup.minX + 0.58876 * bricksblueGroup.width, bricksblueGroup.minY + 0.76250 * bricksblueGroup.height), controlPoint1: CGPointMake(bricksblueGroup.minX + 0.57457 * bricksblueGroup.width, bricksblueGroup.minY + 0.70000 * bricksblueGroup.height), controlPoint2: CGPointMake(bricksblueGroup.minX + 0.58876 * bricksblueGroup.width, bricksblueGroup.minY + 0.72798 * bricksblueGroup.height))
      bezier2Path.addLineToPoint(CGPointMake(bricksblueGroup.minX + 0.58876 * bricksblueGroup.width, bricksblueGroup.minY + 0.93750 * bricksblueGroup.height))
      bezier2Path.addCurveToPoint(CGPointMake(bricksblueGroup.minX + 0.55706 * bricksblueGroup.width, bricksblueGroup.minY + 1.00000 * bricksblueGroup.height), controlPoint1: CGPointMake(bricksblueGroup.minX + 0.58876 * bricksblueGroup.width, bricksblueGroup.minY + 0.97203 * bricksblueGroup.height), controlPoint2: CGPointMake(bricksblueGroup.minX + 0.57457 * bricksblueGroup.width, bricksblueGroup.minY + 1.00000 * bricksblueGroup.height))
      bezier2Path.closePath()
      primaryColor.setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(bricksblueGroup.minX + 0.96830 * bricksblueGroup.width, bricksblueGroup.minY + 1.00000 * bricksblueGroup.height))
      bezier3Path.addLineToPoint(CGPointMake(bricksblueGroup.minX + 0.65131 * bricksblueGroup.width, bricksblueGroup.minY + 1.00000 * bricksblueGroup.height))
      bezier3Path.addCurveToPoint(CGPointMake(bricksblueGroup.minX + 0.61961 * bricksblueGroup.width, bricksblueGroup.minY + 0.93750 * bricksblueGroup.height), controlPoint1: CGPointMake(bricksblueGroup.minX + 0.63380 * bricksblueGroup.width, bricksblueGroup.minY + 1.00000 * bricksblueGroup.height), controlPoint2: CGPointMake(bricksblueGroup.minX + 0.61961 * bricksblueGroup.width, bricksblueGroup.minY + 0.97203 * bricksblueGroup.height))
      bezier3Path.addLineToPoint(CGPointMake(bricksblueGroup.minX + 0.61961 * bricksblueGroup.width, bricksblueGroup.minY + 0.76250 * bricksblueGroup.height))
      bezier3Path.addCurveToPoint(CGPointMake(bricksblueGroup.minX + 0.65131 * bricksblueGroup.width, bricksblueGroup.minY + 0.70000 * bricksblueGroup.height), controlPoint1: CGPointMake(bricksblueGroup.minX + 0.61961 * bricksblueGroup.width, bricksblueGroup.minY + 0.72798 * bricksblueGroup.height), controlPoint2: CGPointMake(bricksblueGroup.minX + 0.63380 * bricksblueGroup.width, bricksblueGroup.minY + 0.70000 * bricksblueGroup.height))
      bezier3Path.addLineToPoint(CGPointMake(bricksblueGroup.minX + 0.96830 * bricksblueGroup.width, bricksblueGroup.minY + 0.70000 * bricksblueGroup.height))
      bezier3Path.addCurveToPoint(CGPointMake(bricksblueGroup.minX + 1.00000 * bricksblueGroup.width, bricksblueGroup.minY + 0.76250 * bricksblueGroup.height), controlPoint1: CGPointMake(bricksblueGroup.minX + 0.98581 * bricksblueGroup.width, bricksblueGroup.minY + 0.70000 * bricksblueGroup.height), controlPoint2: CGPointMake(bricksblueGroup.minX + 1.00000 * bricksblueGroup.width, bricksblueGroup.minY + 0.72798 * bricksblueGroup.height))
      bezier3Path.addLineToPoint(CGPointMake(bricksblueGroup.minX + 1.00000 * bricksblueGroup.width, bricksblueGroup.minY + 0.93750 * bricksblueGroup.height))
      bezier3Path.addCurveToPoint(CGPointMake(bricksblueGroup.minX + 0.96830 * bricksblueGroup.width, bricksblueGroup.minY + 1.00000 * bricksblueGroup.height), controlPoint1: CGPointMake(bricksblueGroup.minX + 1.00000 * bricksblueGroup.width, bricksblueGroup.minY + 0.97203 * bricksblueGroup.height), controlPoint2: CGPointMake(bricksblueGroup.minX + 0.98581 * bricksblueGroup.width, bricksblueGroup.minY + 1.00000 * bricksblueGroup.height))
      bezier3Path.closePath()
      primaryColor.setFill()
      bezier3Path.fill()
      
      
      //// Rectangle 2 Drawing
      let rectangle2Path = UIBezierPath(roundedRect: CGRectMake(bricksblueGroup.minX + floor(bricksblueGroup.width * 0.20858 + 0.05) + 0.45, bricksblueGroup.minY + floor(bricksblueGroup.height * 0.00000 + 0.5), floor(bricksblueGroup.width * 0.58897 + 0.05) - floor(bricksblueGroup.width * 0.20858 + 0.05), floor(bricksblueGroup.height * 0.30000 + 0.5) - floor(bricksblueGroup.height * 0.00000 + 0.5)), cornerRadius: 2.6)
      primaryColor.setFill()
      rectangle2Path.fill()
   }
}