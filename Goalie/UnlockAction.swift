//
//  UnlockAction.swift
//  Goalie
//
//  Created by Gregory Klein on 3/29/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

enum UnlockAction
{
   case purchase(value: CGFloat, id: String), rateApp, createTasks(count: Int), completeList, useAppForWeeks(weeks: Int)
   
   var text: String {
      switch self {
      case .purchase(let value, _): return "Buy $\(value)"
      case .rateApp: return "Rate App"
      case .createTasks(let count): return "Create \(count) tasks to unlock"
      case .completeList: return "1 week of use to unlock"
      case .useAppForWeeks(let weeks):
         let weeksWord = weeks == 1 ? "week" : "weeks"
         return "\(weeks) \(weeksWord) of use to unlock"
      }
   }
}
