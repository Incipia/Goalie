//
//  ClockAccessoryKit.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class ClockAccessoryKit: AccessoryItemDrawing
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
      bezierPath.moveToPoint(CGPointMake(group2.minX + 0.75263 * group2.width, group2.minY + 0.84607 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.90115 * group2.width, group2.minY + 0.55557 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.83980 * group2.width, group2.minY + 0.77677 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.90115 * group2.width, group2.minY + 0.67239 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.55809 * group2.width, group2.minY + 0.18064 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.90115 * group2.width, group2.minY + 0.36200 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.74856 * group2.width, group2.minY + 0.20266 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.55809 * group2.width, group2.minY + 0.11605 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.57554 * group2.width, group2.minY + 0.06668 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.55809 * group2.width, group2.minY + 0.10384 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.57554 * group2.width, group2.minY + 0.08634 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.50287 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.57554 * group2.width, group2.minY + 0.02986 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.54140 * group2.width, group2.minY + 0.00000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.43635 * group2.width, group2.minY + 0.06668 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.46433 * group2.width, group2.minY + 0.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.43635 * group2.width, group2.minY + 0.02986 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.46285 * group2.width, group2.minY + 0.11605 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.43635 * group2.width, group2.minY + 0.08634 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.43904 * group2.width, group2.minY + 0.10384 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.46285 * group2.width, group2.minY + 0.18064 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.10928 * group2.width, group2.minY + 0.55557 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.24857 * group2.width, group2.minY + 0.20266 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.10928 * group2.width, group2.minY + 0.36200 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.24514 * group2.width, group2.minY + 0.84216 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.10928 * group2.width, group2.minY + 0.67030 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.16066 * group2.width, group2.minY + 0.77286 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.15716 * group2.width, group2.minY + 0.92511 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.15657 * group2.width, group2.minY + 0.98716 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.13921 * group2.width, group2.minY + 0.94223 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.13862 * group2.width, group2.minY + 0.97002 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.18874 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.16555 * group2.width, group2.minY + 0.99573 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.17700 * group2.width, group2.minY + 1.00000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.22107 * group2.width, group2.minY + 0.98716 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.20050 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.21209 * group2.width, group2.minY + 0.99573 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.32064 * group2.width, group2.minY + 0.89193 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.49999 * group2.width, group2.minY + 0.93336 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.37452 * group2.width, group2.minY + 0.91823 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.43535 * group2.width, group2.minY + 0.93336 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.67356 * group2.width, group2.minY + 0.89461 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.56237 * group2.width, group2.minY + 0.93336 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.62111 * group2.width, group2.minY + 0.91918 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.77042 * group2.width, group2.minY + 0.98716 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.80289 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.77939 * group2.width, group2.minY + 0.99573 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.79113 * group2.width, group2.minY + 1.00000 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.83535 * group2.width, group2.minY + 0.98716 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.81463 * group2.width, group2.minY + 1.00000 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.82637 * group2.width, group2.minY + 0.99573 * group2.height))
      bezierPath.addCurveToPoint(CGPointMake(group2.minX + 0.83535 * group2.width, group2.minY + 0.92511 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.85330 * group2.width, group2.minY + 0.97002 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.85330 * group2.width, group2.minY + 0.94223 * group2.height))
      bezierPath.addLineToPoint(CGPointMake(group2.minX + 0.75263 * group2.width, group2.minY + 0.84607 * group2.height))
      bezierPath.closePath()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      CGContextEndTransparencyLayer(context!)
      CGContextRestoreGState(context!)
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(group2.minX + 0.30096 * group2.width, group2.minY + 0.12630 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.26984 * group2.width, group2.minY + 0.09476 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.29701 * group2.width, group2.minY + 0.11115 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.28536 * group2.width, group2.minY + 0.09935 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.07179 * group2.width, group2.minY + 0.15749 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.20846 * group2.width, group2.minY + 0.07662 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.13067 * group2.width, group2.minY + 0.10124 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.00615 * group2.width, group2.minY + 0.34667 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.01294 * group2.width, group2.minY + 0.21371 * group2.height), controlPoint2: CGPointMake(group2.minX + -0.01282 * group2.width, group2.minY + 0.28799 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.03913 * group2.width, group2.minY + 0.37642 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.01096 * group2.width, group2.minY + 0.36153 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.02330 * group2.width, group2.minY + 0.37267 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.05058 * group2.width, group2.minY + 0.37778 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.04294 * group2.width, group2.minY + 0.37733 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.04677 * group2.width, group2.minY + 0.37778 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.08337 * group2.width, group2.minY + 0.36474 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.06272 * group2.width, group2.minY + 0.37778 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.07446 * group2.width, group2.minY + 0.37321 * group2.height))
      bezier2Path.addLineToPoint(CGPointMake(group2.minX + 0.28870 * group2.width, group2.minY + 0.16851 * group2.height))
      bezier2Path.addCurveToPoint(CGPointMake(group2.minX + 0.30096 * group2.width, group2.minY + 0.12630 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.30034 * group2.width, group2.minY + 0.15737 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.30491 * group2.width, group2.minY + 0.14160 * group2.height))
      bezier2Path.closePath()
      primaryColor.setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(group2.minX + 0.69904 * group2.width, group2.minY + 0.12630 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.73016 * group2.width, group2.minY + 0.09476 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.70299 * group2.width, group2.minY + 0.11115 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.71464 * group2.width, group2.minY + 0.09935 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.92821 * group2.width, group2.minY + 0.15749 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.79154 * group2.width, group2.minY + 0.07662 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.86933 * group2.width, group2.minY + 0.10124 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.99385 * group2.width, group2.minY + 0.34667 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.98706 * group2.width, group2.minY + 0.21371 * group2.height), controlPoint2: CGPointMake(group2.minX + 1.01282 * group2.width, group2.minY + 0.28799 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.96087 * group2.width, group2.minY + 0.37642 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.98904 * group2.width, group2.minY + 0.36153 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.97670 * group2.width, group2.minY + 0.37267 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.94942 * group2.width, group2.minY + 0.37778 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.95706 * group2.width, group2.minY + 0.37733 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.95323 * group2.width, group2.minY + 0.37778 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.91663 * group2.width, group2.minY + 0.36474 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.93728 * group2.width, group2.minY + 0.37778 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.92554 * group2.width, group2.minY + 0.37321 * group2.height))
      bezier3Path.addLineToPoint(CGPointMake(group2.minX + 0.71130 * group2.width, group2.minY + 0.16851 * group2.height))
      bezier3Path.addCurveToPoint(CGPointMake(group2.minX + 0.69904 * group2.width, group2.minY + 0.12630 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.69966 * group2.width, group2.minY + 0.15737 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.69509 * group2.width, group2.minY + 0.14160 * group2.height))
      bezier3Path.closePath()
      primaryColor.setFill()
      bezier3Path.fill()
      
      
      //// Bezier 4 Drawing
      let bezier4Path = UIBezierPath()
      bezier4Path.moveToPoint(CGPointMake(group2.minX + 0.64595 * group2.width, group2.minY + 0.73334 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.63009 * group2.width, group2.minY + 0.72795 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.63892 * group2.width, group2.minY + 0.73334 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.63652 * group2.width, group2.minY + 0.73161 * group2.height))
      bezier4Path.addLineToPoint(CGPointMake(group2.minX + 0.46286 * group2.width, group2.minY + 0.63077 * group2.height))
      bezier4Path.addLineToPoint(CGPointMake(group2.minX + 0.46286 * group2.width, group2.minY + 0.41550 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.49857 * group2.width, group2.minY + 0.37777 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.46286 * group2.width, group2.minY + 0.39466 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.47645 * group2.width, group2.minY + 0.37777 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.53428 * group2.width, group2.minY + 0.41550 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.52066 * group2.width, group2.minY + 0.37777 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.53428 * group2.width, group2.minY + 0.39466 * group2.height))
      bezier4Path.addLineToPoint(CGPointMake(group2.minX + 0.53428 * group2.width, group2.minY + 0.58809 * group2.height))
      bezier4Path.addLineToPoint(CGPointMake(group2.minX + 0.66697 * group2.width, group2.minY + 0.66329 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.68049 * group2.width, group2.minY + 0.71502 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.68592 * group2.width, group2.minY + 0.67400 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.69188 * group2.width, group2.minY + 0.69716 * group2.height))
      bezier4Path.addCurveToPoint(CGPointMake(group2.minX + 0.64595 * group2.width, group2.minY + 0.73334 * group2.height), controlPoint1: CGPointMake(group2.minX + 0.67300 * group2.width, group2.minY + 0.72682 * group2.height), controlPoint2: CGPointMake(group2.minX + 0.65954 * group2.width, group2.minY + 0.73334 * group2.height))
      bezier4Path.closePath()
      primaryColor.setFill()
      bezier4Path.fill()
   }
}
