//
//  SpeechBubbleTextProvider.swift
//  Goalie
//
//  Created by Gregory Klein on 1/7/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class SpeechBubbleTextProvider
{
   static let sharedProvider = SpeechBubbleTextProvider()
   
   private let _unknownTextArray = ["BOORING", "SNOOZE FEST", "YAWN", "NAP TIME", "1 SHEEP 2...", "ZZZZZZ", "I'M BEAT"]
   private let _agesTextArray = ["WE GOT THIS", "ICE, ICE, BABY", "TONS O' TIME", "SO RELAXED", "JUST CHILLIN'", "SO COOL", "JUST SWELL"]
   private let _laterTextArray = ["ALRIGHT!", "LET'S DO THIS", "POWER UP", "HELLO, IT'S ME", "GO TO TOWN", "WAHOO"]
   private let _soonTextArray = ["ARE YOU HOT?", "I'M FLUSHED", "SWEATIN' IT", "KEEP COOL", "FEVERISH", "UH... HMM..", "EXCUSE ME?"]
   private let _asapTextArray = ["STAY CALM!", "BURNIN' UP", "WOAH BUDDY", "SEND HELP", "TOO HOT", "I NEED ICE", "!!!!!!!!!!!!"]
   
   // For later
   private let _productiveActivityArray = ["KILLING IT TODAY", "LOOK AT YOU GO", "BRAVO", "GETTIN' IT", "CRUSHED IT"]
   
   private var _lastTextDictionary: [TaskPriority : String] = [.Unknown: "", .Ages : "", .Later : "", .Soon : "", .ASAP : ""]
   private var _lastProductiveActivityText = ""
   
   static func textForCharacter(charcter: GoalieCharacter, priority: TaskPriority) -> String
   {
      return sharedProvider._newTextForCharacter(charcter, priority: priority)
   }
   
   private func _textArrayForPriority(priority: TaskPriority) -> [String]
   {
      switch priority
      {
      case .Unknown: return _unknownTextArray
      case .Ages: return _agesTextArray
      case .Later: return _laterTextArray
      case .Soon: return _soonTextArray
      case .ASAP: return _asapTextArray
      }
   }
   
   private func _newTextForCharacter(character: GoalieCharacter, priority: TaskPriority) -> String
   {
      let textArray = character.textArrayForPriority(priority)
      var newText = textArray.randomItem()
      
      while newText == _lastTextDictionary[priority] {
         newText = textArray.randomItem()
      }
      
      _lastTextDictionary[priority] = newText
      return newText
   }
   
   private func _newTextForBeingProductive() -> String
   {
      var newText = _productiveActivityArray.randomItem()
      while newText == _lastProductiveActivityText {
         newText = _productiveActivityArray.randomItem()
      }
      
      _lastProductiveActivityText = newText
      return newText
   }
}

extension GoalieCharacter
{
   func textArrayForPriority(priority: TaskPriority) -> [String]
   {
      switch priority {
      case .Unknown: return unknownTextArray
      case .Ages: return agesTextArray
      case .Later: return laterTextArray
      case .Soon: return soonTextArray
      case .ASAP: return asapTextArray
      }
   }
   
   private var unknownTextArray: [String] {
      switch self {
      case .Unknown: return []
      case .Goalie: return ["BOORING", "SNOOZE FEST", "YAWN", "NAP TIME", "1 SHEEP 2...", "ZZZZZZ", "I'M BEAT"]
      case .BizeeBee: return ["total bore", "chillaxin", "beauty rest", "i’ll do yoga", "snoozefest", "need a pillow", "maybe later"]
      case .Fox: return ["weary times", "uninspiring", "dull", "how routine", "i’m fatigued", "nodding off", "need tea"]
      case .Checklistor: return ["yay, naps!", "read to me", "so cozy", "rest fest", "blanket?", "tuck me in", "bubbles!"]
      }
   }
   
   private var agesTextArray: [String] {
      switch self {
      case .Unknown: return []
      case .Goalie: return ["WE GOT THIS", "ICE, ICE, BABY", "TONS O' TIME", "SO RELAXED", "JUST CHILLIN'", "SO COOL", "JUST SWELL"]
      case .BizeeBee: return ["i see you", "like my bow?", "fabulous", "spa day", "way to plan", "Look atchu", "mighty fine"]
      case .Fox: return ["quite fine", "cheerio", "just dandy", "splendid day", "superior", "tip-top shape", "lovely"]
      case .Checklistor: return ["so much time", "i like this", "just floatin’", "way to be", "splashing", "fun zone", "chill station"]
      }
   }
   
   private var laterTextArray: [String] {
      switch self {
      case .Unknown: return []
      case .Goalie: return ["ALRIGHT!", "LET'S DO THIS", "POWER UP", "HELLO, IT'S ME", "GO TO TOWN", "WAHOO"]
      case .BizeeBee: return ["so perky", "it’s go time", "let’s partay", "work it", "dance off!", "mad skills", "heyooo"]
      case .Fox: return ["fine job", "righto", "impecable", "smashing", "i’m chipper", "oh you"]
      case .Checklistor: return ["play time", "oh hi!", "i feel good", "keep swimmin’", "fintastic", "whale done", "10/10 effort"]
      }
   }
   
   private var soonTextArray: [String] {
      switch self {
      case .Unknown: return []
      case .Goalie: return ["ARE YOU HOT?", "I'M FLUSHED", "SWEATIN' IT", "KEEP COOL", "FEVERISH", "UH... HMM..", "EXCUSE ME?"]
      case .BizeeBee: return ["awkward", "hellooo?", "LOL", "cray cray", "decent", "amateur hour", "woah friend", "get movin’"]
      case .Fox: return ["try harder", "i’ll say", "passable", "satisfactory", "oh dear", "woah friend", "this seems…"]
      case .Checklistor: return ["is this bad?", "yikes!", "eek", "uh oh", "c’mon bud", "oh my", "ouch"]
      }
   }
   
   private var asapTextArray: [String] {
      switch self {
      case .Unknown: return []
      case .Goalie: return ["STAY CALM!", "BURNIN' UP", "WOAH BUDDY", "SEND HELP", "TOO HOT", "I NEED ICE", "!!!!!!!!!!!!"]
      case .BizeeBee: return ["it’s fine", "just go", "#fail", "sigh", "...k", "meh", "really?"]
      case .Fox: return ["devastating", "disastrous", "good grief", "poor form", "inconceivable!", "foolish", "guilty"]
      case .Checklistor: return ["um, wat", "help", "i’m scared", "what stinks?", "i’ll go hide", "but why?", "come back"]
      }
   }
}