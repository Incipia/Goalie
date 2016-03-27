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
   @IBOutlet internal var containerView: UIView!
   
   private(set) var character: GoalieCharacter = .Unknown
   internal var _currentPriority: TaskPriority = .Unknown
   internal var _faceLayer = CharacterFaceLayer()
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      backgroundColor = UIColor.clearColor()
//      backgroundColor = UIColor.purpleColor().colorWithAlphaComponent(0.5)
      containerView.backgroundColor = UIColor.clearColor()
   }
   
   // MARK: - Public
   func updateCharacter(character: GoalieCharacter)
   {
      if self.character != character
      {
         self.character = character
         _updateFaceLayerWithCharacter(character)
         _updateConstraintsWithCharacter(character)
         
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
      _faceLayer.animateForPriority(_currentPriority)
   }
   
   func adjustAnchorPoint(point: CGPoint)
   {
      let oldOrigin = containerView.frame.origin
      containerView.layer.anchorPoint = point
      let newOrigin = containerView.frame.origin
      
      let transition = CGPointMake (newOrigin.x - oldOrigin.x, newOrigin.y - oldOrigin.y)
      centerYConstraint.constant -= transition.y
   }
   
   // MARK: - Private
   private func _updateFaceLayerWithCharacter(c: GoalieCharacter)
   {
      _faceLayer.reset()
      _faceLayer = FaceLayerFactory.layerForCharacter(c)
      _faceLayer.backingContainerLayer = containerView.layer
      
      layer.addSublayer(_faceLayer)
   }
   
   private func _updateConstraintsWithCharacter(c: GoalieCharacter)
   {
      let newSize = CGSize(character: c)
      widthConstraint.constant = newSize.width
      heightConstraint.constant = newSize.height
   }
   
   // MARK: - Overridden
   override func drawRect(rect: CGRect)
   {
      character.drawRect(rect, withPriority: _currentPriority)
   }
}
