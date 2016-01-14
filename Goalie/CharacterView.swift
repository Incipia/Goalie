//
//  CharacterView.swift
//  Goalie
//
//  Created by Gregory Klein on 1/14/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class CharacterView: UIView
{
   @IBOutlet internal var widthConstraint: NSLayoutConstraint!
   @IBOutlet internal var heightConstraint: NSLayoutConstraint!
   @IBOutlet internal var centerYConstraint: NSLayoutConstraint!
   
   private var _character: GoalieCharacter = .Unknown
   internal var _currentPriority: TaskPriority = .Unknown
   internal var _faceLayer = CharacterFaceLayer()
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      updateCharacter(.Goalie)
      backgroundColor = UIColor.clearColor()
   }
   
   // MARK: - Public
   func updateCharacter(character: GoalieCharacter)
   {
      if _character != character {
         _character = character
         
         _faceLayer.removeAllAnimations()
         _faceLayer.removeFromSuperlayer()
         switch character {
         case .Unknown: _faceLayer = CharacterFaceLayer()
         case .Goalie: _faceLayer = GoalieFaceLayer()
         }
         layer.addSublayer(_faceLayer)
         updateWithPriority(_currentPriority)
      }
   }
   
   func updateWithPriority(priority: TaskPriority)
   {
      _currentPriority = priority
      
      _faceLayer.updateWithPriority(priority)
      setNeedsDisplay()
   }
   
   func animateFace()
   {
      _faceLayer.updateWithPriority(_currentPriority)
   }
   
   func adjustAnchorPoint(point: CGPoint)
   {
      let oldOrigin = frame.origin
      layer.anchorPoint = point
      let newOrigin = frame.origin
      
      let transition = CGPointMake (newOrigin.x - oldOrigin.x, newOrigin.y - oldOrigin.y)
      centerYConstraint.constant -= transition.y
   }
   
   // MARK: - Overridden
   override func drawRect(rect: CGRect)
   {
      _character.drawRect(rect, withPriority: _currentPriority)
   }
}
