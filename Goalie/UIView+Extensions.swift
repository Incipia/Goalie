//
//  UIView+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/30/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

enum CornerRoundingMask {
   case Top, Left, Bottom, Right, None, All
}

extension UIView
{
   func roundCorners(mask: CornerRoundingMask)
   {
      if let roundingCorners = roundingCornersForMask(mask) {
         let radius = min(bounds.width, bounds.height) * 0.5
         let maskLayer = CAShapeLayer()
         maskLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundingCorners, cornerRadii: CGSizeMake(radius, radius)).CGPath
         layer.mask = maskLayer
      }
      else {
         layer.mask = nil
      }
   }
   
   private func roundingCornersForMask(mask: CornerRoundingMask) -> UIRectCorner?
   {
      switch mask {
      case .Top: return UIRectCorner.TopLeft.union(.TopRight)
      case .Left: return UIRectCorner.TopLeft.union(.BottomLeft)
      case.Bottom: return UIRectCorner.BottomLeft.union(.BottomRight)
      case .Right: return UIRectCorner.TopRight.union(.BottomRight)
      case .All: return UIRectCorner.AllCorners
      case .None: return nil
      }
   }
}