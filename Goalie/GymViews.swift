//
//  GymViews.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class BricksView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.Bricks)
   }
}

class WeightView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.Weight)
   }
}

class JumpropeView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.Jumprope)
   }
}

class WaterBottleView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.WaterBottle)
   }
}