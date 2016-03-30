//
//  AccessoryPackManager.swift
//  Goalie
//
//  Created by Gregory Klein on 3/29/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

private let CurrentAccessoryPackKey = "GoalieCurrentAccessoryPackKey"
private let UnlockedAccessoryPacksKey = "GoalieUnlockedAccessoryPacksKey"

private let defaultAccessoryPackRawValue = AccessoryPack.None.rawValue
private let defaultUnlockedAccessoryPacksRawValue: [Int] = [AccessoryPack.None.rawValue]

class AccessoryPackManager
{
   static var currentAccessoryPack: AccessoryPack {
      var current = defaultAccessoryPackRawValue
      if let _ = NSUserDefaults.standardUserDefaults().objectForKey(CurrentAccessoryPackKey) {
         current = NSUserDefaults.standardUserDefaults().integerForKey(CurrentAccessoryPackKey)
      }
      
      let accessoryPack = AccessoryPack(rawValue: current)
      return accessoryPack ?? AccessoryPack.None
   }
   
   static func updateCurrentAccessoryPack(a: AccessoryPack) -> Bool
   {
      var didSet = false
      if a != currentAccessoryPack {
         NSUserDefaults.standardUserDefaults().setInteger(a.rawValue, forKey: CurrentAccessoryPackKey)
         didSet = true
      }
      return didSet
   }
   
   static var unlockedAccessoryPacks: [AccessoryPack] {
      var unlockedRawValues: [Int]?
      if let _ = NSUserDefaults.standardUserDefaults().objectForKey(UnlockedAccessoryPacksKey) {
         unlockedRawValues = NSUserDefaults.standardUserDefaults().arrayForKey(UnlockedAccessoryPacksKey) as? [Int]
      }
      
      let values = unlockedRawValues ?? defaultUnlockedAccessoryPacksRawValue
      return AccessoryPack.accessoryPacksWithValues(values)
   }
   
   private static func _updateUnlockedAccessoryPacks(packs: [AccessoryPack])
   {
      // We should never update the unlocked accessory packs to NOT include .None
      guard packs.contains(.None) else { return }
      
      var packRawValues: [Int] = []
      for pack in packs {
         packRawValues.append(pack.rawValue)
      }
      
      NSUserDefaults.standardUserDefaults().setObject(packRawValues, forKey: UnlockedAccessoryPacksKey)
   }
   
   static func accessoryPackUnlocked(pack: AccessoryPack) -> Bool
   {
      return unlockedAccessoryPacks.contains(pack)
   }
   
   static func unlockAccessoryPack(pack: AccessoryPack)
   {
      var unlocked = unlockedAccessoryPacks
      if !unlocked.contains(pack) {
         unlocked.append(pack)
      }
      
      _updateUnlockedAccessoryPacks(unlocked)
   }
   
   static func lockAccessoryPack(pack: AccessoryPack)
   {
      var unlocked = unlockedAccessoryPacks
      if let index = unlocked.indexOf(pack) {
         unlocked.removeAtIndex(index)
      }
      
      _updateUnlockedAccessoryPacks(unlocked)
   }
   
   static func unlockAllAccessoryPacks()
   {
      var allPacks = AccessoryPack.activePackArray
      allPacks.append(.None)
      
      _updateUnlockedAccessoryPacks(allPacks)
   }
   
   static func lockAllAccessoryPacks()
   {
      _updateUnlockedAccessoryPacks([.None])
   }
}

extension AccessoryPack
{
   static func accessoryPacksWithValues(values: [Int]) -> [AccessoryPack]
   {
      var packs: [AccessoryPack] = []
      for value in values {
         guard let pack = AccessoryPack(rawValue: value) else { continue }
         packs.append(pack)
      }
      return packs
   }
   
   static var activePackArray: [AccessoryPack] = [.Home, .Work, .Gym]
}