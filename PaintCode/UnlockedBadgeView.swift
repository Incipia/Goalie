//
//  UnlockedBadgeView.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class UnlockedBadgeView: UIView
{
   var selected: Bool = false {
      didSet {
         setNeedsDisplay()
      }
   }
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      backgroundColor = UIColor.clear
   }
   
   override func draw(_ rect: CGRect)
   {
      _drawBadgeWithFrame(rect)
   }
   
   fileprivate func _drawBadgeWithFrame(_ frame: CGRect)
   {
      var fillColor38 = UIColor(priority: .later)//, headComponent: .Background)
      if selected {
         fillColor38 = UIColor(priority: .later, headComponent: .background)
      }

      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.move(to: CGPoint(x: frame.minX + 0.97554 * frame.width, y: frame.minY + 45.96))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 35.25))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 0.02446 * frame.width, y: frame.minY + 45.96))
      bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 43.52), controlPoint1: CGPoint(x: frame.minX + 0.01175 * frame.width, y: frame.minY + 46.24), controlPoint2: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 45.07))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 43.52))
      bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.97554 * frame.width, y: frame.minY + 45.96), controlPoint1: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 45.07), controlPoint2: CGPoint(x: frame.minX + 0.98825 * frame.width, y: frame.minY + 46.24))
      bezierPath.close()
      fillColor38.setFill()
      bezierPath.fill()
   }
}
