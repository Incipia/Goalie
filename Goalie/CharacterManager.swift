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

private let defaultCurrentCharacterValue = GoalieCharacter.goalie.rawValue
private let defaultUnlockedCharacterRawValues: [Int] = [GoalieCharacter.goalie.rawValue]

struct CharacterManager
{
   static var currentCharacter: GoalieCharacter {
      var current = defaultCurrentCharacterValue
      if let _ = UserDefaults.standard.object(forKey: CurrentCharacterKey) {
         current = UserDefaults.standard.integer(forKey: CurrentCharacterKey)
      }
      
      let character = GoalieCharacter(rawValue: current)
      return character ?? .goalie
   }
   
   static func updateCurrentCharacter(_ character: GoalieCharacter) -> Bool
   {
      var didSet = false
      if character != currentCharacter {
         UserDefaults.standard.set(character.rawValue, forKey: CurrentCharacterKey)
         didSet = true
      }
      return didSet
   }
   
   static var unlockedCharacters: [GoalieCharacter] {
      var unlockedRawValues: [Int]?
      if let _ = UserDefaults.standard.object(forKey: UnlockedCharactersKey) {
         unlockedRawValues = UserDefaults.standard.array(forKey: UnlockedCharactersKey) as? [Int]
      }
      
      let values = unlockedRawValues ?? defaultUnlockedCharacterRawValues
      return GoalieCharacter.charactersWithValues(values)
   }
   
   fileprivate static func _updateUnlockedCharacters(_ characters: [GoalieCharacter])
   {
      // We should never update the unlocked characters to NOT include goalie – that's just wrong.
      guard characters.contains(.goalie) else { return }
      
      var characterRawValues: [Int] = []
      for character in characters {
         characterRawValues.append(character.rawValue)
      }
      
      UserDefaults.standard.set(characterRawValues, forKey: UnlockedCharactersKey)
   }
   
   static func characterUnlocked(_ character: GoalieCharacter) -> Bool
   {
      return unlockedCharacters.contains(character)
   }
   
   static func unlockCharacter(_ character: GoalieCharacter)
   {
      var unlocked = unlockedCharacters
      if !unlocked.contains(character) {
         unlocked.append(character)
      }
      
      _updateUnlockedCharacters(unlocked)
   }
   
   static func lockCharacter(_ character: GoalieCharacter)
   {
      var unlocked = unlockedCharacters
      if let index = unlocked.index(of: character) {
         unlocked.remove(at: index)
      }
      
      _updateUnlockedCharacters(unlocked)
   }
   
   static func unlockAllCharacters()
   {
      _updateUnlockedCharacters(GoalieCharacter.activeCharacterArray)
   }
   
   static func lockAllCharactersExceptForGoalie()
   {
      _updateUnlockedCharacters([.goalie])
   }
   
   static func lockAllCharacters()
   {
      _updateUnlockedCharacters([])
   }
}

extension GoalieCharacter
{
   static func charactersWithValues(_ values: [Int]) -> [GoalieCharacter]
   {
      var characters: [GoalieCharacter] = []
      for value in values {
         guard let character = GoalieCharacter(rawValue: value) else { continue }
         characters.append(character)
      }
      return characters
   }
   
   static var activeCharacterArray: [GoalieCharacter] = [.goalie, .fox, .bizeeBee, .checklistor]
}
