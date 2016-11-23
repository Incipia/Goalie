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
   static func drawWithFrame(_ frame: CGRect, priority: TaskPriority)
}

class BricksAccessoryKit: AccessoryItemDrawing
{
   static func drawWithFrame(_ frame: CGRect, priority: TaskPriority)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Color Declarations
      let primaryColor = UIColor(priority: priority, headComponent: .background)
      
      //// Subframes
      let bricksblueGroup: CGRect = CGRect(x: frame.minX, y: frame.minY, width: frame.width - 0.13, height: frame.height)
      
      
      //// bricks-blue Group
      //// Group 2
      context!.saveGState()
      context!.setAlpha(0.4)
      context!.beginTransparencyLayer(auxiliaryInfo: nil)
      
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.move(to: CGPoint(x: bricksblueGroup.minX + 0.34869 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.65000 * bricksblueGroup.height))
      bezierPath.addLine(to: CGPoint(x: bricksblueGroup.minX + 0.03170 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.65000 * bricksblueGroup.height))
      bezierPath.addCurve(to: CGPoint(x: bricksblueGroup.minX + 0.00000 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.58750 * bricksblueGroup.height), controlPoint1: CGPoint(x: bricksblueGroup.minX + 0.01419 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.65000 * bricksblueGroup.height), controlPoint2: CGPoint(x: bricksblueGroup.minX + 0.00000 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.62203 * bricksblueGroup.height))
      bezierPath.addLine(to: CGPoint(x: bricksblueGroup.minX + 0.00000 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.41250 * bricksblueGroup.height))
      bezierPath.addCurve(to: CGPoint(x: bricksblueGroup.minX + 0.03170 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.35000 * bricksblueGroup.height), controlPoint1: CGPoint(x: bricksblueGroup.minX + 0.00000 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.37798 * bricksblueGroup.height), controlPoint2: CGPoint(x: bricksblueGroup.minX + 0.01419 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.35000 * bricksblueGroup.height))
      bezierPath.addLine(to: CGPoint(x: bricksblueGroup.minX + 0.34869 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.35000 * bricksblueGroup.height))
      bezierPath.addCurve(to: CGPoint(x: bricksblueGroup.minX + 0.38039 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.41250 * bricksblueGroup.height), controlPoint1: CGPoint(x: bricksblueGroup.minX + 0.36620 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.35000 * bricksblueGroup.height), controlPoint2: CGPoint(x: bricksblueGroup.minX + 0.38039 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.37798 * bricksblueGroup.height))
      bezierPath.addLine(to: CGPoint(x: bricksblueGroup.minX + 0.38039 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.58750 * bricksblueGroup.height))
      bezierPath.addCurve(to: CGPoint(x: bricksblueGroup.minX + 0.34869 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.65000 * bricksblueGroup.height), controlPoint1: CGPoint(x: bricksblueGroup.minX + 0.38039 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.62203 * bricksblueGroup.height), controlPoint2: CGPoint(x: bricksblueGroup.minX + 0.36620 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.65000 * bricksblueGroup.height))
      bezierPath.close()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      context!.endTransparencyLayer()
      context!.restoreGState()
      
      
      //// Rectangle Drawing
      let rectanglePath = UIBezierPath(roundedRect: CGRect(x: bricksblueGroup.minX + floor(bricksblueGroup.width * 0.41146 + 0.05) + 0.45, y: bricksblueGroup.minY + floor(bricksblueGroup.height * 0.35000 + 0.5), width: floor(bricksblueGroup.width * 0.79185 + 0.05) - floor(bricksblueGroup.width * 0.41146 + 0.05), height: floor(bricksblueGroup.height * 0.65000 + 0.5) - floor(bricksblueGroup.height * 0.35000 + 0.5)), cornerRadius: 2.6)
      primaryColor.setFill()
      rectanglePath.fill()
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.move(to: CGPoint(x: bricksblueGroup.minX + 0.55706 * bricksblueGroup.width, y: bricksblueGroup.minY + 1.00000 * bricksblueGroup.height))
      bezier2Path.addLine(to: CGPoint(x: bricksblueGroup.minX + 0.24007 * bricksblueGroup.width, y: bricksblueGroup.minY + 1.00000 * bricksblueGroup.height))
      bezier2Path.addCurve(to: CGPoint(x: bricksblueGroup.minX + 0.20837 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.93750 * bricksblueGroup.height), controlPoint1: CGPoint(x: bricksblueGroup.minX + 0.22255 * bricksblueGroup.width, y: bricksblueGroup.minY + 1.00000 * bricksblueGroup.height), controlPoint2: CGPoint(x: bricksblueGroup.minX + 0.20837 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.97203 * bricksblueGroup.height))
      bezier2Path.addLine(to: CGPoint(x: bricksblueGroup.minX + 0.20837 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.76250 * bricksblueGroup.height))
      bezier2Path.addCurve(to: CGPoint(x: bricksblueGroup.minX + 0.24007 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.70000 * bricksblueGroup.height), controlPoint1: CGPoint(x: bricksblueGroup.minX + 0.20837 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.72798 * bricksblueGroup.height), controlPoint2: CGPoint(x: bricksblueGroup.minX + 0.22255 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.70000 * bricksblueGroup.height))
      bezier2Path.addLine(to: CGPoint(x: bricksblueGroup.minX + 0.55706 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.70000 * bricksblueGroup.height))
      bezier2Path.addCurve(to: CGPoint(x: bricksblueGroup.minX + 0.58876 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.76250 * bricksblueGroup.height), controlPoint1: CGPoint(x: bricksblueGroup.minX + 0.57457 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.70000 * bricksblueGroup.height), controlPoint2: CGPoint(x: bricksblueGroup.minX + 0.58876 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.72798 * bricksblueGroup.height))
      bezier2Path.addLine(to: CGPoint(x: bricksblueGroup.minX + 0.58876 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.93750 * bricksblueGroup.height))
      bezier2Path.addCurve(to: CGPoint(x: bricksblueGroup.minX + 0.55706 * bricksblueGroup.width, y: bricksblueGroup.minY + 1.00000 * bricksblueGroup.height), controlPoint1: CGPoint(x: bricksblueGroup.minX + 0.58876 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.97203 * bricksblueGroup.height), controlPoint2: CGPoint(x: bricksblueGroup.minX + 0.57457 * bricksblueGroup.width, y: bricksblueGroup.minY + 1.00000 * bricksblueGroup.height))
      bezier2Path.close()
      primaryColor.setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.move(to: CGPoint(x: bricksblueGroup.minX + 0.96830 * bricksblueGroup.width, y: bricksblueGroup.minY + 1.00000 * bricksblueGroup.height))
      bezier3Path.addLine(to: CGPoint(x: bricksblueGroup.minX + 0.65131 * bricksblueGroup.width, y: bricksblueGroup.minY + 1.00000 * bricksblueGroup.height))
      bezier3Path.addCurve(to: CGPoint(x: bricksblueGroup.minX + 0.61961 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.93750 * bricksblueGroup.height), controlPoint1: CGPoint(x: bricksblueGroup.minX + 0.63380 * bricksblueGroup.width, y: bricksblueGroup.minY + 1.00000 * bricksblueGroup.height), controlPoint2: CGPoint(x: bricksblueGroup.minX + 0.61961 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.97203 * bricksblueGroup.height))
      bezier3Path.addLine(to: CGPoint(x: bricksblueGroup.minX + 0.61961 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.76250 * bricksblueGroup.height))
      bezier3Path.addCurve(to: CGPoint(x: bricksblueGroup.minX + 0.65131 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.70000 * bricksblueGroup.height), controlPoint1: CGPoint(x: bricksblueGroup.minX + 0.61961 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.72798 * bricksblueGroup.height), controlPoint2: CGPoint(x: bricksblueGroup.minX + 0.63380 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.70000 * bricksblueGroup.height))
      bezier3Path.addLine(to: CGPoint(x: bricksblueGroup.minX + 0.96830 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.70000 * bricksblueGroup.height))
      bezier3Path.addCurve(to: CGPoint(x: bricksblueGroup.minX + 1.00000 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.76250 * bricksblueGroup.height), controlPoint1: CGPoint(x: bricksblueGroup.minX + 0.98581 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.70000 * bricksblueGroup.height), controlPoint2: CGPoint(x: bricksblueGroup.minX + 1.00000 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.72798 * bricksblueGroup.height))
      bezier3Path.addLine(to: CGPoint(x: bricksblueGroup.minX + 1.00000 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.93750 * bricksblueGroup.height))
      bezier3Path.addCurve(to: CGPoint(x: bricksblueGroup.minX + 0.96830 * bricksblueGroup.width, y: bricksblueGroup.minY + 1.00000 * bricksblueGroup.height), controlPoint1: CGPoint(x: bricksblueGroup.minX + 1.00000 * bricksblueGroup.width, y: bricksblueGroup.minY + 0.97203 * bricksblueGroup.height), controlPoint2: CGPoint(x: bricksblueGroup.minX + 0.98581 * bricksblueGroup.width, y: bricksblueGroup.minY + 1.00000 * bricksblueGroup.height))
      bezier3Path.close()
      primaryColor.setFill()
      bezier3Path.fill()
      
      
      //// Rectangle 2 Drawing
      let rectangle2Path = UIBezierPath(roundedRect: CGRect(x: bricksblueGroup.minX + floor(bricksblueGroup.width * 0.20858 + 0.05) + 0.45, y: bricksblueGroup.minY + floor(bricksblueGroup.height * 0.00000 + 0.5), width: floor(bricksblueGroup.width * 0.58897 + 0.05) - floor(bricksblueGroup.width * 0.20858 + 0.05), height: floor(bricksblueGroup.height * 0.30000 + 0.5) - floor(bricksblueGroup.height * 0.00000 + 0.5)), cornerRadius: 2.6)
      primaryColor.setFill()
      rectangle2Path.fill()
   }
}
