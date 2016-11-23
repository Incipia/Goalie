//
//  UIView+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/30/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

enum CornerRoundingMask {
   case top, left, bottom, right, none, all
}

extension UIView
{
   func roundCorners(_ mask: CornerRoundingMask)
   {
      if let roundingCorners = roundingCornersForMask(mask) {
         let radius = min(bounds.width, bounds.height) * 0.5
         let maskLayer = CAShapeLayer()
         maskLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
         layer.mask = maskLayer
      }
      else {
         layer.mask = nil
      }
   }
   
   fileprivate func roundingCornersForMask(_ mask: CornerRoundingMask) -> UIRectCorner?
   {
      switch mask {
      case .top: return UIRectCorner.topLeft.union(.topRight)
      case .left: return UIRectCorner.topLeft.union(.bottomLeft)
      case.bottom: return UIRectCorner.bottomLeft.union(.bottomRight)
      case .right: return UIRectCorner.topRight.union(.bottomRight)
      case .all: return UIRectCorner.allCorners
      case .none: return nil
      }
   }
}
