//
//  UIColor+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/16/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

private func _rgbValuesForPriority(priority: TaskPriority) -> (r: CGFloat, g: CGFloat, b: CGFloat)
{
   var values: (r: CGFloat, g: CGFloat, b: CGFloat) = (0, 0, 0)
   switch priority
   {
   case .Ages:
      values = (18, 225, 168)
      break
   case .Later:
      values = (18, 164, 255)
      break
   case .Soon:
      values = (255, 200, 31)
      break
   case .ASAP:
      values = (255, 80, 100)
      break
   }
   values = (values.r/255.0, values.g/255.0, values.b/255.0)
   return values
}

extension UIColor
{
   convenience init(priority: TaskPriority)
   {
      let values = _rgbValuesForPriority(priority)
      let color = UIColor(colorLiteralRed: Float(values.r), green: Float(values.g), blue: Float(values.b), alpha: 1)
      self.init(CGColor: color.CGColor)
   }
   
   private convenience init(r: CGFloat, g: CGFloat, b: CGFloat)
   {
      self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
   }
}
