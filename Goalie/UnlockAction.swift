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
   case Purchase(value: CGFloat), RateApp, CreateTasks(count: Int), CompleteList
   
   var text: String {
      switch self {
      case .Purchase(let value): return "Buy $\(value)"
      case .RateApp: return "Rate App"
      case .CreateTasks(let count): return "Create \(count) tasks to unlock"
      case .CompleteList: return "Complete a list to unlock"
      }
   }
}