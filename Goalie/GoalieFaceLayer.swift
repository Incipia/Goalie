//
//  GoalieFaceLayer.swift
//  Goalie
//
//  Created by Gregory Klein on 1/11/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class GoalieFaceLayer: CharacterFaceLayer
{
   internal var _teethLayer = CAShapeLayer()
   
   // MARK: - Init
   override func commonInit()
   {
      super.commonInit()
      
      _pathProvider = GoalieFacePathProvider()
      
      _shapeLayers.append(_teethLayer)
      addSublayer(_teethLayer)
      
      // HACK FOR NOW! Only show this for ASAP
      _teethLayer.fillColor = UIColor(red: 0.825, green: 0.803, blue: 0.765, alpha: 0.800).CGColor
      _teethLayer.path = _pathProvider.angryTeethPath
      
      updateWithPriority(.Unknown)
   }
   
   // MARK: - Public
   override func updateWithPriority(priority: TaskPriority)
   {
      super.updateWithPriority(priority)
      
      performBlockWithoutAnimations { () -> Void in
         self._teethLayer.hidden = priority != .ASAP
      }
   }
}
