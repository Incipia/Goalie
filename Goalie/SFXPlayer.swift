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
   private static let _sharedInstance = SFXPlayer()
   
   private let _urlNames = ["Celeste", "DrumRoll", "Horns", "Kalimba", "MusicBox", "RockOn", "VSSPiano"]
   private var _soundURLs: [NSURL] = []
   private var _currentURLIndex = 0
   
   private var _player = AVAudioPlayer()
   
   init()
   {
      _setupURLs()
   }
   
   private func _setupURLs()
   {
      for name in _urlNames {
         if let url = NSBundle.mainBundle().URLForResource(name, withExtension: "mp3") {
            _soundURLs.append(url)
         }
      }
   }
   
   private func _playCompleted()
   {
      if let url = NSBundle.mainBundle().URLForResource("Kalimba", withExtension: "mp3") {
         do {
            _player = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil)
         }
         catch let error as NSError {
            print(error.description)
         }
         _player.volume = 0.2
         _player.enableRate = true
         _player.rate = 1.5
         _player.play()
      }
   }
   
   private func _playDelete()
   {
      if let url = NSBundle.mainBundle().URLForResource("Delete", withExtension: "mp3") {
         do {
            _player = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil)
         }
         catch let error as NSError {
            print(error.description)
         }
         _player.volume = 0.1
         _player.play()
      }
   }
   
   private func _playPriorityChange()
   {
      if let url = NSBundle.mainBundle().URLForResource("ChangePriorityRight", withExtension: "mp3") {
         do {
            _player = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil)
         }
         catch let error as NSError {
            print(error.description)
         }
         _player.volume = 0.1
         _player.play()
      }
   }
   
   private func _advanceCompletedSound()
   {
      ++_currentURLIndex
      if _currentURLIndex >= _soundURLs.count {
         _currentURLIndex = 0
      }
   }
   
   private func _decrementCompletedSound()
   {
      --_currentURLIndex
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