//
//  AccessoryPack+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 3/29/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

private let GymPurchaseID = "com.Incipia.Goalie.GymAccessoryPack"

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
      case .Work: return .UseAppForWeeks(weeks: 1)
      case .Gym: return .UseAppForWeeks(weeks: 2)
      default: return nil
      }
   }
   
   var name: String {
      switch self {
      case .Home: return "Home"
      case .Work: return "Work"
      case .Gym: return "Gym"
      case .None: return "None"
      }
   }
   
   var unlockedTitleText: String {
      return "You've unlocked the \(name) accessory pack!"
   }
   
   var congratulationsTitleText: String {
      switch self {
      case .Home: return "You've unlocked the Home accessory pack!"
      case .Work: return "Happy one week anniversary!"
      case .Gym: return "Work it!"
      case .None: return ""
      }
   }
   
   var unlockedMessageText: String {
      switch self {
      case .Home: return "You've created five tasks! Now furnish your pad with the Home accessory pack. You can change and add furniture in the edit menu."
      case .Work: return "Way to keep at it. Stay energized with the Work accessory pack. You can change an add furniture in the edit menu."
      case .Gym: return "Breaking a sweat getting things done? Refuel with the Gym accessory pack. You can change an add furniture in the edit menu."
      case .None: return "Fuck this shit."
      }
   }
   
   var useToUnlockDurationInSeconds: Int? {
      switch self {
      case .Work: return 60 * 60 * 24 * 7
      case .Gym: return 60 * 60 * 24 * 14
      default: return nil
      }
   }
   
   static func accessoryPackForPurchaseID(id: String) -> AccessoryPack?
   {
      switch id {
      case GymPurchaseID: return .Gym
      default: return nil
      }
   }
}