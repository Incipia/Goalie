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
   
   fileprivate let _unknownTextArray = ["BOORING", "SNOOZE FEST", "YAWN", "NAP TIME", "1 SHEEP 2...", "ZZZZZZ", "I'M BEAT"]
   fileprivate let _agesTextArray = ["WE GOT THIS", "ICE, ICE, BABY", "TONS O' TIME", "SO RELAXED", "JUST CHILLIN'", "SO COOL", "JUST SWELL"]
   fileprivate let _laterTextArray = ["ALRIGHT!", "LET'S DO THIS", "POWER UP", "HELLO, IT'S ME", "GO TO TOWN", "WAHOO"]
   fileprivate let _soonTextArray = ["ARE YOU HOT?", "I'M FLUSHED", "SWEATIN' IT", "KEEP COOL", "FEVERISH", "UH... HMM..", "EXCUSE ME?"]
   fileprivate let _asapTextArray = ["STAY CALM!", "BURNIN' UP", "WOAH BUDDY", "SEND HELP", "TOO HOT", "I NEED ICE", "!!!!!!!!!!!!"]
   
   // For later
   fileprivate let _productiveActivityArray = ["KILLING IT TODAY", "LOOK AT YOU GO", "BRAVO", "GETTIN' IT", "CRUSHED IT"]
   
   fileprivate var _lastTextDictionary: [TaskPriority : String] = [.unknown: "", .ages : "", .later : "", .soon : "", .asap : ""]
   fileprivate var _lastProductiveActivityText = ""
   
   static func textForCharacter(_ charcter: GoalieCharacter, priority: TaskPriority) -> String
   {
      return sharedProvider._newTextForCharacter(charcter, priority: priority)
   }
   
   fileprivate func _textArrayForPriority(_ priority: TaskPriority) -> [String]
   {
      switch priority
      {
      case .unknown: return _unknownTextArray
      case .ages: return _agesTextArray
      case .later: return _laterTextArray
      case .soon: return _soonTextArray
      case .asap: return _asapTextArray
      }
   }
   
   fileprivate func _newTextForCharacter(_ character: GoalieCharacter, priority: TaskPriority) -> String
   {
      let textArray = character.textArrayForPriority(priority)
      var newText = textArray.randomItem()
      
      while newText == _lastTextDictionary[priority] {
         newText = textArray.randomItem()
      }
      
      _lastTextDictionary[priority] = newText
      return newText
   }
   
   fileprivate func _newTextForBeingProductive() -> String
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
   func textArrayForPriority(_ priority: TaskPriority) -> [String]
   {
      switch priority {
      case .unknown: return unknownTextArray
      case .ages: return agesTextArray
      case .later: return laterTextArray
      case .soon: return soonTextArray
      case .asap: return asapTextArray
      }
   }
   
   fileprivate var unknownTextArray: [String] {
      switch self {
      case .unknown: return []
      case .goalie: return ["BOORING", "SNOOZE FEST", "YAWN", "NAP TIME", "1 SHEEP 2...", "ZZZZZZ", "I'M BEAT"]
      case .bizeeBee: return ["total bore", "chillaxin", "beauty rest", "i’ll do yoga", "snoozefest", "need a pillow", "maybe later"]
      case .fox: return ["weary times", "uninspiring", "dull", "how routine", "i’m fatigued", "nodding off", "need tea"]
      case .checklistor: return ["yay, naps!", "read to me", "so cozy", "rest fest", "blanket?", "tuck me in", "bubbles!"]
      }
   }
   
   fileprivate var agesTextArray: [String] {
      switch self {
      case .unknown: return []
      case .goalie: return ["WE GOT THIS", "ICE, ICE, BABY", "TONS O' TIME", "SO RELAXED", "JUST CHILLIN'", "SO COOL", "JUST SWELL"]
      case .bizeeBee: return ["i see you", "like my bow?", "fabulous", "spa day", "way to plan", "Look atchu", "mighty fine"]
      case .fox: return ["quite fine", "cheerio", "just dandy", "splendid day", "superior", "tip-top shape", "lovely"]
      case .checklistor: return ["so much time", "i like this", "just floatin’", "way to be", "splashing", "fun zone", "chill station"]
      }
   }
   
   fileprivate var laterTextArray: [String] {
      switch self {
      case .unknown: return []
      case .goalie: return ["ALRIGHT!", "LET'S DO THIS", "POWER UP", "HELLO, IT'S ME", "GO TO TOWN", "WAHOO"]
      case .bizeeBee: return ["so perky", "it’s go time", "let’s partay", "work it", "dance off!", "mad skills", "heyooo"]
      case .fox: return ["fine job", "righto", "impecable", "smashing", "i’m chipper", "oh you"]
      case .checklistor: return ["play time", "oh hi!", "i feel good", "keep swimmin’", "fintastic", "whale done", "10/10 effort"]
      }
   }
   
   fileprivate var soonTextArray: [String] {
      switch self {
      case .unknown: return []
      case .goalie: return ["ARE YOU HOT?", "I'M FLUSHED", "SWEATIN' IT", "KEEP COOL", "FEVERISH", "UH... HMM..", "EXCUSE ME?"]
      case .bizeeBee: return ["awkward", "hellooo?", "LOL", "cray cray", "decent", "amateur hour", "woah friend", "get movin’"]
      case .fox: return ["try harder", "i’ll say", "passable", "satisfactory", "oh dear", "woah friend", "this seems…"]
      case .checklistor: return ["is this bad?", "yikes!", "eek", "uh oh", "c’mon bud", "oh my", "ouch"]
      }
   }
   
   fileprivate var asapTextArray: [String] {
      switch self {
      case .unknown: return []
      case .goalie: return ["STAY CALM!", "BURNIN' UP", "WOAH BUDDY", "SEND HELP", "TOO HOT", "I NEED ICE", "!!!!!!!!!!!!"]
      case .bizeeBee: return ["it’s fine", "just go", "#fail", "sigh", "...k", "meh", "really?"]
      case .fox: return ["devastating", "disastrous", "good grief", "poor form", "inconceivable!", "foolish", "guilty"]
      case .checklistor: return ["um, wat", "help", "i’m scared", "what stinks?", "i’ll go hide", "but why?", "come back"]
      }
   }
}
