//
//  CharacterFacePathProvider.swift
//  Goalie
//
//  Created by Gregory Klein on 2/9/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

struct FacePathProviderFactory
{
   static func providerForCharacter(character: GoalieCharacter) -> CharacterFacePathProvider
   {
      switch character {
      case .Unknown: return GoalieFacePathProvider()
      case .Goalie: return GoalieFacePathProvider()
      case .BizeeBee: return BizeeBeeFacePathProvider()
      case .Fox: return FoxFacePathProvider()
      case .Checklistor: return ChecklistorFacePathProvider()
      }
   }
}

protocol CharacterFacePathProvider
{
   var normalLeftEyePath: CGPathRef { get }
   var normalRightEyePath: CGPathRef { get }
   
   var happyLeftEyePath: CGPathRef { get }
   var happyRightEyePath: CGPathRef { get }
   
   var angryLeftEyePath: CGPathRef { get }
   var angryRightEyePath: CGPathRef { get }
   
   var happyWinkingRightEyePath: CGPathRef { get }
   var happyWinkingLeftEyePath: CGPathRef { get }
   
   var angrySquintingLeftEyePath: CGPathRef { get }
   var angrySquintingRightEyePath: CGPathRef { get }
   
   var happyMouthPath: CGPathRef { get }
   var smallHappyMouthPath: CGPathRef { get }
   var bigHappyMouthPath: CGPathRef { get }
   var scaredMouthPath: CGPathRef { get }
   var flatScaredMouthPath: CGPathRef { get }
   var yellingMouthPath: CGPathRef { get }
   var angryTeethPath: CGPathRef { get }
   var leftSurprisedEyePath: CGPathRef { get }
   var rightSurprisedEyePath: CGPathRef { get }
   
   func mouthPathForPriority(priority: TaskPriority) -> CGPathRef?
   func teethPathForPriority(priority: TaskPriority) -> CGPathRef?
}

extension CharacterFacePathProvider
{
   func mouthPathForPriority(priority: TaskPriority) -> CGPathRef?
   {
      switch priority
      {
      case .Ages, .Later: return happyMouthPath
      case .Soon: return scaredMouthPath
      case .ASAP: return yellingMouthPath
      default: return nil
      }
   }
   
   func teethPathForPriority(priority: TaskPriority) -> CGPathRef?
   {
      switch priority
      {
      case .ASAP: return angryTeethPath
      default: return nil
      }
   }
   
   var angryLeftEyePath: CGPathRef {
      return self.normalLeftEyePath
   }
   
   var angryRightEyePath: CGPathRef {
      return self.normalRightEyePath
   }
}
