//
//  JumpropeAccessoryKit.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class JumpropeAccessoryKit: AccessoryItemDrawing
{
   static func drawWithFrame(frame: CGRect, priority: TaskPriority)
   {
      let context = UIGraphicsGetCurrentContext()
      
      //// Color Declarations
//      let primaryColor = UIColor(red: 0.072, green: 0.412, blue: 0.759, alpha: 1.000)
      let primaryColor = UIColor(priority: priority, headComponent: .Background)
      
      
      //// Subframes
      let group: CGRect = CGRectMake(frame.minX, frame.minY, frame.width, frame.height - 0)
      
      
      //// Group
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(group.minX + 0.16608 * group.width, group.minY + 0.61620 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.16608 * group.width, group.minY + 0.61099 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.08303 * group.width, group.minY + 0.55172 * group.height), controlPoint1: CGPointMake(group.minX + 0.16608 * group.width, group.minY + 0.57825 * group.height), controlPoint2: CGPointMake(group.minX + 0.12892 * group.width, group.minY + 0.55172 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.08303 * group.width, group.minY + 0.55172 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.08303 * group.width, group.minY + 0.55172 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.00000 * group.width, group.minY + 0.61099 * group.height), controlPoint1: CGPointMake(group.minX + 0.03717 * group.width, group.minY + 0.55172 * group.height), controlPoint2: CGPointMake(group.minX + 0.00000 * group.width, group.minY + 0.57825 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.00000 * group.width, group.minY + 0.61620 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.01561 * group.width, group.minY + 0.66274 * group.height), controlPoint1: CGPointMake(group.minX + 0.00000 * group.width, group.minY + 0.63237 * group.height), controlPoint2: CGPointMake(group.minX + 0.00436 * group.width, group.minY + 0.64870 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.03050 * group.width, group.minY + 0.71336 * group.height), controlPoint1: CGPointMake(group.minX + 0.02461 * group.width, group.minY + 0.67401 * group.height), controlPoint2: CGPointMake(group.minX + 0.03050 * group.width, group.minY + 0.69243 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.01561 * group.width, group.minY + 0.76400 * group.height), controlPoint1: CGPointMake(group.minX + 0.03050 * group.width, group.minY + 0.73431 * group.height), controlPoint2: CGPointMake(group.minX + 0.02461 * group.width, group.minY + 0.75272 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.00000 * group.width, group.minY + 0.81053 * group.height), controlPoint1: CGPointMake(group.minX + 0.00436 * group.width, group.minY + 0.77803 * group.height), controlPoint2: CGPointMake(group.minX + 0.00000 * group.width, group.minY + 0.79436 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.00000 * group.width, group.minY + 0.94074 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.08303 * group.width, group.minY + 1.00000 * group.height), controlPoint1: CGPointMake(group.minX + 0.00000 * group.width, group.minY + 0.97347 * group.height), controlPoint2: CGPointMake(group.minX + 0.03717 * group.width, group.minY + 1.00000 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.08303 * group.width, group.minY + 1.00000 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.08303 * group.width, group.minY + 1.00000 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.16608 * group.width, group.minY + 0.94074 * group.height), controlPoint1: CGPointMake(group.minX + 0.12892 * group.width, group.minY + 1.00000 * group.height), controlPoint2: CGPointMake(group.minX + 0.16608 * group.width, group.minY + 0.97347 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.16608 * group.width, group.minY + 0.81053 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.15047 * group.width, group.minY + 0.76400 * group.height), controlPoint1: CGPointMake(group.minX + 0.16608 * group.width, group.minY + 0.79436 * group.height), controlPoint2: CGPointMake(group.minX + 0.16172 * group.width, group.minY + 0.77803 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.13558 * group.width, group.minY + 0.71336 * group.height), controlPoint1: CGPointMake(group.minX + 0.14147 * group.width, group.minY + 0.75272 * group.height), controlPoint2: CGPointMake(group.minX + 0.13558 * group.width, group.minY + 0.73431 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.15047 * group.width, group.minY + 0.66274 * group.height), controlPoint1: CGPointMake(group.minX + 0.13558 * group.width, group.minY + 0.69243 * group.height), controlPoint2: CGPointMake(group.minX + 0.14147 * group.width, group.minY + 0.67401 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.16608 * group.width, group.minY + 0.61620 * group.height), controlPoint1: CGPointMake(group.minX + 0.16172 * group.width, group.minY + 0.64870 * group.height), controlPoint2: CGPointMake(group.minX + 0.16608 * group.width, group.minY + 0.63237 * group.height))
      bezierPath.closePath()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(group.minX + 1.00000 * group.width, group.minY + 0.61620 * group.height))
      bezier2Path.addLineToPoint(CGPointMake(group.minX + 1.00000 * group.width, group.minY + 0.61099 * group.height))
      bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.91694 * group.width, group.minY + 0.55172 * group.height), controlPoint1: CGPointMake(group.minX + 1.00000 * group.width, group.minY + 0.57825 * group.height), controlPoint2: CGPointMake(group.minX + 0.96281 * group.width, group.minY + 0.55172 * group.height))
      bezier2Path.addLineToPoint(CGPointMake(group.minX + 0.91694 * group.width, group.minY + 0.55172 * group.height))
      bezier2Path.addLineToPoint(CGPointMake(group.minX + 0.91694 * group.width, group.minY + 0.55172 * group.height))
      bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.83392 * group.width, group.minY + 0.61099 * group.height), controlPoint1: CGPointMake(group.minX + 0.87108 * group.width, group.minY + 0.55172 * group.height), controlPoint2: CGPointMake(group.minX + 0.83392 * group.width, group.minY + 0.57825 * group.height))
      bezier2Path.addLineToPoint(CGPointMake(group.minX + 0.83392 * group.width, group.minY + 0.61620 * group.height))
      bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.84953 * group.width, group.minY + 0.66274 * group.height), controlPoint1: CGPointMake(group.minX + 0.83392 * group.width, group.minY + 0.63237 * group.height), controlPoint2: CGPointMake(group.minX + 0.83828 * group.width, group.minY + 0.64870 * group.height))
      bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.86442 * group.width, group.minY + 0.71336 * group.height), controlPoint1: CGPointMake(group.minX + 0.85853 * group.width, group.minY + 0.67401 * group.height), controlPoint2: CGPointMake(group.minX + 0.86442 * group.width, group.minY + 0.69243 * group.height))
      bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.84953 * group.width, group.minY + 0.76400 * group.height), controlPoint1: CGPointMake(group.minX + 0.86442 * group.width, group.minY + 0.73431 * group.height), controlPoint2: CGPointMake(group.minX + 0.85853 * group.width, group.minY + 0.75272 * group.height))
      bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.83392 * group.width, group.minY + 0.81053 * group.height), controlPoint1: CGPointMake(group.minX + 0.83828 * group.width, group.minY + 0.77803 * group.height), controlPoint2: CGPointMake(group.minX + 0.83392 * group.width, group.minY + 0.79436 * group.height))
      bezier2Path.addLineToPoint(CGPointMake(group.minX + 0.83392 * group.width, group.minY + 0.94074 * group.height))
      bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.91694 * group.width, group.minY + 1.00000 * group.height), controlPoint1: CGPointMake(group.minX + 0.83392 * group.width, group.minY + 0.97347 * group.height), controlPoint2: CGPointMake(group.minX + 0.87108 * group.width, group.minY + 1.00000 * group.height))
      bezier2Path.addLineToPoint(CGPointMake(group.minX + 0.91694 * group.width, group.minY + 1.00000 * group.height))
      bezier2Path.addLineToPoint(CGPointMake(group.minX + 0.91694 * group.width, group.minY + 1.00000 * group.height))
      bezier2Path.addCurveToPoint(CGPointMake(group.minX + 1.00000 * group.width, group.minY + 0.94074 * group.height), controlPoint1: CGPointMake(group.minX + 0.96281 * group.width, group.minY + 1.00000 * group.height), controlPoint2: CGPointMake(group.minX + 1.00000 * group.width, group.minY + 0.97347 * group.height))
      bezier2Path.addLineToPoint(CGPointMake(group.minX + 1.00000 * group.width, group.minY + 0.81053 * group.height))
      bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.98439 * group.width, group.minY + 0.76400 * group.height), controlPoint1: CGPointMake(group.minX + 1.00000 * group.width, group.minY + 0.79436 * group.height), controlPoint2: CGPointMake(group.minX + 0.99564 * group.width, group.minY + 0.77803 * group.height))
      bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.96950 * group.width, group.minY + 0.71336 * group.height), controlPoint1: CGPointMake(group.minX + 0.97539 * group.width, group.minY + 0.75272 * group.height), controlPoint2: CGPointMake(group.minX + 0.96950 * group.width, group.minY + 0.73431 * group.height))
      bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.98439 * group.width, group.minY + 0.66274 * group.height), controlPoint1: CGPointMake(group.minX + 0.96950 * group.width, group.minY + 0.69243 * group.height), controlPoint2: CGPointMake(group.minX + 0.97539 * group.width, group.minY + 0.67401 * group.height))
      bezier2Path.addCurveToPoint(CGPointMake(group.minX + 1.00000 * group.width, group.minY + 0.61620 * group.height), controlPoint1: CGPointMake(group.minX + 0.99564 * group.width, group.minY + 0.64870 * group.height), controlPoint2: CGPointMake(group.minX + 1.00000 * group.width, group.minY + 0.63237 * group.height))
      bezier2Path.closePath()
      primaryColor.setFill()
      bezier2Path.fill()
      
      CGContextSaveGState(context)
      CGContextSetAlpha(context, 0.4)
      CGContextBeginTransparencyLayer(context, nil)
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(group.minX + 0.50000 * group.width, group.minY + 0.51744 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.48841 * group.width, group.minY + 0.51708 * group.height), controlPoint1: CGPointMake(group.minX + 0.49608 * group.width, group.minY + 0.51744 * group.height), controlPoint2: CGPointMake(group.minX + 0.49230 * group.width, group.minY + 0.51715 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.66666 * group.width, group.minY + 0.34483 * group.height), controlPoint1: CGPointMake(group.minX + 0.59353 * group.width, group.minY + 0.48709 * group.height), controlPoint2: CGPointMake(group.minX + 0.66666 * group.width, group.minY + 0.42133 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.36111 * group.width, group.minY + 0.15518 * group.height), controlPoint1: CGPointMake(group.minX + 0.66666 * group.width, group.minY + 0.24007 * group.height), controlPoint2: CGPointMake(group.minX + 0.52986 * group.width, group.minY + 0.15518 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.17613 * group.width, group.minY + 0.19411 * group.height), controlPoint1: CGPointMake(group.minX + 0.29150 * group.width, group.minY + 0.15518 * group.height), controlPoint2: CGPointMake(group.minX + 0.22752 * group.width, group.minY + 0.16978 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.50000 * group.width, group.minY + 0.06876 * group.height), controlPoint1: CGPointMake(group.minX + 0.23522 * group.width, group.minY + 0.11998 * group.height), controlPoint2: CGPointMake(group.minX + 0.35800 * group.width, group.minY + 0.06876 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.86144 * group.width, group.minY + 0.29311 * group.height), controlPoint1: CGPointMake(group.minX + 0.69930 * group.width, group.minY + 0.06876 * group.height), controlPoint2: CGPointMake(group.minX + 0.86144 * group.width, group.minY + 0.16940 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.50000 * group.width, group.minY + 0.51744 * group.height), controlPoint1: CGPointMake(group.minX + 0.86144 * group.width, group.minY + 0.41680 * group.height), controlPoint2: CGPointMake(group.minX + 0.69930 * group.width, group.minY + 0.51744 * group.height))
      bezier3Path.closePath()
      bezier3Path.moveToPoint(CGPointMake(group.minX + 0.17286 * group.width, group.minY + 0.34483 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.36111 * group.width, group.minY + 0.22799 * group.height), controlPoint1: CGPointMake(group.minX + 0.17286 * group.width, group.minY + 0.28040 * group.height), controlPoint2: CGPointMake(group.minX + 0.25730 * group.width, group.minY + 0.22799 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.54936 * group.width, group.minY + 0.34483 * group.height), controlPoint1: CGPointMake(group.minX + 0.46491 * group.width, group.minY + 0.22799 * group.height), controlPoint2: CGPointMake(group.minX + 0.54936 * group.width, group.minY + 0.28040 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.36111 * group.width, group.minY + 0.46166 * group.height), controlPoint1: CGPointMake(group.minX + 0.54936 * group.width, group.minY + 0.40925 * group.height), controlPoint2: CGPointMake(group.minX + 0.46491 * group.width, group.minY + 0.46166 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.17286 * group.width, group.minY + 0.34483 * group.height), controlPoint1: CGPointMake(group.minX + 0.25730 * group.width, group.minY + 0.46166 * group.height), controlPoint2: CGPointMake(group.minX + 0.17286 * group.width, group.minY + 0.40925 * group.height))
      bezier3Path.closePath()
      bezier3Path.moveToPoint(CGPointMake(group.minX + 0.97075 * group.width, group.minY + 0.31114 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.97222 * group.width, group.minY + 0.29311 * group.height), controlPoint1: CGPointMake(group.minX + 0.97133 * group.width, group.minY + 0.30514 * group.height), controlPoint2: CGPointMake(group.minX + 0.97222 * group.width, group.minY + 0.29919 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.50000 * group.width, group.minY + 0.00000 * group.height), controlPoint1: CGPointMake(group.minX + 0.97222 * group.width, group.minY + 0.13123 * group.height), controlPoint2: CGPointMake(group.minX + 0.76080 * group.width, group.minY + 0.00000 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.02777 * group.width, group.minY + 0.29311 * group.height), controlPoint1: CGPointMake(group.minX + 0.23919 * group.width, group.minY + 0.00000 * group.height), controlPoint2: CGPointMake(group.minX + 0.02777 * group.width, group.minY + 0.13123 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.02924 * group.width, group.minY + 0.31114 * group.height), controlPoint1: CGPointMake(group.minX + 0.02777 * group.width, group.minY + 0.29919 * group.height), controlPoint2: CGPointMake(group.minX + 0.02866 * group.width, group.minY + 0.30514 * group.height))
      bezier3Path.addLineToPoint(CGPointMake(group.minX + 0.02777 * group.width, group.minY + 0.31114 * group.height))
      bezier3Path.addLineToPoint(CGPointMake(group.minX + 0.02777 * group.width, group.minY + 0.62070 * group.height))
      bezier3Path.addLineToPoint(CGPointMake(group.minX + 0.13888 * group.width, group.minY + 0.62070 * group.height))
      bezier3Path.addLineToPoint(CGPointMake(group.minX + 0.13888 * group.width, group.minY + 0.48178 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.50000 * group.width, group.minY + 0.58622 * group.height), controlPoint1: CGPointMake(group.minX + 0.22550 * group.width, group.minY + 0.54560 * group.height), controlPoint2: CGPointMake(group.minX + 0.35505 * group.width, group.minY + 0.58622 * group.height))
      bezier3Path.addCurveToPoint(CGPointMake(group.minX + 0.86111 * group.width, group.minY + 0.48178 * group.height), controlPoint1: CGPointMake(group.minX + 0.64494 * group.width, group.minY + 0.58622 * group.height), controlPoint2: CGPointMake(group.minX + 0.77450 * group.width, group.minY + 0.54560 * group.height))
      bezier3Path.addLineToPoint(CGPointMake(group.minX + 0.86111 * group.width, group.minY + 0.62286 * group.height))
      bezier3Path.addLineToPoint(CGPointMake(group.minX + 0.97222 * group.width, group.minY + 0.62286 * group.height))
      bezier3Path.addLineToPoint(CGPointMake(group.minX + 0.97222 * group.width, group.minY + 0.31114 * group.height))
      bezier3Path.addLineToPoint(CGPointMake(group.minX + 0.97075 * group.width, group.minY + 0.31114 * group.height))
      bezier3Path.closePath()
      primaryColor.setFill()
      bezier3Path.fill()
      
      
      CGContextEndTransparencyLayer(context)
      CGContextRestoreGState(context)
   }
}
