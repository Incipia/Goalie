//
//  SFXPlayer.swift
//  Goalie
//
//  Created by Gregory Klein on 1/12/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation
import AVFoundation

class SFXPlayer
{
   fileprivate static let _sharedInstance = SFXPlayer()
   
   fileprivate let _urlNames = ["Celeste", "DrumRoll", "Horns", "Kalimba", "MusicBox", "RockOn", "VSSPiano"]
   fileprivate var _soundURLs: [URL] = []
   fileprivate var _currentURLIndex = 0
   
   fileprivate var _player = AVAudioPlayer()
   
   init()
   {
      _setupURLs()
   }
   
   fileprivate func _setupURLs()
   {
      for name in _urlNames {
         if let url = Bundle.main.url(forResource: name, withExtension: "mp3") {
            _soundURLs.append(url)
         }
      }
   }
   
   fileprivate func _playCompleted()
   {
      let soundName = CharacterManager.currentCharacter.taskCompletedSoundName
      if let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
         do {
            _player = try AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
         }
         catch let error as NSError {
            print(error.description)
         }
         _player.volume = 0.25
         _player.enableRate = true
         _player.rate = 1.5
         _player.play()
      }
   }
   
   fileprivate func _playDelete()
   {
      if let url = Bundle.main.url(forResource: "Delete", withExtension: "mp3") {
         do {
            _player = try AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
         }
         catch let error as NSError {
            print(error.description)
         }
         _player.volume = 0.04
         _player.play()
      }
   }
   
   fileprivate func _playPriorityChange()
   {
      if let url = Bundle.main.url(forResource: "ChangePriorityRight", withExtension: "mp3") {
         do {
            _player = try AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
         }
         catch let error as NSError {
            print(error.description)
         }
         _player.volume = 0.1
         _player.play()
      }
   }
   
   fileprivate func _advanceCompletedSound()
   {
      _currentURLIndex += 1
      if _currentURLIndex >= _soundURLs.count {
         _currentURLIndex = 0
      }
   }
   
   fileprivate func _decrementCompletedSound()
   {
      _currentURLIndex -= 1
      if _currentURLIndex < 0 {
         _currentURLIndex = _soundURLs.count - 1
      }
   }
   
   static func playCurrentCompletedSound()
   {
      _sharedInstance._playCompleted()
   }
   
   static func playDeleteSound()
   {
      _sharedInstance._playDelete()
   }
   
   static func playPriorityChangeSound()
   {
      _sharedInstance._playPriorityChange()
   }
   
   static func advanceCompletedSound()
   {
      _sharedInstance._advanceCompletedSound()
   }
   
   static func decrementCompletedSound()
   {
      _sharedInstance._decrementCompletedSound()
   }
   
   static func currentCompletedSoundName() -> String?
   {
      return _sharedInstance._urlNames[_sharedInstance._currentURLIndex]
   }
}

extension GoalieCharacter
{
   var taskCompletedSoundName: String {
      switch self {
      case .goalie: return "Kalimba"
      case .fox: return "FoxSoundMstr"
      case .bizeeBee: return "BusyBeeCompleted"
      case .checklistor: return "AlienSoundMstr"
      case .unknown: return ""
      }
   }
}
