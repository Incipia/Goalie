//
//  UnlockedAccessoryPackViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 3/31/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

protocol UnlockedAccessoryPackViewControllerDelegate: class
{
   func unlockedAccessoryPackViewControllerIgnoreButtonPressed(_ controller: UnlockedAccessoryPackViewController)
   func unlockedAccessoryPackViewControllerUnlockButtonPressed(_ controller: UnlockedAccessoryPackViewController)
}

class UnlockedAccessoryPackViewController: UIViewController, MenuController
{
   @IBOutlet fileprivate weak var _titleLabel: UILabel!
   @IBOutlet fileprivate weak var _messageLabel: UILabel!
   @IBOutlet fileprivate weak var _containerView: UIVisualEffectView!
   
   @IBOutlet fileprivate weak var _accessoryPackBackgroundView: CongratulatingUnlockedAccessoryPackBackgroundView!
   @IBOutlet fileprivate weak var _accessoryPackBadgeView: AccessoryPackBadgeView!
   
   var accessoryPack: AccessoryPack = .none
   
   var dialogContainer: UIView {
      return _containerView
   }
   
   weak var delegate: UnlockedAccessoryPackViewControllerDelegate?
   
   // MARK: - Overridden
   override func viewDidLoad()
   {
      super.viewDidLoad()
      _updateViewsWithAccessoryPack(accessoryPack)
      _updateLabelsWithAccessoryPack(accessoryPack)
   }
   
   override var preferredStatusBarStyle : UIStatusBarStyle
   {
      return .lightContent
   }
   
   // MARK: - IBActions
   @IBAction fileprivate func _ignoreButtonPressed()
   {
      delegate?.unlockedAccessoryPackViewControllerIgnoreButtonPressed(self)
   }
   
   @IBAction fileprivate func _unlockButtonPressed()
   {
      delegate?.unlockedAccessoryPackViewControllerUnlockButtonPressed(self)
   }
   
   @IBAction fileprivate func _viewTapped(_ recognizer: UITapGestureRecognizer)
   {
      let touchLocation = recognizer.location(in: nil)
      guard !_containerView.frame.contains(touchLocation) else { return }
      
      _ignoreButtonPressed()
   }
   
   // MARK: - Private
   fileprivate func _updateLabelsWithAccessoryPack(_ pack: AccessoryPack)
   {
      _titleLabel.text = pack.congratulationsTitleText
      _messageLabel.attributedText = NSAttributedString.unlockedAccessoryPackAttributedString(pack)
   }
   
   fileprivate func _updateViewsWithAccessoryPack(_ pack: AccessoryPack)
   {
      _accessoryPackBadgeView.accessory = pack
      _accessoryPackBackgroundView.accessory = pack
   }
   
   // MARK: - Public
   func updateAccessoryPack(_ pack: AccessoryPack)
   {
      accessoryPack = pack
      _updateViewsWithAccessoryPack(pack)
      _updateLabelsWithAccessoryPack(pack)
   }
}
