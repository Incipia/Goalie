//
//  GoalieKerningButton.swift
//  Goalie
//
//  Created by Gregory Klein on 1/2/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

/***
 IMPORTANT NOTE: This class is meant to be used for labels in a storyboard or XIB file
 ***/
class GoalieKerningButton: UIButton
{
   required init?(coder aDecoder: NSCoder)
   {
      super.init(coder: aDecoder)
      guard let label = titleLabel else { return }
      
      let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
      paragraphStyle.alignment = NSTextAlignment.Center
      
      let attributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor,
         NSKernAttributeName : 3,
         NSParagraphStyleAttributeName : paragraphStyle
      ]
      
      let highlightedAttributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor.colorWithAlphaComponent(0.5),
         NSKernAttributeName : 3,
         NSParagraphStyleAttributeName : paragraphStyle
      ]
      
      let attributedString = NSAttributedString(string: label.text ?? "", attributes: attributes)
      let highlightedAttributedString = NSAttributedString(string: label.text ?? "", attributes: highlightedAttributes)
      
      UIView.performWithoutAnimation { () -> Void in
         self.setAttributedTitle(attributedString, forState: .Normal)
         self.setAttributedTitle(highlightedAttributedString, forState: .Highlighted)
      }
   }
   
   func updateText(text: String, color: UIColor)
   {
      guard let label = titleLabel else { return }
      let attributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : color,
         NSKernAttributeName : 3,
      ]
      
      let highlightedAttributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor.colorWithAlphaComponent(0.5),
         NSKernAttributeName : 3,
      ]
      
      let attributedString = NSAttributedString(string: text, attributes: attributes)
      let highlightedAttributedString = NSAttributedString(string: text, attributes: highlightedAttributes)
      
      UIView.performWithoutAnimation { () -> Void in
         self.setAttributedTitle(attributedString, forState: .Normal)
         self.setAttributedTitle(highlightedAttributedString, forState: .Highlighted)
         self.layoutIfNeeded()
      }
   }
   
   func updateText(text: String)
   {
      guard let label = titleLabel else { return }
      let attributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor,
         NSKernAttributeName : 1.5,
      ]
      
      let highlightedAttributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor.colorWithAlphaComponent(0.5),
         NSKernAttributeName : 1.5,
      ]
      
      let attributedString = NSAttributedString(string: text, attributes: attributes)
      let highlightedAttributedString = NSAttributedString(string: text, attributes: highlightedAttributes)
      
      UIView.performWithoutAnimation { () -> Void in
         self.setAttributedTitle(attributedString, forState: .Normal)
         self.setAttributedTitle(highlightedAttributedString, forState: .Highlighted)
         self.layoutIfNeeded()
      }
   }
   
   func updateTextColor(color: UIColor)
   {
      guard let label = titleLabel else { return }
      guard let text = label.text else { return }
      
      let attributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : color,
         NSKernAttributeName : 3
      ]
      
      let highlightedAttributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor.colorWithAlphaComponent(0.5),
         NSKernAttributeName : 3
      ]
      
      let attributedString = NSAttributedString(string: text, attributes: attributes)
      let highlightedAttributedString = NSAttributedString(string: text, attributes: highlightedAttributes)
      
      UIView.performWithoutAnimation { () -> Void in
         self.setAttributedTitle(attributedString, forState: .Normal)
         self.setAttributedTitle(highlightedAttributedString, forState: .Highlighted)
         self.layoutIfNeeded()
      }
   }
   
   func updateKerningValue(value: CGFloat)
   {
      guard let label = titleLabel else { return }
      guard let text = label.text else { return }
      
      let attributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor,
         NSKernAttributeName : value
      ]
      
      let highlightedAttributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor.colorWithAlphaComponent(0.5),
         NSKernAttributeName : value
      ]
      
      let attributedString = NSAttributedString(string: text, attributes: attributes)
      let highlightedAttributedString = NSAttributedString(string: text, attributes: highlightedAttributes)
      
      UIView.performWithoutAnimation { () -> Void in
         self.setAttributedTitle(attributedString, forState: .Normal)
         self.setAttributedTitle(highlightedAttributedString, forState: .Highlighted)
         self.layoutIfNeeded()
      }
   }
}
