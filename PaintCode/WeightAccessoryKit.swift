//
//  WeightAccessoryKit.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class WeightAccessoryKit: AccessoryItemDrawing
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
      bezierPath.move(to: CGPoint(x: group2.minX + 0.95312 * group2.width, y: group2.minY + 0.60000 * group2.height))
      bezierPath.addLine(to: CGPoint(x: group2.minX + 0.04688 * group2.width, y: group2.minY + 0.60000 * group2.height))
      bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.50000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.02109 * group2.width, y: group2.minY + 0.60000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.55500 * group2.height))
      bezierPath.addLine(to: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.50000 * group2.height))
      bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.04688 * group2.width, y: group2.minY + 0.40000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.44500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.02109 * group2.width, y: group2.minY + 0.40000 * group2.height))
      bezierPath.addLine(to: CGPoint(x: group2.minX + 0.95312 * group2.width, y: group2.minY + 0.40000 * group2.height))
      bezierPath.addCurve(to: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.50000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.97891 * group2.width, y: group2.minY + 0.40000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.44500 * group2.height))
      bezierPath.addLine(to: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.50000 * group2.height))
      bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.95312 * group2.width, y: group2.minY + 0.60000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.55500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.97891 * group2.width, y: group2.minY + 0.60000 * group2.height))
      bezierPath.close()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      context!.endTransparencyLayer()
      context!.restoreGState()
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.move(to: CGPoint(x: group2.minX + 0.12500 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.12500 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.07812 * group2.width, y: group2.minY + 0.90000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.09922 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.07812 * group2.width, y: group2.minY + 0.95500 * group2.height))
      bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.07812 * group2.width, y: group2.minY + 0.10000 * group2.height))
      bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.12500 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.07812 * group2.width, y: group2.minY + 0.04500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.09922 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.12500 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.17188 * group2.width, y: group2.minY + 0.10000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.15078 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.17188 * group2.width, y: group2.minY + 0.04500 * group2.height))
      bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.17188 * group2.width, y: group2.minY + 0.90000 * group2.height))
      bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.12500 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.17188 * group2.width, y: group2.minY + 0.95500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.15078 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier2Path.close()
      primaryColor.setFill()
      bezier2Path.fill()
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.move(to: CGPoint(x: group2.minX + 0.21875 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier3Path.addLine(to: CGPoint(x: group2.minX + 0.21875 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.17188 * group2.width, y: group2.minY + 0.90000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.19297 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.17188 * group2.width, y: group2.minY + 0.95500 * group2.height))
      bezier3Path.addLine(to: CGPoint(x: group2.minX + 0.17188 * group2.width, y: group2.minY + 0.10000 * group2.height))
      bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.21875 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.17188 * group2.width, y: group2.minY + 0.04500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.19297 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier3Path.addLine(to: CGPoint(x: group2.minX + 0.21875 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.26562 * group2.width, y: group2.minY + 0.10000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.24453 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.26562 * group2.width, y: group2.minY + 0.04500 * group2.height))
      bezier3Path.addLine(to: CGPoint(x: group2.minX + 0.26562 * group2.width, y: group2.minY + 0.90000 * group2.height))
      bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.21875 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.26562 * group2.width, y: group2.minY + 0.95500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.24453 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier3Path.close()
      primaryColor.setFill()
      bezier3Path.fill()
      
      
      //// Bezier 4 Drawing
      let bezier4Path = UIBezierPath()
      bezier4Path.move(to: CGPoint(x: group2.minX + 0.31250 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier4Path.addLine(to: CGPoint(x: group2.minX + 0.31250 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.26562 * group2.width, y: group2.minY + 0.90000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.28672 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.26562 * group2.width, y: group2.minY + 0.95500 * group2.height))
      bezier4Path.addLine(to: CGPoint(x: group2.minX + 0.26562 * group2.width, y: group2.minY + 0.10000 * group2.height))
      bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.31250 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.26562 * group2.width, y: group2.minY + 0.04500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.28672 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier4Path.addLine(to: CGPoint(x: group2.minX + 0.31250 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.35938 * group2.width, y: group2.minY + 0.10000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.33828 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.35938 * group2.width, y: group2.minY + 0.04500 * group2.height))
      bezier4Path.addLine(to: CGPoint(x: group2.minX + 0.35938 * group2.width, y: group2.minY + 0.90000 * group2.height))
      bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.31250 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.35938 * group2.width, y: group2.minY + 0.95500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.33828 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier4Path.close()
      primaryColor.setFill()
      bezier4Path.fill()
      
      
      //// Bezier 5 Drawing
      let bezier5Path = UIBezierPath()
      bezier5Path.move(to: CGPoint(x: group2.minX + 0.87500 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier5Path.addLine(to: CGPoint(x: group2.minX + 0.87500 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier5Path.addCurve(to: CGPoint(x: group2.minX + 0.92188 * group2.width, y: group2.minY + 0.10000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.90078 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.92188 * group2.width, y: group2.minY + 0.04500 * group2.height))
      bezier5Path.addLine(to: CGPoint(x: group2.minX + 0.92188 * group2.width, y: group2.minY + 0.90000 * group2.height))
      bezier5Path.addCurve(to: CGPoint(x: group2.minX + 0.87500 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.92188 * group2.width, y: group2.minY + 0.95500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.90078 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier5Path.addLine(to: CGPoint(x: group2.minX + 0.87500 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier5Path.addCurve(to: CGPoint(x: group2.minX + 0.82812 * group2.width, y: group2.minY + 0.90000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.84922 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.82812 * group2.width, y: group2.minY + 0.95500 * group2.height))
      bezier5Path.addLine(to: CGPoint(x: group2.minX + 0.82812 * group2.width, y: group2.minY + 0.10000 * group2.height))
      bezier5Path.addCurve(to: CGPoint(x: group2.minX + 0.87500 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.82812 * group2.width, y: group2.minY + 0.04500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.84922 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier5Path.close()
      primaryColor.setFill()
      bezier5Path.fill()
      
      
      //// Bezier 6 Drawing
      let bezier6Path = UIBezierPath()
      bezier6Path.move(to: CGPoint(x: group2.minX + 0.78125 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier6Path.addLine(to: CGPoint(x: group2.minX + 0.78125 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier6Path.addCurve(to: CGPoint(x: group2.minX + 0.82812 * group2.width, y: group2.minY + 0.10000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.80703 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.82812 * group2.width, y: group2.minY + 0.04500 * group2.height))
      bezier6Path.addLine(to: CGPoint(x: group2.minX + 0.82812 * group2.width, y: group2.minY + 0.90000 * group2.height))
      bezier6Path.addCurve(to: CGPoint(x: group2.minX + 0.78125 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.82812 * group2.width, y: group2.minY + 0.95500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.80703 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier6Path.addLine(to: CGPoint(x: group2.minX + 0.78125 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier6Path.addCurve(to: CGPoint(x: group2.minX + 0.73438 * group2.width, y: group2.minY + 0.90000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.75547 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.73438 * group2.width, y: group2.minY + 0.95500 * group2.height))
      bezier6Path.addLine(to: CGPoint(x: group2.minX + 0.73438 * group2.width, y: group2.minY + 0.10000 * group2.height))
      bezier6Path.addCurve(to: CGPoint(x: group2.minX + 0.78125 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.73438 * group2.width, y: group2.minY + 0.04500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.75547 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier6Path.close()
      primaryColor.setFill()
      bezier6Path.fill()
      
      
      //// Bezier 7 Drawing
      let bezier7Path = UIBezierPath()
      bezier7Path.move(to: CGPoint(x: group2.minX + 0.68750 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier7Path.addLine(to: CGPoint(x: group2.minX + 0.68750 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier7Path.addCurve(to: CGPoint(x: group2.minX + 0.73438 * group2.width, y: group2.minY + 0.10000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.71328 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.73438 * group2.width, y: group2.minY + 0.04500 * group2.height))
      bezier7Path.addLine(to: CGPoint(x: group2.minX + 0.73438 * group2.width, y: group2.minY + 0.90000 * group2.height))
      bezier7Path.addCurve(to: CGPoint(x: group2.minX + 0.68750 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.73438 * group2.width, y: group2.minY + 0.95500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.71328 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier7Path.addLine(to: CGPoint(x: group2.minX + 0.68750 * group2.width, y: group2.minY + 1.00000 * group2.height))
      bezier7Path.addCurve(to: CGPoint(x: group2.minX + 0.64062 * group2.width, y: group2.minY + 0.90000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.66172 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.64062 * group2.width, y: group2.minY + 0.95500 * group2.height))
      bezier7Path.addLine(to: CGPoint(x: group2.minX + 0.64062 * group2.width, y: group2.minY + 0.10000 * group2.height))
      bezier7Path.addCurve(to: CGPoint(x: group2.minX + 0.68750 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.64062 * group2.width, y: group2.minY + 0.04500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.66172 * group2.width, y: group2.minY + 0.00000 * group2.height))
      bezier7Path.close()
      primaryColor.setFill()
      bezier7Path.fill()
   }
}
