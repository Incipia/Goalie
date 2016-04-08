//
//  GoalieCharacter+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 3/29/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

private let FoxPurchaseID = "com.Incipia.Goalie.SirJobton"
private let ChecklistorPurchaseID = "com.Incipia.Goalie.Listor"
private let BizeeBeePurchaseID = "com.Incipia.Goalie.BizeeBee"

extension GoalieCharacter
{
   var name: String {
      switch self {
      case .Unknown: return "None"
      case .Goalie: return "Goalie"
      case .BizeeBee: return "Bizeebee"
      case .Fox: return "Sir Jobton"
      case .Checklistor: return "Listor"
      }
   }
   
   var subtitle: String {
      switch self {
      case .Unknown: return "None"
      case .Goalie: return "Silly, kind, and ready for adventure"
      case .BizeeBee: return "Wild, dramatic, and a bit passive aggressive"
      case .Fox: return "Proper, elegant, and cool as a cucumber"
      case .Checklistor: return "Lovable, clumsy oaf of a sea slug"
      }
   }
}

extension GoalieCharacter
{
   var unlockAction: UnlockAction? {
      switch self {
      case .BizeeBee: return .Purchase(value: 0.99, id: BizeeBeePurchaseID)
      case .Fox: return .Purchase(value: 0.99, id: FoxPurchaseID)
      case .Checklistor: return .Purchase(value: 0.99, id: ChecklistorPurchaseID)
      default: return nil
      }
   }
   
   static func characterForPurchaseID(id: String) -> GoalieCharacter?
   {
      switch id {
      case FoxPurchaseID: return .Fox
      case ChecklistorPurchaseID: return .Checklistor
      case BizeeBeePurchaseID: return .BizeeBee
      default: return nil
      }
   }
}