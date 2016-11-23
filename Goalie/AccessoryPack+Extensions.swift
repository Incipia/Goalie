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
      case .none: return "Sometimes all you need is a clean canvas"
      case .home: return "Home, sweet home – nothing like it"
      case .work: return "Get more done with an organized workspace"
      case .gym: return "Make sure your character is ready to sweat"
      }
   }
   
   var title: String {
      switch self {
      case .none: return "Default"
      case .home: return "Home"
      case .work: return "Work"
      case .gym: return "Gym"
      }
   }
   
   var backgroundColor: UIColor {
      switch self {
      case .none: return UIColor(priority: .later)
      case .home: return UIColor(priority: .ages)
      case .work: return UIColor(priority: .later)
      case .gym: return UIColor(priority: .soon)
      }
   }
   
   var iconColor: UIColor {
      switch self {
      case .none: return UIColor(priority: .later, headComponent: .background)
      case .home: return UIColor(priority: .ages, headComponent: .background)
      case .work: return UIColor(priority: .later, headComponent: .background)
      case .gym: return UIColor(priority: .soon, headComponent: .background)
      }
   }
}

extension AccessoryPack
{
   var unlockAction: UnlockAction? {
      switch self {
      case .home: return .createTasks(count: 5)
      case .work: return .useAppForWeeks(weeks: 1)
      case .gym: return .useAppForWeeks(weeks: 2)
      default: return nil
      }
   }
   
   var name: String {
      switch self {
      case .home: return "Home"
      case .work: return "Work"
      case .gym: return "Gym"
      case .none: return "None"
      }
   }
   
   var unlockedTitleText: String {
      return "You've unlocked the \(name) accessory pack!"
   }
   
   var congratulationsTitleText: String {
      switch self {
      case .home: return "You've unlocked the Home accessory pack!"
      case .work: return "Happy one week anniversary!"
      case .gym: return "Work it!"
      case .none: return ""
      }
   }
   
   var unlockedMessageText: String {
      switch self {
      case .home: return "You've created five tasks! Now furnish your pad with the Home accessory pack. You can change and add furniture in the edit menu."
      case .work: return "Way to keep at it. Stay energized with the Work accessory pack. You can change an add furniture in the edit menu."
      case .gym: return "Breaking a sweat getting things done? Refuel with the Gym accessory pack. You can change an add furniture in the edit menu."
      case .none: return "Fuck this shit."
      }
   }
   
   var useToUnlockDurationInSeconds: Int? {
      switch self {
      case .work: return 60 * 60 * 24 * 7
      case .gym: return 60 * 60 * 24 * 14
      default: return nil
      }
   }
}
