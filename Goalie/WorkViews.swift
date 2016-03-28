//
//  WorkViews.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class WorkClockView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.WorkClock)
   }
}

class LampView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.Lamp)
   }
}

class ComputerView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.Computer)
   }
}

class WorkWindowView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.WorkWindow)
   }
}