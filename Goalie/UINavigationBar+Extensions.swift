//
//  UINavigationBar+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/4/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

extension UINavigationBar
{
   public var leftBarButtonItem: UIBarButtonItem? {
      get {
         return self.items?.first?.leftBarButtonItem
      }
      set {
         let barButtonItemAttrs = [
            NSFontAttributeName : UIFont.mediumGoalieFontWithSize(16),
            NSForegroundColorAttributeName : UIColor.white
         ]
         newValue?.setTitleTextAttributes(barButtonItemAttrs, for: UIControlState())
         self.items?.first?.leftBarButtonItem = newValue
      }
   }
   
   public var rightBarButtonItem: UIBarButtonItem? {
      return self.items?.first?.rightBarButtonItem
   }
   
   func hideBottomHairline()
   {
      let navigationBarImageView = hairlineImageViewInNavigationBar(self)
      navigationBarImageView!.isHidden = true
   }
   
   func showBottomHairline()
   {
      let navigationBarImageView = hairlineImageViewInNavigationBar(self)
      navigationBarImageView!.isHidden = false
   }
   
   fileprivate func hairlineImageViewInNavigationBar(_ view: UIView) -> UIImageView?
   {
      if view.isKind(of: UIImageView.self) && view.bounds.height <= 1.0 {
         return (view as! UIImageView)
      }
      
      let subviews = (view.subviews)
      for subview: UIView in subviews {
         if let imageView: UIImageView = hairlineImageViewInNavigationBar(subview) {
            return imageView
         }
      }
      return nil
   }
   
   func makeTransparent()
   {
      self.setBackgroundImage(UIImage(), for: .default)
      self.backgroundColor = UIColor.clear
      self.isTranslucent = true
   }
}
