//
//  CharacterManager.swift
//  Goalie
//
//  Created by Gregory Klein on 3/29/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

private let CurrentCharacterKey = "GoalieCurrentCharacterKey"
private let UnlockedCharactersKey = "GoalieUnlockedCharactersKey"

private let defaultCurrentCharacterValue = 0
private let defaultUnlockedCharacterRawValues: [Int] = [0]

struct CharacterManager
{
   static var currentCharacter: GoalieCharacter {
      var current = defaultCurrentCharacterValue
      if let _ = NSUserDefaults.standardUserDefaults().objectForKey(CurrentCharacterKey) {
         current = NSUserDefaults.standardUserDefaults().integerForKey(CurrentCharacterKey)
      }
      
      let character = GoalieCharacter(rawValue: current)
      return character ?? .Goalie
   }
   
   static func updateCurrentCharacter(character: GoalieCharacter) -> Bool
   {
      var didSet = false
      if character != currentCharacter {
         NSUserDefaults.standardUserDefaults().setInteger(character.rawValue, forKey: CurrentCharacterKey)
         didSet = true
      }
      return didSet
   }
   
   static var unlockedCharacters: [GoalieCharacter] {
      var unlockedRawValues: [Int]?
      if let _ = NSUserDefaults.standardUserDefaults().objectForKey(UnlockedCharactersKey) {
         unlockedRawValues = NSUserDefaults.standardUserDefaults().arrayForKey(UnlockedCharactersKey) as? [Int]
      }
      
      let values = unlockedRawValues ?? defaultUnlockedCharacterRawValues
      return GoalieCharacter.charactersWithValues(values)
   }
   
   private static func _updateUnlockedCharacters(characters: [GoalieCharacter])
   {
      // We should never update the unlocked characters to NOT include goalie – that's just wrong.
      guard characters.contains(.Goalie) else { return }
      
      var characterRawValues: [Int] = []
      for character in characters {
         characterRawValues.append(character.rawValue)
      }
      
      NSUserDefaults.standardUserDefaults().setObject(characterRawValues, forKey: UnlockedCharactersKey)
   }
   
   static func characterUnlocked(character: GoalieCharacter) -> Bool
   {
      return unlockedCharacters.contains(character)
   }
   
   static func unlockCharacter(character: GoalieCharacter)
   {
      var unlocked = unlockedCharacters
      if !unlocked.contains(character) {
         unlocked.append(character)
      }
      
      _updateUnlockedCharacters(unlocked)
   }
   
   static func lockCharacter(character: GoalieCharacter)
   {
      var unlocked = unlockedCharacters
      if let index = unlocked.indexOf(character) {
         unlocked.removeAtIndex(index)
      }
      
      _updateUnlockedCharacters(unlocked)
   }
   
   static func unlockAllCharacters()
   {
      _updateUnlockedCharacters(GoalieCharacter.activeCharacterArray)
   }
   
   static func lockAllCharactersExceptForGoalie()
   {
      _updateUnlockedCharacters([.Goalie])
   }
   
   static func lockAllCharacters()
   {
      _updateUnlockedCharacters([])
   }
}

extension GoalieCharacter
{
   static func charactersWithValues(values: [Int]) -> [GoalieCharacter]
   {
      var characters: [GoalieCharacter] = []
      for value in values {
         guard let character = GoalieCharacter(rawValue: value) else { continue }
         characters.append(character)
      }
      return characters
   }
   
   static var activeCharacterArray: [GoalieCharacter] = [.Goalie, .Fox, .BizeeBee, .Checklistor]
}