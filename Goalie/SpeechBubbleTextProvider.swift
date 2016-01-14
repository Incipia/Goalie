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
   private let _laterTextArray = ["ALRIGHT!", "LET'S DO THIS", "POWER UP", "HELLO, IT'S ME", "GET SOME", "GO TO TOWN", "WAHOO"]
   private let _soonTextArray = ["ARE YOU HOT?", "I'M FLUSHED", "SWEATIN' IT", "KEEP COOL", "FEVERISH", "UH... HMM..", "EXCUSE ME?"]
   private let _asapTextArray = ["STAY CALM!", "BURNIN' UP", "WOAH BUDDY", "SEND HELP", "TOO HOT", "I NEED ICE", "!!!!!!!!!!!!"]
   
   // For later
   private let _productiveActivityArray = ["KILLING IT TODAY", "LOOK AT YOU GO", "BRAVO", "GETTIN' IT", "CRUSHED IT"]
   
   private var _lastTextDictionary: [TaskPriority : String] = [.Unknown: "", .Ages : "", .Later : "", .Soon : "", .ASAP : ""]
   private var _lastProductiveActivityText = ""
   
   static func textForPriority(priority: TaskPriority) -> String
   {
      return sharedProvider._newTextForPriority(priority)
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
   
   private func _newTextForPriority(priority: TaskPriority) -> String
   {
      let textArray = _textArrayForPriority(priority)
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