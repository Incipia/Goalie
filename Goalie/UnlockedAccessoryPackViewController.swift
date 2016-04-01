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
   func unlockedAccessoryPackViewControllerIgnoreButtonPressed(controller: UnlockedAccessoryPackViewController)
   func unlockedAccessoryPackViewControllerUnlockButtonPressed(controller: UnlockedAccessoryPackViewController)
}

class UnlockedAccessoryPackViewController: UIViewController, MenuController
{
   @IBOutlet private weak var _titleLabel: UILabel!
   @IBOutlet private weak var _messageLabel: UILabel!
   @IBOutlet private weak var _containerView: UIVisualEffectView!
   
   @IBOutlet private weak var _accessoryPackBackgroundView: CongratulatingUnlockedAccessoryPackBackgroundView!
   @IBOutlet private weak var _accessoryPackBadgeView: AccessoryPackBadgeView!
   
   var accessoryPack: AccessoryPack = .None
   
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
   
   override func preferredStatusBarStyle() -> UIStatusBarStyle
   {
      return .LightContent
   }
   
   // MARK: - IBActions
   @IBAction private func _ignoreButtonPressed()
   {
      delegate?.unlockedAccessoryPackViewControllerIgnoreButtonPressed(self)
   }
   
   @IBAction private func _unlockButtonPressed()
   {
      delegate?.unlockedAccessoryPackViewControllerUnlockButtonPressed(self)
   }
   
   @IBAction private func _viewTapped(recognizer: UITapGestureRecognizer)
   {
      let touchLocation = recognizer.locationInView(nil)
      guard !_containerView.frame.contains(touchLocation) else { return }
      
      _ignoreButtonPressed()
   }
   
   // MARK: - Private
   private func _updateLabelsWithAccessoryPack(pack: AccessoryPack)
   {
      _titleLabel.text = pack.congratulationsTitleText
      _messageLabel.attributedText = NSAttributedString.unlockedAccessoryPackAttributedString(pack)
   }
   
   private func _updateViewsWithAccessoryPack(pack: AccessoryPack)
   {
      _accessoryPackBadgeView.accessory = pack
      _accessoryPackBackgroundView.accessory = pack
   }
   
   // MARK: - Public
   func updateAccessoryPack(pack: AccessoryPack)
   {
      accessoryPack = pack
      _updateViewsWithAccessoryPack(pack)
      _updateLabelsWithAccessoryPack(pack)
   }
}
