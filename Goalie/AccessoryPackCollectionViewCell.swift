//
//  AccessoryPackCollectionViewCell.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class AccessoryPackCollectionViewCell: UICollectionViewCell
{
   private var _accessoryPack: AccessoryPack = .None
   
   @IBOutlet private weak var _actionLabel: GoalieKerningLabel!
   @IBOutlet private weak var _nameLabel: GoalieKerningLabel!
   @IBOutlet private weak var _subtitleLabel: UILabel!
   @IBOutlet private weak var _actionButton: GoalieKerningButton!
   
   @IBOutlet private weak var _accessoryBackgroundView: UIView!
   @IBOutlet private weak var _accessoryView: AccessoryView!
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      backgroundColor = UIColor.whiteColor()
      layer.borderColor = UIColor(white: 0.9, alpha: 1).CGColor
      layer.borderWidth = 1
      layer.cornerRadius = 3.0
      
      _actionButton.updateKerningValue(1.5)
      _actionButton.layer.cornerRadius = _actionButton.bounds.height * 0.5
      _actionButton.backgroundColor = UIColor(priority: .Later)
      
      _accessoryBackgroundView.layer.cornerRadius = _accessoryBackgroundView.bounds.width * 0.5
      _accessoryBackgroundView.backgroundColor = UIColor(priority: .Later)
   }
   
   func configureWithAccessoryPack(a: AccessoryPack)
   {
      _accessoryPack = a
      _accessoryBackgroundView.backgroundColor = a.backgroundColor
      
      print(a.unlockAction?.text)
      _updateActionButtonAndLabelWithAccessoryPack(a)
      _updateNameAndSubtitleWithAccessoryPack(a)
      
      if a == .None {
         updateUIForUnlockedState()
      }
      else {
         updateUIForLockedState()
      }
   }
   
   func updateUIForLockedState()
   {
      _nameLabel.alpha = 0.5
      _subtitleLabel.alpha = 0.5
      _accessoryBackgroundView.alpha = 0.5
      
      _nameLabel.updateTextColor(UIColor(rgbValues: (55.0, 76.0, 86.0)))
      _subtitleLabel.textColor = UIColor(rgbValues: (87.0, 123.0, 137.0))
      
      backgroundColor = UIColor.whiteColor()
   }
   
   func updateUIForUnlockedState()
   {
      _nameLabel.alpha = 1
      _subtitleLabel.alpha = 1
      _accessoryBackgroundView.alpha = 1
      
      _nameLabel.updateTextColor(UIColor.whiteColor())
      _subtitleLabel.textColor = UIColor.whiteColor()
   }
   
   // MARK: - Private
   private func _updateActionButtonAndLabelWithAccessoryPack(a: AccessoryPack)
   {
      if let action = a.unlockAction {
         switch action {
         case .Purchase(_), .RateApp:
            _actionButton.updateText(action.text.uppercaseString)
            _actionLabel.hidden = true
         default:
            _actionLabel.updateText(action.text.uppercaseString)
            _actionButton.hidden = true
         }
         _actionButton.updateKerningValue(1.5)
         _actionLabel.updateKerningValue(1)
      }
   }
   
   private func _updateNameAndSubtitleWithAccessoryPack(a: AccessoryPack)
   {
      _nameLabel.updateText(a.title.uppercaseString)
      _nameLabel.updateKerningValue(1.5)
      _subtitleLabel.text = a.subtitle
   }
}
