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
      updateAccessory(.Clock)
   }
}

class PlantView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.Plant)
   }
}

class SodaView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.Soda)
   }
}

class HomeWindowView: AccessoryView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      updateAccessory(.HomeWindow)
   }
}