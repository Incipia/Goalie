//
//  FoxFaceLayer.swift
//  Goalie
//
//  Created by Gregory Klein on 3/25/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class FoxFaceLayer: CharacterFaceLayer
{
   // MARK: - Init
   override func commonInit()
   {
      super.commonInit()
      
      _pathProvider = FoxFacePathProvider()
      _mouthLayer.removeFromSuperlayer()
      
      updateWithPriority(.unknown)
   }
   
   // MARK: - Public
   override func updateWithPriority(_ priority: TaskPriority)
   {
      super.updateWithPriority(priority)
   }
}
