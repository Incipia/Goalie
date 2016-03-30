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
   @IBOutlet private weak var _characterView: CharacterView!
   
   @IBOutlet private weak var _nameLabel: GoalieKerningLabel!
   @IBOutlet private weak var _subtitleLabel: UILabel!
   @IBOutlet private weak var _unlockedBadgeView: UnlockedBadgeView!
   
   private var _movementAnimator: GoalieMovementAnimator!
   
   private var _character: GoalieCharacter = .Unknown
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      backgroundColor = UIColor.whiteColor()
      layer.borderColor = UIColor(white: 0.9, alpha: 1).CGColor
      layer.borderWidth = 1
      layer.cornerRadius = 5.0
      
      _characterView.containerView.transform = CGAffineTransformMakeScale(0.8, 0.8)
      
      _movementAnimator = GoalieMovementAnimator(view: _characterView.containerView)
      let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(Double(CGFloat.randRange(0, upper: 0.9)) * Double(NSEC_PER_SEC)))
      dispatch_after(delayTime, dispatch_get_main_queue()) {
         self._movementAnimator.startScalingAnimation()
      }
   }
   
   func configureWithCharacter(c: GoalieCharacter)
   {
      _character = c
      _characterView.updateCharacter(c)
      _characterView.updateWithPriority(.Later)
      
      _nameLabel.updateText(c.name.uppercaseString)
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
      _unlockedBadgeView.alpha = 0.3
      _nameLabel.updateTextColor(UIColor(rgbValues: (55.0, 76.0, 86.0)))
      _subtitleLabel.textColor = UIColor(rgbValues: (87.0, 123.0, 137.0))
      
      backgroundColor = UIColor.whiteColor()
   }
   
   func updateUIForSelectedState()
   {
      _unlockedBadgeView.alpha = 1
      _nameLabel.updateTextColor(UIColor.whiteColor())
      _subtitleLabel.textColor = UIColor.whiteColor()
      
      backgroundColor = UIColor(priority: .Later)
   }
}
