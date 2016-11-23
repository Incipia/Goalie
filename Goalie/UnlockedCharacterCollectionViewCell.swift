//
//  UnlockedCharacterCollectionViewCell.swift
//  Goalie
//
//  Created by Gregory Klein on 3/29/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class UnlockedCharacterCollectionViewCell: UICollectionViewCell
{
   @IBOutlet fileprivate weak var _characterView: CharacterView!
   
   @IBOutlet fileprivate weak var _nameLabel: GoalieKerningLabel!
   @IBOutlet fileprivate weak var _subtitleLabel: UILabel!
   @IBOutlet fileprivate weak var _unlockedBadgeView: UnlockedBadgeView!
   
   fileprivate var _movementAnimator: GoalieMovementAnimator!
   
   fileprivate var _character: GoalieCharacter = .unknown
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      backgroundColor = UIColor.white
      layer.borderColor = UIColor(white: 0.9, alpha: 1).cgColor
      layer.borderWidth = 1
      layer.cornerRadius = 5.0
      
      _characterView.containerView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
      
      _movementAnimator = GoalieMovementAnimator(view: _characterView.containerView)
      let delayTime = DispatchTime.now() + Double(Int64(Double(CGFloat.randRange(0, upper: 0.9)) * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
      DispatchQueue.main.asyncAfter(deadline: delayTime) {
         self._movementAnimator.startScalingAnimation()
      }
   }
   
   func configureWithCharacter(_ c: GoalieCharacter)
   {
      _character = c
      _characterView.updateCharacter(c)
      _characterView.updateWithPriority(.later)
      
      _nameLabel.updateText(c.name.uppercased())
      _nameLabel.updateKerningValue(1.5)
      
      _subtitleLabel.text = c.subtitle
      
      if c == CharacterManager.currentCharacter {
         updateUIForSelectedState()
         _characterView.animateFace()
      }
      else {
         updateUIForDeselectedState()
      }
   }
   
   func updateUIForDeselectedState()
   {
      _unlockedBadgeView.selected = false
      _nameLabel.updateTextColor(UIColor(rgbValues: (55.0, 76.0, 86.0)))
      _subtitleLabel.textColor = UIColor(rgbValues: (87.0, 123.0, 137.0))
      
      backgroundColor = UIColor.white
   }
   
   func updateUIForSelectedState()
   {
      _unlockedBadgeView.selected = true
      _nameLabel.updateTextColor(UIColor.white)
      _subtitleLabel.textColor = UIColor.white
      
      backgroundColor = UIColor(priority: .later)
   }
}
