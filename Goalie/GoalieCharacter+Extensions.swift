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
      case .unknown: return "None"
      case .goalie: return "Goalie"
      case .bizeeBee: return "Bizeebee"
      case .fox: return "Sir Jobton"
      case .checklistor: return "Listor"
      }
   }
   
   var subtitle: String {
      switch self {
      case .unknown: return "None"
      case .goalie: return "Silly, kind, and ready for adventure"
      case .bizeeBee: return "Wild, dramatic, and a bit passive aggressive"
      case .fox: return "Proper, elegant, and cool as a cucumber"
      case .checklistor: return "Lovable, clumsy oaf of a sea slug"
      }
   }
}

extension GoalieCharacter
{
   var unlockAction: UnlockAction? {
      switch self {
      case .bizeeBee: return .purchase(value: 0.99, id: BizeeBeePurchaseID)
      case .fox: return .purchase(value: 0.99, id: FoxPurchaseID)
      case .checklistor: return .purchase(value: 0.99, id: ChecklistorPurchaseID)
      default: return nil
      }
   }
   
   static func characterForPurchaseID(_ id: String) -> GoalieCharacter?
   {
      switch id {
      case FoxPurchaseID: return .fox
      case ChecklistorPurchaseID: return .checklistor
      case BizeeBeePurchaseID: return .bizeeBee
      default: return nil
      }
   }
}
