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
      backgroundColor = UIColor.clearColor()
   }
   
   override func drawRect(rect: CGRect)
   {
      _drawBadgeWithFrame(rect)
   }
   
   private func _drawBadgeWithFrame(frame: CGRect)
   {
      var fillColor38 = UIColor(priority: .Later)//, headComponent: .Background)
      if selected {
         fillColor38 = UIColor(priority: .Later, headComponent: .Background)
      }

      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(frame.minX + 0.97554 * frame.width, frame.minY + 45.96))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.50000 * frame.width, frame.minY + 35.25))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.02446 * frame.width, frame.minY + 45.96))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.00000 * frame.width, frame.minY + 43.52), controlPoint1: CGPointMake(frame.minX + 0.01175 * frame.width, frame.minY + 46.24), controlPoint2: CGPointMake(frame.minX + 0.00000 * frame.width, frame.minY + 45.07))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.00000 * frame.width, frame.minY))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 1.00000 * frame.width, frame.minY))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 1.00000 * frame.width, frame.minY + 43.52))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.97554 * frame.width, frame.minY + 45.96), controlPoint1: CGPointMake(frame.minX + 1.00000 * frame.width, frame.minY + 45.07), controlPoint2: CGPointMake(frame.minX + 0.98825 * frame.width, frame.minY + 46.24))
      bezierPath.closePath()
      fillColor38.setFill()
      bezierPath.fill()
   }
}
