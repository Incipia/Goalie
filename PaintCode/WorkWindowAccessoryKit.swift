//
//  Goalie.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class WorkWindowAccessoryKit: AccessoryItemDrawing
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
      bezierPath.moveToPoint(CGPointMake(group2.minX + 0.53247 * group2.width, group2.minY + 0.56000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.88312 * group2.width, group2.minY + 0.56000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.88312 * group2.width, group2.minY + 0.90000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.53247 * group2.width, group2.minY + 0.90000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.53247 * group2.width, group2.minY + 0.56000 * group2.height))
      bezierPath.closePath()
      bezierPath.moveToPoint(CGPointMake(group2.minX + 0.11688 * group2.width, group2.minY + 0.56000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.46753 * group2.width, group2.minY + 0.56000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.46753 * group2.width, group2.minY + 0.90000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.11688 * group2.width, group2.minY + 0.90000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.11688 * group2.width, group2.minY + 0.56000 * group2.height))
      bezierPath.closePath()
      bezierPath.moveToPoint(CGPointMake(group2.minX + 0.46753 * group2.width, group2.minY + 0.44000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.11688 * group2.width, group2.minY + 0.44000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.11688 * group2.width, group2.minY + 0.10000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.46753 * group2.width, group2.minY + 0.10000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.46753 * group2.width, group2.minY + 0.44000 * group2.height))
      bezierPath.closePath()
      bezierPath.moveToPoint(CGPointMake(group2.minX + 0.88312 * group2.width, group2.minY + 0.44000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.53247 * group2.width, group2.minY + 0.44000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.53247 * group2.width, group2.minY + 0.10000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.88312 * group2.width, group2.minY + 0.10000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.88312 * group2.width, group2.minY + 0.44000 * group2.height))
      bezierPath.closePath()
      bezierPath.moveToPoint(CGPointMake(group2.minX + 0.96726 * group2.width, group2.minY + 0.10000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.05130 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.98534 * group2.width, group2.minY + 0.10000 * group2.height), controlPoint2: CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.07914 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.05042 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.96726 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.02258 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.98534 * group2.width, group2.minY + 0.00000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.03274 * group2.width, group2.minY + 0.00000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.05042 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.01466 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.02258 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.05130 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.03274 * group2.width, group2.minY + 0.10000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.07914 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.01466 * group2.width, group2.minY + 0.10000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.05195 * group2.width, group2.minY + 0.10000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.05195 * group2.width, group2.minY + 0.90000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.03274 * group2.width, group2.minY + 0.90000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.94870 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.01466 * group2.width, group2.minY + 0.90000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.92086 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.94958 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.03274 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.00000 * group2.width, group2.minY + 0.97742 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.01466 * group2.width, group2.minY + 1.00000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.96726 * group2.width, group2.minY + 1.00000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.94958 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.98534 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.97742 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.94870 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.96726 * group2.width, group2.minY + 0.90000 * group2.height), controlPoint1: CGPointMake(group2.minX + 1.00000 * group2.width, group2.minY + 0.92086 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.98534 * group2.width, group2.minY + 0.90000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.94805 * group2.width, group2.minY + 0.90000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.94805 * group2.width, group2.minY + 0.10000 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.96726 * group2.width, group2.minY + 0.10000 * group2.height))
      bezierPath.closePath()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      CGContextEndTransparencyLayer(context!)
      CGContextRestoreGState(context!)
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(group2.minX + 0.21962 * group2.width, group2.minY + 0.31008 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.22078 * group2.width, group2.minY + 0.29300 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.22038 * group2.width, group2.minY + 0.30460 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.22078 * group2.width, group2.minY + 0.29888 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.17591 * group2.width, group2.minY + 0.21650 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.22078 * group2.width, group2.minY + 0.25076 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.20069 * group2.width, group2.minY + 0.21650 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.13104 * group2.width, group2.minY + 0.14000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.17591 * group2.width, group2.minY + 0.17426 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.15582 * group2.width, group2.minY + 0.14000 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.11688 * group2.width, group2.minY + 0.14400 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.12608 * group2.width, group2.minY + 0.14000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.12134 * group2.width, group2.minY + 0.14146 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.11688 * group2.width, group2.minY + 0.32000 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.21205 * group2.width, group2.minY + 0.32000 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.21962 * group2.width, group2.minY + 0.31008 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.21561 * group2.width, group2.minY + 0.32000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.21882 * group2.width, group2.minY + 0.31598 * group2.height))
      bezier2Path.closePath()
      primaryColor.setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(group2.minX + 0.85989 * group2.width, group2.minY + 0.62002 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.79590 * group2.width, group2.minY + 0.71730 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.82455 * group2.width, group2.minY + 0.62002 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.79590 * group2.width, group2.minY + 0.66358 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.79675 * group2.width, group2.minY + 0.73226 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.79590 * group2.width, group2.minY + 0.72240 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.79624 * group2.width, group2.minY + 0.72738 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.75489 * group2.width, group2.minY + 0.80710 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.77302 * group2.width, group2.minY + 0.73816 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.75489 * group2.width, group2.minY + 0.76936 * group2.height))
      bezier3Path.addLineToPoint(CGPointMake(group2.minX + 0.75489 * group2.width, group2.minY + 0.80724 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.76359 * group2.width, group2.minY + 0.82002 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.75490 * group2.width, group2.minY + 0.81436 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.75890 * group2.width, group2.minY + 0.82002 * group2.height))
      bezier3Path.addLineToPoint(CGPointMake(group2.minX + 0.88476 * group2.width, group2.minY + 0.82002 * group2.height))
      bezier3Path.addLineToPoint(CGPointMake(group2.minX + 0.88476 * group2.width, group2.minY + 0.62782 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.85989 * group2.width, group2.minY + 0.62002 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.87711 * group2.width, group2.minY + 0.62288 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.86873 * group2.width, group2.minY + 0.62002 * group2.height))
      bezier3Path.closePath()
      primaryColor.setFill()
      bezier3Path.fill()
   }
}
