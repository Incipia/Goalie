//
//  BizeeBeeFaceLayer.swift
//  Goalie
//
//  Created by Gregory Klein on 2/9/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class BizeeBeeFaceLayer: CharacterFaceLayer
{
   override func commonInit()
   {
      super.commonInit()
      _pathProvider = BizeeBeeFacePathProvider()
   }
}
