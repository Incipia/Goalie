//
//  HomeWindowAccessoryKit.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class HomeWindowAccessoryKit: AccessoryItemDrawing
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
      bezierPath.move(to: CGPoint(x: group.minX + 0.34329 * group.width, y: group.minY + 0.38400 * group.height))
      bezierPath.addCurve(to: CGPoint(x: group.minX + 0.34483 * group.width, y: group.minY + 0.36875 * group.height), controlPoint1: CGPoint(x: group.minX + 0.34429 * group.width, y: group.minY + 0.37911 * group.height), controlPoint2: CGPoint(x: group.minX + 0.34483 * group.width, y: group.minY + 0.37400 * group.height))
      bezierPath.addCurve(to: CGPoint(x: group.minX + 0.28526 * group.width, y: group.minY + 0.30044 * group.height), controlPoint1: CGPoint(x: group.minX + 0.34483 * group.width, y: group.minY + 0.33103 * group.height), controlPoint2: CGPoint(x: group.minX + 0.31815 * group.width, y: group.minY + 0.30044 * group.height))
      bezierPath.addCurve(to: CGPoint(x: group.minX + 0.22569 * group.width, y: group.minY + 0.23214 * group.height), controlPoint1: CGPoint(x: group.minX + 0.28526 * group.width, y: group.minY + 0.26273 * group.height), controlPoint2: CGPoint(x: group.minX + 0.25859 * group.width, y: group.minY + 0.23214 * group.height))
      bezierPath.addCurve(to: CGPoint(x: group.minX + 0.20690 * group.width, y: group.minY + 0.23571 * group.height), controlPoint1: CGPoint(x: group.minX + 0.21910 * group.width, y: group.minY + 0.23214 * group.height), controlPoint2: CGPoint(x: group.minX + 0.21281 * group.width, y: group.minY + 0.23344 * group.height))
      bezierPath.addLine(to: CGPoint(x: group.minX + 0.20690 * group.width, y: group.minY + 0.39286 * group.height))
      bezierPath.addLine(to: CGPoint(x: group.minX + 0.33324 * group.width, y: group.minY + 0.39286 * group.height))
      bezierPath.addCurve(to: CGPoint(x: group.minX + 0.34329 * group.width, y: group.minY + 0.38400 * group.height), controlPoint1: CGPoint(x: group.minX + 0.33796 * group.width, y: group.minY + 0.39286 * group.height), controlPoint2: CGPoint(x: group.minX + 0.34222 * group.width, y: group.minY + 0.38927 * group.height))
      bezierPath.close()
      primaryColor.setFill()
      bezierPath.fill()
      
      
      //// Bezier 2 Drawing
      let bezier2Path = UIBezierPath()
      bezier2Path.move(to: CGPoint(x: group.minX + 0.76008 * group.width, y: group.minY + 0.67857 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.67513 * group.width, y: group.minY + 0.76543 * group.height), controlPoint1: CGPoint(x: group.minX + 0.71316 * group.width, y: group.minY + 0.67857 * group.height), controlPoint2: CGPoint(x: group.minX + 0.67513 * group.width, y: group.minY + 0.71746 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.67625 * group.width, y: group.minY + 0.77879 * group.height), controlPoint1: CGPoint(x: group.minX + 0.67513 * group.width, y: group.minY + 0.76998 * group.height), controlPoint2: CGPoint(x: group.minX + 0.67558 * group.width, y: group.minY + 0.77443 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.62068 * group.width, y: group.minY + 0.84561 * group.height), controlPoint1: CGPoint(x: group.minX + 0.64475 * group.width, y: group.minY + 0.78405 * group.height), controlPoint2: CGPoint(x: group.minX + 0.62068 * group.width, y: group.minY + 0.81191 * group.height))
      bezier2Path.addLine(to: CGPoint(x: group.minX + 0.62068 * group.width, y: group.minY + 0.84573 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.63223 * group.width, y: group.minY + 0.85714 * group.height), controlPoint1: CGPoint(x: group.minX + 0.62070 * group.width, y: group.minY + 0.85209 * group.height), controlPoint2: CGPoint(x: group.minX + 0.62601 * group.width, y: group.minY + 0.85714 * group.height))
      bezier2Path.addLine(to: CGPoint(x: group.minX + 0.79309 * group.width, y: group.minY + 0.85714 * group.height))
      bezier2Path.addLine(to: CGPoint(x: group.minX + 0.79309 * group.width, y: group.minY + 0.68554 * group.height))
      bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.76008 * group.width, y: group.minY + 0.67857 * group.height), controlPoint1: CGPoint(x: group.minX + 0.78294 * group.width, y: group.minY + 0.68112 * group.height), controlPoint2: CGPoint(x: group.minX + 0.77182 * group.width, y: group.minY + 0.67857 * group.height))
      bezier2Path.close()
      primaryColor.setFill()
      bezier2Path.fill()
      
      
      //// Group 2
      context!.saveGState()
      context!.setAlpha(0.4)
      context!.beginTransparencyLayer(auxiliaryInfo: nil)
      
      
      //// Bezier 3 Drawing
      let bezier3Path = UIBezierPath()
      bezier3Path.move(to: CGPoint(x: group.minX + 0.55172 * group.width, y: group.minY + 0.55357 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.79310 * group.width, y: group.minY + 0.55357 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.79310 * group.width, y: group.minY + 0.89286 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.55172 * group.width, y: group.minY + 0.89286 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.55172 * group.width, y: group.minY + 0.55357 * group.height))
      bezier3Path.close()
      bezier3Path.move(to: CGPoint(x: group.minX + 0.20690 * group.width, y: group.minY + 0.55357 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.44828 * group.width, y: group.minY + 0.55357 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.44828 * group.width, y: group.minY + 0.89286 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.20690 * group.width, y: group.minY + 0.89286 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.20690 * group.width, y: group.minY + 0.55357 * group.height))
      bezier3Path.close()
      bezier3Path.move(to: CGPoint(x: group.minX + 0.20690 * group.width, y: group.minY + 0.10714 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.44828 * group.width, y: group.minY + 0.10714 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.44828 * group.width, y: group.minY + 0.44643 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.20690 * group.width, y: group.minY + 0.44643 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.20690 * group.width, y: group.minY + 0.10714 * group.height))
      bezier3Path.close()
      bezier3Path.move(to: CGPoint(x: group.minX + 0.79310 * group.width, y: group.minY + 0.44643 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.55172 * group.width, y: group.minY + 0.44643 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.55172 * group.width, y: group.minY + 0.10714 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.79310 * group.width, y: group.minY + 0.10714 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.79310 * group.width, y: group.minY + 0.44643 * group.height))
      bezier3Path.close()
      bezier3Path.move(to: CGPoint(x: group.minX + 0.94534 * group.width, y: group.minY + 0.89286 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.89655 * group.width, y: group.minY + 0.89286 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.89655 * group.width, y: group.minY + 0.03571 * group.height))
      bezier3Path.addCurve(to: CGPoint(x: group.minX + 0.86207 * group.width, y: group.minY + 0.00000 * group.height), controlPoint1: CGPoint(x: group.minX + 0.89655 * group.width, y: group.minY + 0.01598 * group.height), controlPoint2: CGPoint(x: group.minX + 0.88112 * group.width, y: group.minY + 0.00000 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.81100 * group.width, y: group.minY + 0.00000 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.79310 * group.width, y: group.minY + 0.00000 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.55172 * group.width, y: group.minY + 0.00000 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.44828 * group.width, y: group.minY + 0.00000 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.20690 * group.width, y: group.minY + 0.00000 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.15517 * group.width, y: group.minY + 0.00000 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.13793 * group.width, y: group.minY + 0.00000 * group.height))
      bezier3Path.addCurve(to: CGPoint(x: group.minX + 0.10345 * group.width, y: group.minY + 0.03571 * group.height), controlPoint1: CGPoint(x: group.minX + 0.11888 * group.width, y: group.minY + 0.00000 * group.height), controlPoint2: CGPoint(x: group.minX + 0.10345 * group.width, y: group.minY + 0.01598 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.10345 * group.width, y: group.minY + 0.44643 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.10345 * group.width, y: group.minY + 0.55357 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.10345 * group.width, y: group.minY + 0.89286 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.05466 * group.width, y: group.minY + 0.89286 * group.height))
      bezier3Path.addCurve(to: CGPoint(x: group.minX + 0.00007 * group.width, y: group.minY + 0.94355 * group.height), controlPoint1: CGPoint(x: group.minX + 0.02664 * group.width, y: group.minY + 0.89286 * group.height), controlPoint2: CGPoint(x: group.minX + 0.00154 * group.width, y: group.minY + 0.91457 * group.height))
      bezier3Path.addCurve(to: CGPoint(x: group.minX + 0.05173 * group.width, y: group.minY + 1.00000 * group.height), controlPoint1: CGPoint(x: group.minX + -0.00148 * group.width, y: group.minY + 0.97445 * group.height), controlPoint2: CGPoint(x: group.minX + 0.02224 * group.width, y: group.minY + 1.00000 * group.height))
      bezier3Path.addLine(to: CGPoint(x: group.minX + 0.94827 * group.width, y: group.minY + 1.00000 * group.height))
      bezier3Path.addCurve(to: CGPoint(x: group.minX + 0.99993 * group.width, y: group.minY + 0.94355 * group.height), controlPoint1: CGPoint(x: group.minX + 0.97776 * group.width, y: group.minY + 1.00000 * group.height), controlPoint2: CGPoint(x: group.minX + 1.00148 * group.width, y: group.minY + 0.97445 * group.height))
      bezier3Path.addCurve(to: CGPoint(x: group.minX + 0.94534 * group.width, y: group.minY + 0.89286 * group.height), controlPoint1: CGPoint(x: group.minX + 0.99846 * group.width, y: group.minY + 0.91457 * group.height), controlPoint2: CGPoint(x: group.minX + 0.97336 * group.width, y: group.minY + 0.89286 * group.height))
      bezier3Path.close()
      primaryColor.setFill()
      bezier3Path.fill()
      
      
      context!.endTransparencyLayer()
      context!.restoreGState()
   }
}
