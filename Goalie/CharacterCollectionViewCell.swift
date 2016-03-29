//
//  CharacterCollectionViewCell.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

extension GoalieCharacter
{
   var name: String {
      switch self {
      case .Unknown: return "None"
      case .Goalie: return "Goalie"
      case .BizeeBee: return "Bizeebee"
      case .Fox: return "Taskington"
      case .Checklistor: return "Listor"
      }
   }
   
   var subtitle: String {
      switch self {
      case .Unknown: return "None"
      case .Goalie: return "Silly, kind, and ready for adventure"
      case .BizeeBee: return "Wild, dramatic, and a bit passive agressive"
      case .Fox: return "Proper, elegant, and cool as a cucumber"
      case .Checklistor: return "Creepy, nerdy, and wants to watch you sleep"
      }
   }
   
   var actionButtonTitle: String {
      switch self {
      case .Unknown: return ""
      case .Goalie: return "Unlocked"
      case .BizeeBee: return "Rate App"
      case .Fox: return "Buy $.99"
      case .Checklistor: return "Buy $.99"
      }
   }
}

class CharacterCollectionViewCell: UICollectionViewCell
{
   @IBOutlet private weak var _characterView: CharacterView!
   
   @IBOutlet private weak var _nameLabel: GoalieKerningLabel!
   @IBOutlet private weak var _subtitleLabel: UILabel!
   @IBOutlet private weak var _actionButton: GoalieKerningButton!
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
      
      _actionButton.updateKerningValue(1.5)
      _actionButton.layer.cornerRadius = _actionButton.bounds.height * 0.5
      _actionButton.backgroundColor = UIColor(priority: .Later)
      
      _characterView.containerView.transform = CGAffineTransformMakeScale(0.8, 0.8)
      
      _movementAnimator = GoalieMovementAnimator(view: _characterView.containerView)
      let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(Double(CGFloat.randRange(0, upper: 0.9)) * Double(NSEC_PER_SEC)))
      dispatch_after(delayTime, dispatch_get_main_queue()) {
         self._movementAnimator.startAnimating()
      }
   }
   
   func configureWithCharacter(c: GoalieCharacter)
   {
      _character = c
      _characterView.updateCharacter(c)
      _characterView.updateWithPriority(.Later)
      
      UIView.setAnimationsEnabled(false)
      _actionButton.updateText(c.actionButtonTitle.uppercaseString)
      UIView.setAnimationsEnabled(true)
      
      _nameLabel.updateText(c.name.uppercaseString)
      _nameLabel.updateKerningValue(1.5)
      
      _subtitleLabel.text = c.subtitle
      
      if c == .Goalie {
         updateUIForUnlockedState()
      }
      else {
         updateUIForLockedState()
      }
   }
   
   func updateUIForLockedState()
   {
      _characterView.containerView.alpha = 0.5
      _nameLabel.alpha = 0.5
      _subtitleLabel.alpha = 0.5
      
      _unlockedBadgeView.hidden = true
      _actionButton.hidden = false
      
      _nameLabel.updateTextColor(UIColor(rgbValues: (55.0, 76.0, 86.0)))
      _subtitleLabel.textColor = UIColor(rgbValues: (87.0, 123.0, 137.0))
      
      backgroundColor = UIColor.whiteColor()
   }
   
   func updateUIForUnlockedState()
   {
      _characterView.containerView.alpha = 1
      _nameLabel.alpha = 1
      _subtitleLabel.alpha = 1
      
      _unlockedBadgeView.hidden = false
      _actionButton.hidden = true
      
      _nameLabel.updateTextColor(UIColor.whiteColor())
      _subtitleLabel.textColor = UIColor.whiteColor()
      
      backgroundColor = UIColor(priority: .Later)
   }
}
