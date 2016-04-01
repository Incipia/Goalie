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
   case Purchase(value: CGFloat, id: String), RateApp, CreateTasks(count: Int), CompleteList, UseAppForWeeks(weeks: Int)
   
   var text: String {
      switch self {
      case .Purchase(let value, _): return "Buy $\(value)"
      case .RateApp: return "Rate App"
      case .CreateTasks(let count): return "Create \(count) tasks to unlock"
      case .CompleteList: return "1 week of use to unlock"
      case .UseAppForWeeks(let weeks):
         let weeksWord = weeks == 1 ? "week" : "weeks"
         return "\(weeks) \(weeksWord) of use to unlock"
      }
   }
}