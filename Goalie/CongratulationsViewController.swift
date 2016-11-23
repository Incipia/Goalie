//
//  CongratulationsViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 1/13/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

protocol CongratulationsViewControllerDelegate: class
{
   func congratulationsViewControllerDidDismiss(_ controller: CongratulationsViewController)
}

class CongratulationsViewController: UIViewController, MenuController
{
   @IBOutlet fileprivate weak var _containerView: UIVisualEffectView!
   @IBOutlet fileprivate weak var _textLabel: UILabel! {
      didSet {
         _textLabel.attributedText = NSAttributedString.congratulationsAttributedString()
      }
   }
   
   var dialogContainer: UIView {
      return _containerView
   }
   
   weak var delegate: CongratulationsViewControllerDelegate?
   
   @IBAction fileprivate func _gotItButtonPressed()
   {
      dismiss(animated: true) { () -> Void in
         self.delegate?.congratulationsViewControllerDidDismiss(self)
      }
   }
}
