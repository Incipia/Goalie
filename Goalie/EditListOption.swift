//
//  EditListOption.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

enum EditListOption
{
   case Characters, AccessoryPacks
   
   var title: String {
      switch self {
      case .Characters: return "Characters"
      case .AccessoryPacks: return "Accessory Packs"
      }
   }
   
   var subtitle: String {
      switch self {
      case .Characters: return "Pick a character to chat with and help keep you motivated and entertained"
      case .AccessoryPacks: return "Spruce up your character's space with furniture that matches your goals"
      }
   }
   
   var characters: [GoalieCharacter] {
      switch self {
      case .Characters: return [.Goalie, .BizeeBee, .Fox, .Checklistor]
      default: return []
      }
   }
   
   var accessoryPacks: [AccessoryPack] {
      switch self {
      case .AccessoryPacks: return [.None, .Home, .Work, .Gym]
      default: return []
      }
   }
}
