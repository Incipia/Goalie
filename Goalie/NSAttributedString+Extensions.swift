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
   static func speechBubbleString(_ text: String) -> NSAttributedString
   {
      let font = UIFont(name: "NotoSans-Bold", size: 9)!
      let attributes = [
         NSForegroundColorAttributeName : UIColor.white,
         NSFontAttributeName : font,
         NSKernAttributeName : 2
      ] as [String : Any]
      
      return NSAttributedString(string: text, attributes: attributes)
   }
   
   static func attributedOnboardingStringForPageNumber(_ number: Int) -> NSAttributedString
   {
      let font = UIFont(name: "NotoSans-Bold", size: 18)!
      let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
      paragraphStyle.alignment = NSTextAlignment.center
      paragraphStyle.lineHeightMultiple = 1.5
      
      if number < 3 {
         let attributes = [
            NSForegroundColorAttributeName : UIColor.white,
            NSFontAttributeName : font,
            NSParagraphStyleAttributeName : paragraphStyle
         ]
         
         let text = _mainTextForPageNumber(number) ?? ""
         return NSAttributedString(string: text, attributes: attributes)
      }
      else {
         let whiteTextAttributes = [
            NSForegroundColorAttributeName : UIColor.white,
            NSFontAttributeName : font,
            NSParagraphStyleAttributeName : paragraphStyle
         ]
         
         let beginningText = "So get to it.\rWhen you're happy,\r"
         let attrString = NSMutableAttributedString(string: beginningText, attributes: whiteTextAttributes)
         
         let yellowTextAttributes = [
            NSForegroundColorAttributeName : UIColor(priority: .soon),
            NSFontAttributeName : font,
            NSParagraphStyleAttributeName : paragraphStyle
         ]
         let endText = "Goalie's happy."
         let endAttrString = NSAttributedString(string: endText, attributes: yellowTextAttributes)
         attrString.append(endAttrString)
         return attrString
      }
   }
   
   static func congratulationsAttributedString() -> NSAttributedString
   {
      let font = UIFont(name: "NotoSans", size: 15)!
      let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
      paragraphStyle.alignment = NSTextAlignment.center
      paragraphStyle.lineHeightMultiple = 1.5
      
      let attributes = [
         NSForegroundColorAttributeName : UIColor.black,
         NSFontAttributeName : font,
         NSParagraphStyleAttributeName : paragraphStyle
      ]
      
      let text = "Tasks you add will be given the blue priority by default, and will heat up over time. Complete tasks before they get hot to keep Goalie cool, calm, and collected."
      return NSAttributedString(string: text, attributes: attributes)
   }
   
   
   static func unlockedAccessoryPackAttributedString(_ pack: AccessoryPack) -> NSAttributedString
   {
      let font = UIFont(name: "NotoSans", size: 15)!
      let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
      paragraphStyle.alignment = NSTextAlignment.center
      paragraphStyle.lineHeightMultiple = 1.5
      
      let attributes = [
         NSForegroundColorAttributeName : UIColor.black,
         NSFontAttributeName : font,
         NSParagraphStyleAttributeName : paragraphStyle
      ]
      
      return NSAttributedString(string: pack.unlockedMessageText, attributes: attributes)
   }
   
   fileprivate static func _mainTextForPageNumber(_ number: Int) -> String?
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
