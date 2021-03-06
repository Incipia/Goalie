//
//  PlantAccessoryKit.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class PlantAccessoryKit: AccessoryItemDrawing
{
   static func drawWithFrame(_ frame: CGRect, priority: TaskPriority)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Color Declarations
      let primaryColor = UIColor(priority: priority, headComponent: .background)
      
      
      //// Subframes
      let group: CGRect = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: frame.height)
      
      
      //// Group
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.move(to: CGPoint(x: group.minX + 0.07692 * group.width, y: group.minY + 0.62963 * group.height))
      bezierPath.addCurve(to: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.66666 * group.height), controlPoint1: CGPoint(x: group.minX + 0.03442 * group.width, y: group.minY + 0.62963 * group.height), controlPoint2: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.64620 * group.height))
      bezierPath.addLine(to: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.74839 * group.height))
      bezierPath.addCurve(to: CGPoint(x: group.minX + 0.50000 * group.width, y: group.minY + 1.00000 * group.height), controlPoint1: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.88678 * group.height), controlPoint2: CGPoint(x: group.minX + 0.22500 * group.width, y: group.minY + 1.00000 * group.height))
      bezierPath.addLine(to: CGPoint(x: group.minX + 0.50000 * group.width, y: group.minY + 1.00000 * group.height))
      bezierPath.addCurve(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.74839 * group.height), controlPoint1: CGPoint(x: group.minX + 0.77500 * group.width, y: group.minY + 1.00000 * group.height), controlPoint2: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.88678 * group.height))
      bezierPath.addLine(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.66666 * group.height))
      bezierPath.addCurve(to: CGPoint(x: group.minX + 0.92308 * group.width, y: group.minY + 0.62963 * group.height), controlPoint1: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.64620 * group.height), controlPoint2: CGPoint(x: group.minX + 0.96558 * group.width, y: group.minY + 0.62963 * group.height))
      bezierPath.addLine(to: CGPoint(x: group.minX + 0.07692 * group.width, y: group.minY + 0.62963 * group.height))
      bezierPath.close()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      //// Group 2
      context!.saveGState()
      context!.setAlpha(0.4)
      context!.beginTransparencyLayer(auxiliaryInfo: nil)
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.move(to: CGPoint(x: group.minX + 0.76926 * group.width, y: group.minY + 0.45626 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.57695 * group.width, y: group.minY + 0.33552 * group.height), controlPoint1: CGPoint(x: group.minX + 0.76926 * group.width, y: group.minY + 0.39919 * group.height), controlPoint2: CGPoint(x: group.minX + 0.68815 * group.width, y: group.minY + 0.35102 * group.height))
      bezier2Path.addLine(to: CGPoint(x: group.minX + 0.57695 * group.width, y: group.minY + 0.25059 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.69234 * group.width, y: group.minY + 0.16819 * group.height), controlPoint1: CGPoint(x: group.minX + 0.64480 * group.width, y: group.minY + 0.23671 * group.height), controlPoint2: CGPoint(x: group.minX + 0.69234 * group.width, y: group.minY + 0.20508 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.57695 * group.width, y: group.minY + 0.08576 * group.height), controlPoint1: CGPoint(x: group.minX + 0.69234 * group.width, y: group.minY + 0.13128 * group.height), controlPoint2: CGPoint(x: group.minX + 0.64480 * group.width, y: group.minY + 0.09967 * group.height))
      bezier2Path.addLine(to: CGPoint(x: group.minX + 0.57695 * group.width, y: group.minY + 0.03600 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.50003 * group.width, y: group.minY + 0.00000 * group.height), controlPoint1: CGPoint(x: group.minX + 0.57695 * group.width, y: group.minY + 0.01620 * group.height), controlPoint2: CGPoint(x: group.minX + 0.54234 * group.width, y: group.minY + 0.00000 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.42311 * group.width, y: group.minY + 0.03600 * group.height), controlPoint1: CGPoint(x: group.minX + 0.45772 * group.width, y: group.minY + 0.00000 * group.height), controlPoint2: CGPoint(x: group.minX + 0.42311 * group.width, y: group.minY + 0.01620 * group.height))
      bezier2Path.addLine(to: CGPoint(x: group.minX + 0.42311 * group.width, y: group.minY + 0.08576 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.30772 * group.width, y: group.minY + 0.16819 * group.height), controlPoint1: CGPoint(x: group.minX + 0.35526 * group.width, y: group.minY + 0.09967 * group.height), controlPoint2: CGPoint(x: group.minX + 0.30772 * group.width, y: group.minY + 0.13128 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.42311 * group.width, y: group.minY + 0.25059 * group.height), controlPoint1: CGPoint(x: group.minX + 0.30772 * group.width, y: group.minY + 0.20508 * group.height), controlPoint2: CGPoint(x: group.minX + 0.35526 * group.width, y: group.minY + 0.23671 * group.height))
      bezier2Path.addLine(to: CGPoint(x: group.minX + 0.42311 * group.width, y: group.minY + 0.33552 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.23080 * group.width, y: group.minY + 0.45626 * group.height), controlPoint1: CGPoint(x: group.minX + 0.31192 * group.width, y: group.minY + 0.35102 * group.height), controlPoint2: CGPoint(x: group.minX + 0.23080 * group.width, y: group.minY + 0.39919 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.42311 * group.width, y: group.minY + 0.57700 * group.height), controlPoint1: CGPoint(x: group.minX + 0.23080 * group.width, y: group.minY + 0.51334 * group.height), controlPoint2: CGPoint(x: group.minX + 0.31192 * group.width, y: group.minY + 0.56150 * group.height))
      bezier2Path.addLine(to: CGPoint(x: group.minX + 0.42311 * group.width, y: group.minY + 0.67900 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.50003 * group.width, y: group.minY + 0.64815 * group.height), controlPoint1: CGPoint(x: group.minX + 0.42311 * group.width, y: group.minY + 0.69882 * group.height), controlPoint2: CGPoint(x: group.minX + 0.45772 * group.width, y: group.minY + 0.64815 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.57695 * group.width, y: group.minY + 0.67900 * group.height), controlPoint1: CGPoint(x: group.minX + 0.54234 * group.width, y: group.minY + 0.64815 * group.height), controlPoint2: CGPoint(x: group.minX + 0.57695 * group.width, y: group.minY + 0.69882 * group.height))
      bezier2Path.addLine(to: CGPoint(x: group.minX + 0.57695 * group.width, y: group.minY + 0.57700 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.76926 * group.width, y: group.minY + 0.45626 * group.height), controlPoint1: CGPoint(x: group.minX + 0.68815 * group.width, y: group.minY + 0.56150 * group.height), controlPoint2: CGPoint(x: group.minX + 0.76926 * group.width, y: group.minY + 0.51334 * group.height))
      bezier2Path.close()
      primaryColor.setFill()
      bezier2Path.fill()
      
      
      context!.endTransparencyLayer()
      context!.restoreGState()
   }
}
