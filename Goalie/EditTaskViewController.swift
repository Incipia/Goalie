//
//  EditTaskViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 12/29/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController
{
   @IBOutlet private weak var _detailsContainerView: UIVisualEffectView!
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
      
      _detailsContainerView.layer.shadowColor = UIColor.blackColor().CGColor
      _detailsContainerView.layer.shadowOpacity = 0.2
      _detailsContainerView.layer.shadowOffset = CGSize(width: 0, height: 4)
      _detailsContainerView.layer.shadowRadius = 4
   }
   
   override func preferredStatusBarStyle() -> UIStatusBarStyle
   {
      return .LightContent
   }
}
