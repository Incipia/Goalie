//
//  CongratulationsViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 1/13/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController, MenuController
{
   @IBOutlet private weak var _containerView: UIVisualEffectView!
   @IBOutlet private weak var _textLabel: UILabel! {
      didSet {
         _textLabel.attributedText = NSAttributedString.congratulationsAttributedString()
      }
   }
   
   var dialogContainer: UIView {
      return _containerView
   }
   
   @IBAction private func _gotItButtonPressed()
   {
      dismissViewControllerAnimated(true, completion: nil)
   }
}
