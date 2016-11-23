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
   
   fileprivate(set) var character: GoalieCharacter = .unknown
   internal var _currentPriority: TaskPriority = .unknown
   internal var _faceLayer = CharacterFaceLayer()
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      backgroundColor = UIColor.clear
      containerView.backgroundColor = UIColor.clear
   }
   
   // MARK: - Public
   func updateCharacter(_ character: GoalieCharacter)
   {
      if self.character != character
      {
         self.character = character
         _updateFaceLayerWithCharacter(character)
         _updateConstraintsWithCharacter(character)
         
         updateWithPriority(_currentPriority)
      }
   }
   
   func updateWithPriority(_ priority: TaskPriority)
   {
      _currentPriority = priority
      
      _faceLayer.updateWithPriority(priority)
      setNeedsDisplay()
   }
   
   func animateFace()
   {
      _faceLayer.animateForPriority(_currentPriority)
   }
   
   func adjustAnchorPoint(_ point: CGPoint)
   {
      let oldOrigin = containerView.frame.origin
      containerView.layer.anchorPoint = point
      let newOrigin = containerView.frame.origin
      
      let transition = CGPoint (x: newOrigin.x - oldOrigin.x, y: newOrigin.y - oldOrigin.y)
      centerYConstraint.constant -= transition.y
   }
   
   // MARK: - Private
   fileprivate func _updateFaceLayerWithCharacter(_ c: GoalieCharacter)
   {
      _faceLayer.reset()
      _faceLayer = FaceLayerFactory.layerForCharacter(c)
      _faceLayer.backingContainerLayer = containerView.layer
      
      layer.addSublayer(_faceLayer)
   }
   
   fileprivate func _updateConstraintsWithCharacter(_ c: GoalieCharacter)
   {
      let newSize = CGSize(character: c)
      widthConstraint.constant = newSize.width
      heightConstraint.constant = newSize.height
   }
   
   // MARK: - Overridden
   override func draw(_ rect: CGRect)
   {
      character.drawRect(rect, withPriority: _currentPriority)
   }
}
