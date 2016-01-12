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
   
   static func attributedOnboardingStringForPageNumber(number: Int) -> NSAttributedString
   {
      let font = UIFont(name: "NotoSans-Bold", size: 20)!
      let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
      paragraphStyle.alignment = NSTextAlignment.Center
      paragraphStyle.lineHeightMultiple = 1.5
      
      if number < 3 {
         let attributes = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : font,
            NSParagraphStyleAttributeName : paragraphStyle
         ]
         
         let text = _mainTextForPageNumber(number) ?? ""
         return NSAttributedString(string: text, attributes: attributes)
      }
      else {
         let whiteTextAttributes = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : font,
            NSParagraphStyleAttributeName : paragraphStyle
         ]
         
         let beginningText = "So get to it.\rWhen you're happy,\r"
         let attrString = NSMutableAttributedString(string: beginningText, attributes: whiteTextAttributes)
         
         let yellowTextAttributes = [
            NSForegroundColorAttributeName : UIColor(priority: .Soon),
            NSFontAttributeName : font,
            NSParagraphStyleAttributeName : paragraphStyle
         ]
         let endText = "Goalie's happy."
         let endAttrString = NSAttributedString(string: endText, attributes: yellowTextAttributes)
         attrString.appendAttributedString(endAttrString)
         return attrString
      }
   }
   
   private static func _mainTextForPageNumber(number: Int) -> String?
   {
      switch number
      {
      case 0: return "Meet Goalie.\nHe really likes tasks...."
      case 1: return "Add a task to start a list. \rGive them a priority if you want,\ror Goalie can do it for you."
      case 2: return "The longer you wait to finish\ra task, the hotter Goalie gets."
      case 3: return "So get to it.\rWhen you're happy,\rGoalie's happy."
      default: return nil
      }
   }
}
