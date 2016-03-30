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
   private var _accessoryPack: AccessoryPack = .None
   
   @IBOutlet private weak var _nameLabel: GoalieKerningLabel!
   @IBOutlet private weak var _subtitleLabel: UILabel!
   @IBOutlet private weak var _unlockedBadgeView: UnlockedBadgeView!
   
   @IBOutlet private weak var _accessoryBackgroundView: UIView!
   @IBOutlet private weak var _accessoryView: AccessoryView!
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      backgroundColor = UIColor.whiteColor()
      layer.borderColor = UIColor(white: 0.9, alpha: 1).CGColor
      layer.borderWidth = 1
      layer.cornerRadius = 3.0
      
      _accessoryBackgroundView.layer.cornerRadius = _accessoryBackgroundView.bounds.width * 0.5
   }
   
   func configureWithAccessoryPack(a: AccessoryPack)
   {
      _accessoryPack = a
      _accessoryBackgroundView.backgroundColor = a.backgroundColor
      
      _nameLabel.updateText(a.title.uppercaseString)
      _nameLabel.updateKerningValue(1.5)
      
      _subtitleLabel.text = a.subtitle
      _unlockedBadgeView.hidden = a == .None
      
      if a == .None {
         updateUIForSelectedState()
      }
      else {
         updateUIForDeselectedState()
      }
   }
   
   func updateUIForSelectedState()
   {
      _unlockedBadgeView.alpha = 1

      _nameLabel.updateTextColor(UIColor.whiteColor())
      _subtitleLabel.textColor = UIColor.whiteColor()
      
      backgroundColor = UIColor(priority: .Later)
      _accessoryBackgroundView.backgroundColor = UIColor.whiteColor()
   }
   
   func updateUIForDeselectedState()
   {
      _unlockedBadgeView.alpha = 0.3
      
      _nameLabel.updateTextColor(UIColor(rgbValues: (55.0, 76.0, 86.0)))
      _subtitleLabel.textColor = UIColor(rgbValues: (87.0, 123.0, 137.0))
      
      backgroundColor = UIColor.whiteColor()
      _accessoryBackgroundView.backgroundColor = UIColor(priority: .Later)
   }
}
