//
//  HomeViews.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class ClockView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.clock)
   }
}

class PlantView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.plant)
   }
}

class SodaView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.soda)
   }
}

class HomeWindowView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.homeWindow)
   }
}
