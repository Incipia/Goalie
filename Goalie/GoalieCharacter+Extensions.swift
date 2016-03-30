//
//  GoalieCharacter+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 3/29/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

extension GoalieCharacter
{
   var name: String {
      switch self {
      case .Unknown: return "None"
      case .Goalie: return "Goalie"
      case .BizeeBee: return "Bizeebee"
      case .Fox: return "Taskington"
      case .Checklistor: return "Listor"
      }
   }
   
   var subtitle: String {
      switch self {
      case .Unknown: return "None"
      case .Goalie: return "Silly, kind, and ready for adventure"
      case .BizeeBee: return "Wild, dramatic, and a bit passive agressive"
      case .Fox: return "Proper, elegant, and cool as a cucumber"
      case .Checklistor: return "Lovable, clumsy oaf of a sea slug"
      }
   }
}

extension GoalieCharacter
{
   var unlockAction: UnlockAction? {
      switch self {
      case .BizeeBee: return .RateApp
      case .Fox, .Checklistor: return .Purchase(value: 0.99)
      default: return nil
      }
   }
}