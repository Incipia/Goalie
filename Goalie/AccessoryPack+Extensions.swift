//
//  AccessoryPack+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 3/29/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

extension AccessoryPack
{
   var subtitle: String {
      switch self {
      case .None: return "Sometimes all you need is a clean canvas"
      case .Home: return "Home, sweet home – nothing like it"
      case .Work: return "Get more done with an organized workspace"
      case .Gym: return "Make sure your character is ready to sweat"
      }
   }
   
   var title: String {
      switch self {
      case .None: return "Default"
      case .Home: return "Home"
      case .Work: return "Work"
      case .Gym: return "Gym"
      }
   }
   
   var backgroundColor: UIColor {
      switch self {
      case .None: return UIColor(priority: .Later)
      case .Home: return UIColor(priority: .Ages)
      case .Work: return UIColor(priority: .Later)
      case .Gym: return UIColor(priority: .Soon)
      }
   }
   
   var iconColor: UIColor {
      switch self {
      case .None: return UIColor(priority: .Later, headComponent: .Background)
      case .Home: return UIColor(priority: .Ages, headComponent: .Background)
      case .Work: return UIColor(priority: .Later, headComponent: .Background)
      case .Gym: return UIColor(priority: .Soon, headComponent: .Background)
      }
   }
}

extension AccessoryPack
{
   var unlockAction: UnlockAction? {
      switch self {
      case .Home: return .CreateTasks(count: 5)
      case .Work: return .CompleteList
      case .Gym: return .Purchase(value: 0.99)
      default: return nil
      }
   }
}