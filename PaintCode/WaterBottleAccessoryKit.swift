//
//  WaterBottleAccessoryKit.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class WaterBottleAccessoryKit: AccessoryItemDrawing
{
   static func drawWithFrame(frame: CGRect, priority: TaskPriority)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Color Declarations
//      let primaryColor = UIColor(red: 0.072, green: 0.412, blue: 0.759, alpha: 1.000)
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
      bezierPath.moveToPoint(CGPointMake(group2.minX + 0.60055 * group2.width, group2.minY + 0.63947 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.54859 * group2.width, group2.minY + 0.65957 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.58655 * group2.width, group2.minY + 0.64822 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.56877 * group2.width, group2.minY + 0.65525 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.38091 * group2.width, group2.minY + 0.58137 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.45455 * group2.width, group2.minY + 0.67967 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.37518 * group2.width, group2.minY + 0.63107 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.52691 * group2.width, group2.minY + 0.47302 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.38636 * group2.width, group2.minY + 0.53420 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.46105 * group2.width, group2.minY + 0.49580 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.54077 * group2.width, group2.minY + 0.47752 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.53309 * group2.width, group2.minY + 0.47090 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.54064 * group2.width, group2.minY + 0.47337 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.62355 * group2.width, group2.minY + 0.56755 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.54214 * group2.width, group2.minY + 0.51302 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.59864 * group2.width, group2.minY + 0.53715 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.60055 * group2.width, group2.minY + 0.63947 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.64400 * group2.width, group2.minY + 0.59250 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.63150 * group2.width, group2.minY + 0.62015 * group2.height))
      bezierPath.closePath()
      bezierPath.moveToPoint(CGPointMake(group2.minX + 0.69127 * group2.width, group2.minY + 0.15000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.30873 * group2.width, group2.minY + 0.15000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.32075 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.13823 * group2.width, group2.minY + 0.15000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.22287 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 1.00000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 1.00000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.32075 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.69127 * group2.width, group2.minY + 0.15000 * group2.height), controlPoint1: CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.22287 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.86177 * group2.width, group2.minY + 0.15000 * group2.height))
      bezierPath.closePath()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      CGContextEndTransparencyLayer(context!)
      CGContextRestoreGState(context!)
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(group2.minX + 0.72726 * group2.width, group2.minY + 0.15000 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.27271 * group2.width, group2.minY + 0.15000 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.27271 * group2.width, group2.minY + 0.06675 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.41280 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.27271 * group2.width, group2.minY + 0.02988 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.34576 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.58717 * group2.width, group2.minY + 0.00000 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.72726 * group2.width, group2.minY + 0.06675 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.65421 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.72726 * group2.width, group2.minY + 0.02988 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.72726 * group2.width, group2.minY + 0.15000 * group2.height))
      bezier2Path.closePath()
      primaryColor.setFill()
      bezier2Path.fill()
   }
}
