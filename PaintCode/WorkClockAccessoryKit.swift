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
   static func drawWithFrame(_ frame: CGRect, priority: TaskPriority)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Color Declarations
      let primaryColor = UIColor(priority: priority, headComponent: .background)
      
      
      //// Subframes
      let group2: CGRect = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: frame.height)
      
      
      //// Group 2
      //// Group
      context!.saveGState()
      context!.setAlpha(0.4)
      context!.beginTransparencyLayer(auxiliaryInfo: nil)
      
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.move(to: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.50000 * group2.height))
      bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.50000 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.77614 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.77614 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.50000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.22386 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.77614 * group2.height))
      bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.50000 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.22386 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.22386 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezierPath.addCurve(to: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.50000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.77614 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.22386 * group2.height))
      bezierPath.close()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      context!.endTransparencyLayer()
      context!.restoreGState()
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.move(to: CGPoint(x: group2.minX + 0.62713 * group2.width, y: group2.minY + 0.67301 * group2.height))
      bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.61127 * group2.width, y: group2.minY + 0.66737 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.62011 * group2.width, y: group2.minY + 0.67301 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.61770 * group2.width, y: group2.minY + 0.67120 * group2.height))
      bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.44404 * group2.width, y: group2.minY + 0.56556 * group2.height))
      bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.44404 * group2.width, y: group2.minY + 0.34004 * group2.height))
      bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.47975 * group2.width, y: group2.minY + 0.30051 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.44404 * group2.width, y: group2.minY + 0.31820 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.45763 * group2.width, y: group2.minY + 0.30051 * group2.height))
      bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.51546 * group2.width, y: group2.minY + 0.34004 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.50185 * group2.width, y: group2.minY + 0.30051 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.51546 * group2.width, y: group2.minY + 0.31820 * group2.height))
      bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.51546 * group2.width, y: group2.minY + 0.52085 * group2.height))
      bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.64815 * group2.width, y: group2.minY + 0.59963 * group2.height))
      bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.66168 * group2.width, y: group2.minY + 0.65382 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.66711 * group2.width, y: group2.minY + 0.61085 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.67306 * group2.width, y: group2.minY + 0.63511 * group2.height))
      bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.62713 * group2.width, y: group2.minY + 0.67301 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.65418 * group2.width, y: group2.minY + 0.66618 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.64073 * group2.width, y: group2.minY + 0.67301 * group2.height))
      bezier2Path.close()
      primaryColor.setFill()
      bezier2Path.fill()
   }
}
