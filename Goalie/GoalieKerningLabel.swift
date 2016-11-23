//
//  GoalieTextField.swift
//  Goalie
//
//  Created by Gregory Klein on 1/2/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

/***
   IMPORTANT NOTE: This class is meant to be used for labels in a storyboard or XIB file
***/
class GoalieKerningLabel: UILabel
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      guard let textValue = text else { return }
      
      let attributes = [
         NSFontAttributeName : font,
         NSForegroundColorAttributeName : textColor,
         NSKernAttributeName : 2
      ] as [String : Any]
      
      let attributedString = NSAttributedString(string: textValue, attributes: attributes)
      
      attributedText = attributedString
   }
   
   func updateText(_ text: String)
   {
      let attributes = [
         NSFontAttributeName : font,
         NSForegroundColorAttributeName : textColor,
         NSKernAttributeName : 3
      ] as [String : Any]
      
      attributedText = NSAttributedString(string: text, attributes: attributes)
   }
   
   func updateTextColor(_ color: UIColor)
   {
      let attributes = [
         NSFontAttributeName : font,
         NSForegroundColorAttributeName : color,
         NSKernAttributeName : 3
      ] as [String : Any]
      
      attributedText = NSAttributedString(string: self.text!, attributes: attributes)
   }
   
   func updateKerningValue(_ value: CGFloat)
   {
      let attributes = [
         NSFontAttributeName : font,
         NSForegroundColorAttributeName : textColor,
         NSKernAttributeName : value
      ] as [String : Any]
      
      attributedText = NSAttributedString(string: self.text!, attributes: attributes)
   }
}
