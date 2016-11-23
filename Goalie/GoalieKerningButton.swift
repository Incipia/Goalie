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
      
      let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
      paragraphStyle.alignment = NSTextAlignment.center
      
      let attributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor,
         NSKernAttributeName : 3,
         NSParagraphStyleAttributeName : paragraphStyle
      ] as [String : Any]
      
      let highlightedAttributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor.withAlphaComponent(0.5),
         NSKernAttributeName : 3,
         NSParagraphStyleAttributeName : paragraphStyle
      ] as [String : Any]
      
      let attributedString = NSAttributedString(string: label.text ?? "", attributes: attributes)
      let highlightedAttributedString = NSAttributedString(string: label.text ?? "", attributes: highlightedAttributes)
      
      UIView.performWithoutAnimation { () -> Void in
         self.setAttributedTitle(attributedString, for: UIControlState())
         self.setAttributedTitle(highlightedAttributedString, for: .highlighted)
      }
   }
   
   func updateText(_ text: String, color: UIColor)
   {
      guard let label = titleLabel else { return }
      let attributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : color,
         NSKernAttributeName : 3,
      ] as [String : Any]
      
      let highlightedAttributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor.withAlphaComponent(0.5),
         NSKernAttributeName : 3,
      ] as [String : Any]
      
      let attributedString = NSAttributedString(string: text, attributes: attributes)
      let highlightedAttributedString = NSAttributedString(string: text, attributes: highlightedAttributes)
      
      UIView.performWithoutAnimation { () -> Void in
         self.setAttributedTitle(attributedString, for: UIControlState())
         self.setAttributedTitle(highlightedAttributedString, for: .highlighted)
         self.layoutIfNeeded()
      }
   }
   
   func updateText(_ text: String)
   {
      guard let label = titleLabel else { return }
      let attributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor,
         NSKernAttributeName : 1.5,
      ] as [String : Any]
      
      let highlightedAttributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor.withAlphaComponent(0.5),
         NSKernAttributeName : 1.5,
      ] as [String : Any]
      
      let attributedString = NSAttributedString(string: text, attributes: attributes)
      let highlightedAttributedString = NSAttributedString(string: text, attributes: highlightedAttributes)
      
      UIView.performWithoutAnimation { () -> Void in
         self.setAttributedTitle(attributedString, for: UIControlState())
         self.setAttributedTitle(highlightedAttributedString, for: .highlighted)
         self.layoutIfNeeded()
      }
   }
   
   func updateTextColor(_ color: UIColor)
   {
      guard let label = titleLabel else { return }
      guard let text = label.text else { return }
      
      let attributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : color,
         NSKernAttributeName : 3
      ] as [String : Any]
      
      let highlightedAttributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor.withAlphaComponent(0.5),
         NSKernAttributeName : 3
      ] as [String : Any]
      
      let attributedString = NSAttributedString(string: text, attributes: attributes)
      let highlightedAttributedString = NSAttributedString(string: text, attributes: highlightedAttributes)
      
      UIView.performWithoutAnimation { () -> Void in
         self.setAttributedTitle(attributedString, for: UIControlState())
         self.setAttributedTitle(highlightedAttributedString, for: .highlighted)
         self.layoutIfNeeded()
      }
   }
   
   func updateKerningValue(_ value: CGFloat)
   {
      guard let label = titleLabel else { return }
      guard let text = label.text else { return }
      
      let attributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor,
         NSKernAttributeName : value
      ] as [String : Any]
      
      let highlightedAttributes = [
         NSFontAttributeName : label.font,
         NSForegroundColorAttributeName : label.textColor.withAlphaComponent(0.5),
         NSKernAttributeName : value
      ] as [String : Any]
      
      let attributedString = NSAttributedString(string: text, attributes: attributes)
      let highlightedAttributedString = NSAttributedString(string: text, attributes: highlightedAttributes)
      
      UIView.performWithoutAnimation { () -> Void in
         self.setAttributedTitle(attributedString, for: UIControlState())
         self.setAttributedTitle(highlightedAttributedString, for: .highlighted)
         self.layoutIfNeeded()
      }
   }
}
