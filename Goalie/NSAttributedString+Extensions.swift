//
//  NSAttributedString+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 1/7/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

extension NSAttributedString
{
   static func speechBubbleString(text: String) -> NSAttributedString
   {
      let font = UIFont(name: "NotoSans-Bold", size: 9)!
      let attributes = [
         NSForegroundColorAttributeName : UIColor.whiteColor(),
         NSFontAttributeName : font,
         NSKernAttributeName : 2
      ]
      
      return NSAttributedString(string: text, attributes: attributes)
   }
}
