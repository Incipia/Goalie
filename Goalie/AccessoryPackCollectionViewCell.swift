//
//  AccessoryPackCollectionViewCell.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

protocol AccessoryPackCollectionViewCellDelegate: class
{
   func actionButtonPressedForAccessoryPack(_ pack: AccessoryPack)
}

class AccessoryPackCollectionViewCell: UICollectionViewCell
{
   fileprivate var _accessoryPack: AccessoryPack = .none
   
   @IBOutlet fileprivate weak var _actionLabel: GoalieKerningLabel!
   @IBOutlet fileprivate weak var _nameLabel: GoalieKerningLabel!
   @IBOutlet fileprivate weak var _subtitleLabel: UILabel!
   @IBOutlet fileprivate weak var _actionButton: GoalieKerningButton!
   
   @IBOutlet fileprivate weak var _accessoryBackgroundView: UIView!
   @IBOutlet fileprivate weak var _accessoryPackBadgeView: AccessoryPackBadgeView!
   
   weak var delegate: AccessoryPackCollectionViewCellDelegate?
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      backgroundColor = UIColor.white
      layer.borderColor = UIColor(white: 0.9, alpha: 1).cgColor
      layer.borderWidth = 1
      layer.cornerRadius = 3.0
      
      _actionButton.updateKerningValue(1.5)
      _actionButton.layer.cornerRadius = _actionButton.bounds.height * 0.5
      _actionButton.backgroundColor = UIColor(priority: .later)
      
      _accessoryBackgroundView.layer.cornerRadius = _accessoryBackgroundView.bounds.width * 0.5
      _accessoryBackgroundView.backgroundColor = UIColor(priority: .later)
   }
   
   func configureWithAccessoryPack(_ a: AccessoryPack)
   {
      _accessoryPack = a
      _accessoryPackBadgeView.accessory = a
      _accessoryBackgroundView.backgroundColor = a.backgroundColor
      
      _updateActionButtonAndLabelWithAccessoryPack(a)
      _updateNameAndSubtitleWithAccessoryPack(a)
      
      updateUIForLockedState()
   }
   
   func updateUIForLockedState()
   {
      _nameLabel.alpha = 0.5
      _subtitleLabel.alpha = 0.5
      _accessoryBackgroundView.alpha = 0.5
      
      _nameLabel.updateTextColor(UIColor(rgbValues: (55.0, 76.0, 86.0)))
      _subtitleLabel.textColor = UIColor(rgbValues: (87.0, 123.0, 137.0))
      
      backgroundColor = UIColor.white
   }
   
   @IBAction fileprivate func _actionButtonPressed()
   {
      delegate?.actionButtonPressedForAccessoryPack(_accessoryPack)
   }
   
   // MARK: - Private
   fileprivate func _updateActionButtonAndLabelWithAccessoryPack(_ a: AccessoryPack)
   {
      if let action = a.unlockAction {
         switch action {
         case .purchase(_), .rateApp:
            _actionButton.updateText(action.text.uppercased())
            _actionButton.isHidden = false
            _actionLabel.isHidden = true
         default:
            _actionLabel.updateText(action.text.uppercased())
            _actionLabel.isHidden = false
            _actionButton.isHidden = true
         }
         _actionButton.updateKerningValue(1.5)
         _actionLabel.updateKerningValue(1)
      }
   }
   
   fileprivate func _updateNameAndSubtitleWithAccessoryPack(_ a: AccessoryPack)
   {
      _nameLabel.updateText(a.title.uppercased())
      _nameLabel.updateKerningValue(1.5)
      _subtitleLabel.text = a.subtitle
   }
}
