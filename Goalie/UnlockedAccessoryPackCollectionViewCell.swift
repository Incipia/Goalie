//
//  UnlockedAccessoryPackCollectionViewCell.swift
//  Goalie
//
//  Created by Gregory Klein on 3/29/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class UnlockedAccessoryPackCollectionViewCell: UICollectionViewCell
{
   fileprivate var _accessoryPack: AccessoryPack = .none
   
   @IBOutlet fileprivate weak var _nameLabel: GoalieKerningLabel!
   @IBOutlet fileprivate weak var _subtitleLabel: UILabel!
   @IBOutlet fileprivate weak var _unlockedBadgeView: UnlockedBadgeView!
   
   @IBOutlet fileprivate weak var _accessoryBackgroundView: UIView!
   @IBOutlet fileprivate weak var _accessoryPackBadgeView: AccessoryPackBadgeView!
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      backgroundColor = UIColor.white
      layer.borderColor = UIColor(white: 0.9, alpha: 1).cgColor
      layer.borderWidth = 1
		layer.cornerRadius = 3.0
		_accessoryBackgroundView.layer.cornerRadius = 35
   }
   
   func configureWithAccessoryPack(_ a: AccessoryPack)
   {
      _accessoryPack = a
      _accessoryPackBadgeView.accessory = a
      _accessoryBackgroundView.backgroundColor = a.backgroundColor
      
      _nameLabel.updateText(a.title.uppercased())
      _nameLabel.updateKerningValue(1.5)
      
      _subtitleLabel.text = a.subtitle
      _unlockedBadgeView.isHidden = a == .none
      
      if a == AccessoryPackManager.currentAccessoryPack {
         updateUIForSelectedState()
      }
      else {
         updateUIForDeselectedState()
      }
   }
   
   func updateUIForSelectedState()
   {
      _unlockedBadgeView.selected = true
      _accessoryPackBadgeView.selected = true
      _unlockedBadgeView.alpha = 1
      _accessoryBackgroundView.alpha = 1

      _nameLabel.updateTextColor(UIColor.white)
      _subtitleLabel.textColor = UIColor.white
      
      backgroundColor = UIColor(priority: .later)
      _accessoryBackgroundView.backgroundColor = UIColor.white
   }
   
   func updateUIForDeselectedState()
   {
      _unlockedBadgeView.selected = false
      _accessoryPackBadgeView.selected = false
      _accessoryBackgroundView.alpha = 0.5
      
      _nameLabel.updateTextColor(UIColor(rgbValues: (55.0, 76.0, 86.0)))
      _subtitleLabel.textColor = UIColor(rgbValues: (87.0, 123.0, 137.0))
      
      backgroundColor = UIColor.white
      _accessoryBackgroundView.backgroundColor = _accessoryPack.backgroundColor
   }
}
