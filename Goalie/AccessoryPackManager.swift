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

private let defaultAccessoryPackRawValue = AccessoryPack.none.rawValue
private let defaultUnlockedAccessoryPacksRawValue: [Int] = [AccessoryPack.none.rawValue]

class AccessoryPackManager
{
   static var currentAccessoryPack: AccessoryPack {
      var current = defaultAccessoryPackRawValue
      if let _ = UserDefaults.standard.object(forKey: CurrentAccessoryPackKey) {
         current = UserDefaults.standard.integer(forKey: CurrentAccessoryPackKey)
      }
      
      let accessoryPack = AccessoryPack(rawValue: current)
      return accessoryPack ?? AccessoryPack.none
   }
   
   static func updateCurrentAccessoryPack(_ a: AccessoryPack) -> Bool
   {
      var didSet = false
      if a != currentAccessoryPack {
         UserDefaults.standard.set(a.rawValue, forKey: CurrentAccessoryPackKey)
         didSet = true
      }
      return didSet
   }
   
   static var unlockedAccessoryPacks: [AccessoryPack] {
      var unlockedRawValues: [Int]?
      if let _ = UserDefaults.standard.object(forKey: UnlockedAccessoryPacksKey) {
         unlockedRawValues = UserDefaults.standard.array(forKey: UnlockedAccessoryPacksKey) as? [Int]
      }
      
      let values = unlockedRawValues ?? defaultUnlockedAccessoryPacksRawValue
      return AccessoryPack.accessoryPacksWithValues(values)
   }
   
   fileprivate static func _updateUnlockedAccessoryPacks(_ packs: [AccessoryPack])
   {
      // We should never update the unlocked accessory packs to NOT include .None
      guard packs.contains(.none) else { return }
      
      var packRawValues: [Int] = []
      for pack in packs {
         packRawValues.append(pack.rawValue)
      }
      
      UserDefaults.standard.set(packRawValues, forKey: UnlockedAccessoryPacksKey)
   }
   
   static func accessoryPackUnlocked(_ pack: AccessoryPack) -> Bool
   {
      return unlockedAccessoryPacks.contains(pack)
   }
   
   static func unlockAccessoryPack(_ pack: AccessoryPack)
   {
      var unlocked = unlockedAccessoryPacks
      if !unlocked.contains(pack) {
         unlocked.append(pack)
      }
      
      _updateUnlockedAccessoryPacks(unlocked)
   }
   
   static func lockAccessoryPack(_ pack: AccessoryPack)
   {
      var unlocked = unlockedAccessoryPacks
      if let index = unlocked.index(of: pack) {
         unlocked.remove(at: index)
      }
      
      _updateUnlockedAccessoryPacks(unlocked)
   }
   
   static func unlockAllAccessoryPacks()
   {
      var allPacks = AccessoryPack.activePackArray
      allPacks.append(.none)
      
      _updateUnlockedAccessoryPacks(allPacks)
   }
   
   static func lockAllAccessoryPacks()
   {
      _updateUnlockedAccessoryPacks([.none])
   }
}

extension AccessoryPack
{
   static func accessoryPacksWithValues(_ values: [Int]) -> [AccessoryPack]
   {
      var packs: [AccessoryPack] = []
      for value in values {
         guard let pack = AccessoryPack(rawValue: value) else { continue }
         packs.append(pack)
      }
      return packs
   }
   
   static var activePackArray: [AccessoryPack] = [.home, .work, .gym]
}
