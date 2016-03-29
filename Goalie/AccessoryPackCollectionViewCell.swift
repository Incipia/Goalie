//
//  AccessoryPackCollectionViewCell.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class AccessoryPackCollectionViewCell: UICollectionViewCell
{
   private var _accessoryPack: AccessoryPack = .None
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      backgroundColor = UIColor.whiteColor()
      layer.borderColor = UIColor(white: 0.9, alpha: 1).CGColor
      layer.borderWidth = 1
      layer.cornerRadius = 3.0
   }
   
   func configureWithAccessoryPack(a: AccessoryPack)
   {
      _accessoryPack = a
   }
}
