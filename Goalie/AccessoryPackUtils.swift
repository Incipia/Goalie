//
//  AccessoryPackUtils.swift
//  Goalie
//
//  Created by Gregory Klein on 3/31/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

extension AccessoryPack
{  
   var badgeViewAspectRatio: CGFloat {
      switch self {
      case .Gym: return (50.0 / 28.0)
      case .Work: return (30.0 / 28.0)
      case .Home: return (27.0 / 28.0)
      case .None: return (20.0 / 28.0)
      }
   }
   
   func drawWithFrame(frame: CGRect, selected: Bool)
   {
      switch self {
      case .Gym: _drawGymBadge(frame, selected: selected)
      case .Work: _drawWorkBadge(frame, selected: selected)
      case .Home: _drawHomeBadge(frame, selected: selected)
      case .None: _drawNoneBadge(frame, selected: selected)
      }
   }
   
   private func _drawGymBadge(frame: CGRect, selected: Bool)
   {
      var fillColor41 = iconColor
      if selected {
         fillColor41 = UIColor(priority: .Later)
      }
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(frame.minX + 0.88834 * frame.width, frame.minY + 0.40739 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.87020 * frame.width, frame.minY + 0.40739 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.87020 * frame.width, frame.minY + 0.20201 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.81878 * frame.width, frame.minY + 0.12500 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.87020 * frame.width, frame.minY + 0.15950 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.84716 * frame.width, frame.minY + 0.12500 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.76735 * frame.width, frame.minY + 0.20201 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.79037 * frame.width, frame.minY + 0.12500 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.76735 * frame.width, frame.minY + 0.15950 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.71592 * frame.width, frame.minY + 0.12500 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.76735 * frame.width, frame.minY + 0.15950 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.74431 * frame.width, frame.minY + 0.12500 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.66449 * frame.width, frame.minY + 0.20201 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.68751 * frame.width, frame.minY + 0.12500 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.66449 * frame.width, frame.minY + 0.15950 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.61306 * frame.width, frame.minY + 0.12500 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.66449 * frame.width, frame.minY + 0.15950 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.64145 * frame.width, frame.minY + 0.12500 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.56163 * frame.width, frame.minY + 0.20201 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.58466 * frame.width, frame.minY + 0.12500 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.56163 * frame.width, frame.minY + 0.15950 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.56163 * frame.width, frame.minY + 0.40739 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.45878 * frame.width, frame.minY + 0.40739 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.45878 * frame.width, frame.minY + 0.20201 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.40735 * frame.width, frame.minY + 0.12500 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.45878 * frame.width, frame.minY + 0.15950 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.43574 * frame.width, frame.minY + 0.12500 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.35592 * frame.width, frame.minY + 0.20201 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.37894 * frame.width, frame.minY + 0.12500 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.35592 * frame.width, frame.minY + 0.15950 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.30449 * frame.width, frame.minY + 0.12500 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.35592 * frame.width, frame.minY + 0.15950 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.33288 * frame.width, frame.minY + 0.12500 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.25306 * frame.width, frame.minY + 0.20201 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.27608 * frame.width, frame.minY + 0.12500 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.25306 * frame.width, frame.minY + 0.15950 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.20163 * frame.width, frame.minY + 0.12500 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.25306 * frame.width, frame.minY + 0.15950 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.23002 * frame.width, frame.minY + 0.12500 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.15020 * frame.width, frame.minY + 0.20201 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.17323 * frame.width, frame.minY + 0.12500 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.15020 * frame.width, frame.minY + 0.15950 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.15020 * frame.width, frame.minY + 0.40739 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.13205 * frame.width, frame.minY + 0.40739 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.08163 * frame.width, frame.minY + 0.48291 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.10431 * frame.width, frame.minY + 0.40739 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.08163 * frame.width, frame.minY + 0.44138 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.08163 * frame.width, frame.minY + 0.48589 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.13205 * frame.width, frame.minY + 0.56141 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.08163 * frame.width, frame.minY + 0.52742 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.10431 * frame.width, frame.minY + 0.56141 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.15020 * frame.width, frame.minY + 0.56141 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.15020 * frame.width, frame.minY + 0.76674 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.20163 * frame.width, frame.minY + 0.84375 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.15020 * frame.width, frame.minY + 0.80928 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.17323 * frame.width, frame.minY + 0.84375 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.25306 * frame.width, frame.minY + 0.76674 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.23002 * frame.width, frame.minY + 0.84375 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.25306 * frame.width, frame.minY + 0.80928 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.30449 * frame.width, frame.minY + 0.84375 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.25306 * frame.width, frame.minY + 0.80928 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.27608 * frame.width, frame.minY + 0.84375 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.35592 * frame.width, frame.minY + 0.76674 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.33288 * frame.width, frame.minY + 0.84375 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.35592 * frame.width, frame.minY + 0.80928 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.40735 * frame.width, frame.minY + 0.84375 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.35592 * frame.width, frame.minY + 0.80928 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.37894 * frame.width, frame.minY + 0.84375 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.45878 * frame.width, frame.minY + 0.76674 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.43574 * frame.width, frame.minY + 0.84375 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.45878 * frame.width, frame.minY + 0.80928 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.45878 * frame.width, frame.minY + 0.56141 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.56163 * frame.width, frame.minY + 0.56141 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.56163 * frame.width, frame.minY + 0.76674 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.61306 * frame.width, frame.minY + 0.84375 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.56163 * frame.width, frame.minY + 0.80928 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.58466 * frame.width, frame.minY + 0.84375 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.66449 * frame.width, frame.minY + 0.76674 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.64145 * frame.width, frame.minY + 0.84375 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.66449 * frame.width, frame.minY + 0.80928 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.71592 * frame.width, frame.minY + 0.84375 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.66449 * frame.width, frame.minY + 0.80928 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.68751 * frame.width, frame.minY + 0.84375 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.76735 * frame.width, frame.minY + 0.76674 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.74431 * frame.width, frame.minY + 0.84375 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.76735 * frame.width, frame.minY + 0.80928 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.81878 * frame.width, frame.minY + 0.84375 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.76735 * frame.width, frame.minY + 0.80928 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.79037 * frame.width, frame.minY + 0.84375 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.87020 * frame.width, frame.minY + 0.76674 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.84716 * frame.width, frame.minY + 0.84375 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.87020 * frame.width, frame.minY + 0.80928 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.87020 * frame.width, frame.minY + 0.56141 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.88834 * frame.width, frame.minY + 0.56141 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.93878 * frame.width, frame.minY + 0.48589 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.91608 * frame.width, frame.minY + 0.56141 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.93878 * frame.width, frame.minY + 0.52742 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.93878 * frame.width, frame.minY + 0.48291 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.88834 * frame.width, frame.minY + 0.40739 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.93878 * frame.width, frame.minY + 0.44138 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.91608 * frame.width, frame.minY + 0.40739 * frame.height))
      bezierPath.closePath()
      fillColor41.setFill()
      bezierPath.fill()
   }
   
   private func _drawWorkBadge(frame: CGRect, selected: Bool)
   {
      var fillColor37 = iconColor
      if selected {
         fillColor37 = UIColor(priority: .Later)
      }
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(frame.minX + 0.30000 * frame.width, frame.minY + 0.14286 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.70000 * frame.width, frame.minY + 0.14286 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.70000 * frame.width, frame.minY + 0.25000 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.30000 * frame.width, frame.minY + 0.25000 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.30000 * frame.width, frame.minY + 0.14286 * frame.height))
      bezierPath.closePath()
      bezierPath.moveToPoint(CGPointMake(frame.minX + 0.86987 * frame.width, frame.minY + 0.25000 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.83333 * frame.width, frame.minY + 0.25000 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.83333 * frame.width, frame.minY + 0.07325 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.76497 * frame.width, frame.minY + 0.00000 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.83333 * frame.width, frame.minY + 0.03279 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.80273 * frame.width, frame.minY + 0.00000 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.23503 * frame.width, frame.minY + 0.00000 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.16667 * frame.width, frame.minY + 0.07325 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.19727 * frame.width, frame.minY + 0.00000 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.16667 * frame.width, frame.minY + 0.03279 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.16667 * frame.width, frame.minY + 0.25000 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.13013 * frame.width, frame.minY + 0.25000 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.00000 * frame.width, frame.minY + 0.38943 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.05827 * frame.width, frame.minY + 0.25000 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.00000 * frame.width, frame.minY + 0.31243 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.00000 * frame.width, frame.minY + 0.86057 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.13013 * frame.width, frame.minY + 1.00000 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.00000 * frame.width, frame.minY + 0.93757 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.05827 * frame.width, frame.minY + 1.00000 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.86987 * frame.width, frame.minY + 1.00000 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 1.00000 * frame.width, frame.minY + 0.86057 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.94173 * frame.width, frame.minY + 1.00000 * frame.height), controlPoint2: CGPointMake(frame.minX + 1.00000 * frame.width, frame.minY + 0.93757 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 1.00000 * frame.width, frame.minY + 0.38943 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.86987 * frame.width, frame.minY + 0.25000 * frame.height), controlPoint1: CGPointMake(frame.minX + 1.00000 * frame.width, frame.minY + 0.31243 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.94173 * frame.width, frame.minY + 0.25000 * frame.height))
      bezierPath.closePath()
      fillColor37.setFill()
      bezierPath.fill()
   }
   
   private func _drawHomeBadge(frame: CGRect, selected: Bool)
   {
      //// Color Declarations
      var fillColor39 = iconColor
      if selected {
         fillColor39 = UIColor(priority: .Later)
      }
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(frame.minX + 0.97762 * frame.width, frame.minY + 0.36604 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.88899 * frame.width, frame.minY + 0.29800 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.88899 * frame.width, frame.minY + 0.04832 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.85118 * frame.width, frame.minY + 0.00000 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.88899 * frame.width, frame.minY + 0.02165 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.87851 * frame.width, frame.minY + 0.00000 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.75581 * frame.width, frame.minY + 0.00000 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.70381 * frame.width, frame.minY + 0.04832 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.72847 * frame.width, frame.minY + 0.00000 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.70381 * frame.width, frame.minY + 0.02165 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.70381 * frame.width, frame.minY + 0.14529 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.53521 * frame.width, frame.minY + 0.01183 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.46707 * frame.width, frame.minY + 0.01183 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.51514 * frame.width, frame.minY + -0.00392 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.48714 * frame.width, frame.minY + -0.00392 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.20047 * frame.width, frame.minY + 0.22157 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.17425 * frame.width, frame.minY + 0.24229 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.14284 * frame.width, frame.minY + 0.26704 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.16259 * frame.width, frame.minY + 0.24915 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.15207 * frame.width, frame.minY + 0.25736 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.02066 * frame.width, frame.minY + 0.36604 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.05510 * frame.width, frame.minY + 0.46429 * frame.height), controlPoint1: CGPointMake(frame.minX + -0.01964 * frame.width, frame.minY + 0.39772 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.00333 * frame.width, frame.minY + 0.46429 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.11121 * frame.width, frame.minY + 0.46429 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.11121 * frame.width, frame.minY + 0.85783 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.24910 * frame.width, frame.minY + 1.00000 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.11121 * frame.width, frame.minY + 0.93636 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.16870 * frame.width, frame.minY + 1.00000 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.37047 * frame.width, frame.minY + 1.00000 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.37047 * frame.width, frame.minY + 0.79261 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.50010 * frame.width, frame.minY + 0.65043 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.37047 * frame.width, frame.minY + 0.71443 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.42003 * frame.width, frame.minY + 0.65043 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.62973 * frame.width, frame.minY + 0.79261 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.58021 * frame.width, frame.minY + 0.65043 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.62973 * frame.width, frame.minY + 0.71443 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.62973 * frame.width, frame.minY + 1.00000 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.75507 * frame.width, frame.minY + 1.00000 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.88899 * frame.width, frame.minY + 0.85783 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.83547 * frame.width, frame.minY + 1.00000 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.88899 * frame.width, frame.minY + 0.93636 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.88899 * frame.width, frame.minY + 0.46429 * frame.height))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.94907 * frame.width, frame.minY + 0.46429 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.97762 * frame.width, frame.minY + 0.36604 * frame.height), controlPoint1: CGPointMake(frame.minX + 1.00084 * frame.width, frame.minY + 0.46429 * frame.height), controlPoint2: CGPointMake(frame.minX + 1.01796 * frame.width, frame.minY + 0.39772 * frame.height))
      bezierPath.closePath()
      fillColor39.setFill()
      bezierPath.fill()
   }
   
   private func _drawNoneBadge(frame: CGRect, selected: Bool)
   {
      //// Color Declarations
      var fillColor42 = UIColor.whiteColor()
      if selected {
         fillColor42 = UIColor(priority: .Later)
      }
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(frame.minX + 0.88279 * frame.width, frame.minY + 0.87077 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.99999 * frame.width, frame.minY + 0.64077 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.95564 * frame.width, frame.minY + 0.80805 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.99999 * frame.width, frame.minY + 0.72752 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.99989 * frame.width, frame.minY + 0.63805 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.99999 * frame.width, frame.minY + 0.63988 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.99994 * frame.width, frame.minY + 0.63898 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.97019 * frame.width, frame.minY + 0.51477 * frame.height), controlPoint1: CGPointMake(frame.minX + 1.00004 * frame.width, frame.minY + 0.59637 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.99049 * frame.width, frame.minY + 0.55448 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.66699 * frame.width, frame.minY + 0.02748 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.88449 * frame.width, frame.minY + 0.34695 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.67259 * frame.width, frame.minY + 0.21623 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.60794 * frame.width, frame.minY + 0.00409 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.66634 * frame.width, frame.minY + 0.00584 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.63344 * frame.width, frame.minY + -0.00705 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.09884 * frame.width, frame.minY + 0.84323 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.24019 * frame.width, frame.minY + 0.16512 * frame.height), controlPoint2: CGPointMake(frame.minX + -0.20011 * frame.width, frame.minY + 0.52238 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.50604 * frame.width, frame.minY + 0.99998 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.18969 * frame.width, frame.minY + 0.94070 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.34394 * frame.width, frame.minY + 0.99998 * frame.height))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 0.88279 * frame.width, frame.minY + 0.87077 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.65554 * frame.width, frame.minY + 0.99998 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.79154 * frame.width, frame.minY + 0.94934 * frame.height))
      bezierPath.closePath()
      fillColor42.setFill()
      bezierPath.fill()
   }
}

class CongratulatingUnlockedAccessoryPackBackgroundView: UIView
{
   var accessory: AccessoryPack = .None {
      didSet {
         setNeedsDisplay()
      }
   }
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      backgroundColor = .clearColor()
   }
   
   override func drawRect(rect: CGRect)
   {
      _drawWithFrame(rect)
   }
   
   private func _drawWithFrame(frame: CGRect)
   {
      //// Subframes
      let group: CGRect = CGRectMake(frame.minX + floor(frame.width * 0.00000 + 0.5), frame.minY + floor(frame.height * -0.00001 + 0.5), floor(frame.width * 0.99999 - 0.5) - floor(frame.width * 0.00000 + 0.5) + 1, floor(frame.height * 1.00000 + 0.5) - floor(frame.height * -0.00001 + 0.5))
      
      
      //// Group
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(group.minX + 0.57421 * group.width, group.minY + 0.02850 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.57421 * group.width, group.minY + 0.02850 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.67149 * group.width, group.minY + 0.05457 * group.height), controlPoint1: CGPointMake(group.minX + 0.60059 * group.width, group.minY + 0.05225 * group.height), controlPoint2: CGPointMake(group.minX + 0.63676 * group.width, group.minY + 0.06195 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.67149 * group.width, group.minY + 0.05457 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.80002 * group.width, group.minY + 0.12877 * group.height), controlPoint1: CGPointMake(group.minX + 0.72702 * group.width, group.minY + 0.04275 * group.height), controlPoint2: CGPointMake(group.minX + 0.78249 * group.width, group.minY + 0.07477 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.80002 * group.width, group.minY + 0.12877 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.87124 * group.width, group.minY + 0.19997 * group.height), controlPoint1: CGPointMake(group.minX + 0.81099 * group.width, group.minY + 0.16255 * group.height), controlPoint2: CGPointMake(group.minX + 0.83747 * group.width, group.minY + 0.18902 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.87124 * group.width, group.minY + 0.19997 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.94544 * group.width, group.minY + 0.32852 * group.height), controlPoint1: CGPointMake(group.minX + 0.92524 * group.width, group.minY + 0.21752 * group.height), controlPoint2: CGPointMake(group.minX + 0.95727 * group.width, group.minY + 0.27300 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.94544 * group.width, group.minY + 0.32852 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.97152 * group.width, group.minY + 0.42580 * group.height), controlPoint1: CGPointMake(group.minX + 0.93807 * group.width, group.minY + 0.36325 * group.height), controlPoint2: CGPointMake(group.minX + 0.94777 * group.width, group.minY + 0.39942 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.97152 * group.width, group.minY + 0.42580 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.97152 * group.width, group.minY + 0.57422 * group.height), controlPoint1: CGPointMake(group.minX + 1.00949 * group.width, group.minY + 0.46797 * group.height), controlPoint2: CGPointMake(group.minX + 1.00949 * group.width, group.minY + 0.53205 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.97152 * group.width, group.minY + 0.57422 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.94544 * group.width, group.minY + 0.67150 * group.height), controlPoint1: CGPointMake(group.minX + 0.94777 * group.width, group.minY + 0.60060 * group.height), controlPoint2: CGPointMake(group.minX + 0.93807 * group.width, group.minY + 0.63677 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.94544 * group.width, group.minY + 0.67150 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.87124 * group.width, group.minY + 0.80002 * group.height), controlPoint1: CGPointMake(group.minX + 0.95727 * group.width, group.minY + 0.72702 * group.height), controlPoint2: CGPointMake(group.minX + 0.92524 * group.width, group.minY + 0.78250 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.87124 * group.width, group.minY + 0.80002 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.80002 * group.width, group.minY + 0.87124 * group.height), controlPoint1: CGPointMake(group.minX + 0.83747 * group.width, group.minY + 0.81099 * group.height), controlPoint2: CGPointMake(group.minX + 0.81099 * group.width, group.minY + 0.83747 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.80002 * group.width, group.minY + 0.87124 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.67149 * group.width, group.minY + 0.94544 * group.height), controlPoint1: CGPointMake(group.minX + 0.78249 * group.width, group.minY + 0.92522 * group.height), controlPoint2: CGPointMake(group.minX + 0.72702 * group.width, group.minY + 0.95724 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.67149 * group.width, group.minY + 0.94544 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.57421 * group.width, group.minY + 0.97152 * group.height), controlPoint1: CGPointMake(group.minX + 0.63676 * group.width, group.minY + 0.93807 * group.height), controlPoint2: CGPointMake(group.minX + 0.60059 * group.width, group.minY + 0.94774 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.57421 * group.width, group.minY + 0.97152 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.42579 * group.width, group.minY + 0.97152 * group.height), controlPoint1: CGPointMake(group.minX + 0.53204 * group.width, group.minY + 1.00949 * group.height), controlPoint2: CGPointMake(group.minX + 0.46796 * group.width, group.minY + 1.00949 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.42579 * group.width, group.minY + 0.97152 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.32851 * group.width, group.minY + 0.94544 * group.height), controlPoint1: CGPointMake(group.minX + 0.39941 * group.width, group.minY + 0.94774 * group.height), controlPoint2: CGPointMake(group.minX + 0.36324 * group.width, group.minY + 0.93807 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.32851 * group.width, group.minY + 0.94544 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.19998 * group.width, group.minY + 0.87124 * group.height), controlPoint1: CGPointMake(group.minX + 0.27298 * group.width, group.minY + 0.95724 * group.height), controlPoint2: CGPointMake(group.minX + 0.21751 * group.width, group.minY + 0.92522 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.19998 * group.width, group.minY + 0.87124 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.12876 * group.width, group.minY + 0.80002 * group.height), controlPoint1: CGPointMake(group.minX + 0.18901 * group.width, group.minY + 0.83747 * group.height), controlPoint2: CGPointMake(group.minX + 0.16253 * group.width, group.minY + 0.81099 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.12876 * group.width, group.minY + 0.80002 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.05456 * group.width, group.minY + 0.67150 * group.height), controlPoint1: CGPointMake(group.minX + 0.07478 * group.width, group.minY + 0.78250 * group.height), controlPoint2: CGPointMake(group.minX + 0.04276 * group.width, group.minY + 0.72702 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.05456 * group.width, group.minY + 0.67150 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.02848 * group.width, group.minY + 0.57422 * group.height), controlPoint1: CGPointMake(group.minX + 0.06193 * group.width, group.minY + 0.63677 * group.height), controlPoint2: CGPointMake(group.minX + 0.05226 * group.width, group.minY + 0.60060 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.02848 * group.width, group.minY + 0.57422 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.02848 * group.width, group.minY + 0.42580 * group.height), controlPoint1: CGPointMake(group.minX + -0.00949 * group.width, group.minY + 0.53205 * group.height), controlPoint2: CGPointMake(group.minX + -0.00949 * group.width, group.minY + 0.46797 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.02848 * group.width, group.minY + 0.42580 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.05456 * group.width, group.minY + 0.32852 * group.height), controlPoint1: CGPointMake(group.minX + 0.05226 * group.width, group.minY + 0.39942 * group.height), controlPoint2: CGPointMake(group.minX + 0.06193 * group.width, group.minY + 0.36325 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.05456 * group.width, group.minY + 0.32852 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.12876 * group.width, group.minY + 0.19997 * group.height), controlPoint1: CGPointMake(group.minX + 0.04276 * group.width, group.minY + 0.27300 * group.height), controlPoint2: CGPointMake(group.minX + 0.07478 * group.width, group.minY + 0.21752 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.12876 * group.width, group.minY + 0.19997 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.19998 * group.width, group.minY + 0.12877 * group.height), controlPoint1: CGPointMake(group.minX + 0.16253 * group.width, group.minY + 0.18902 * group.height), controlPoint2: CGPointMake(group.minX + 0.18901 * group.width, group.minY + 0.16255 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.19998 * group.width, group.minY + 0.12877 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.32851 * group.width, group.minY + 0.05457 * group.height), controlPoint1: CGPointMake(group.minX + 0.21751 * group.width, group.minY + 0.07477 * group.height), controlPoint2: CGPointMake(group.minX + 0.27298 * group.width, group.minY + 0.04275 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.32851 * group.width, group.minY + 0.05457 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.42579 * group.width, group.minY + 0.02850 * group.height), controlPoint1: CGPointMake(group.minX + 0.36324 * group.width, group.minY + 0.06195 * group.height), controlPoint2: CGPointMake(group.minX + 0.39941 * group.width, group.minY + 0.05225 * group.height))
      bezierPath.addLineToPoint(CGPointMake(group.minX + 0.42579 * group.width, group.minY + 0.02850 * group.height))
      bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.57421 * group.width, group.minY + 0.02850 * group.height), controlPoint1: CGPointMake(group.minX + 0.46796 * group.width, group.minY + -0.00950 * group.height), controlPoint2: CGPointMake(group.minX + 0.53204 * group.width, group.minY + -0.00950 * group.height))
      bezierPath.closePath()
      accessory.iconColor.setFill()
      bezierPath.fill()
      
      
      //// Oval Drawing
      let ovalPath = UIBezierPath(ovalInRect: CGRectMake(group.minX + floor(group.width * 0.11750 - 0.2) + 0.7, group.minY + floor(group.height * 0.11751 - 0.2) + 0.7, floor(group.width * 0.88251 + 0.2) - floor(group.width * 0.11750 - 0.2) - 0.4, floor(group.height * 0.88250 + 0.2) - floor(group.height * 0.11751 - 0.2) - 0.4))
      accessory.backgroundColor.setFill()
      ovalPath.fill()
   }
}

class AccessoryPackBadgeView: UIView
{
   @IBOutlet private weak var _widthConstraint: NSLayoutConstraint!
   @IBOutlet private weak var _heightConstraint: NSLayoutConstraint!
   
   var accessory: AccessoryPack = .Gym {
      didSet {
         _updateConstraints()
         setNeedsDisplay()
      }
   }
   
   var selected: Bool = false {
      didSet {
         setNeedsDisplay()
      }
   }
   
   // MARK: - Overridden
   override func awakeFromNib()
   {
      backgroundColor = .clearColor()
      _updateConstraints()
   }
   
   override func drawRect(rect: CGRect)
   {
      accessory.drawWithFrame(rect, selected: selected)
   }
   
   // MARK: - Private
   private func _updateConstraints()
   {
      _widthConstraint.constant = _heightConstraint.constant * accessory.badgeViewAspectRatio
   }
}
