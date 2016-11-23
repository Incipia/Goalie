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
      updateAccessory(.workClock)
   }
}

class LampView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.lamp)
   }
}

class ComputerView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.computer)
   }
}

class WorkWindowView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.workWindow)
   }
}
