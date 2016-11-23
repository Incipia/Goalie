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
   static func providerForCharacter(_ character: GoalieCharacter) -> CharacterFacePathProvider
   {
      switch character {
      case .unknown: return GoalieFacePathProvider()
      case .goalie: return GoalieFacePathProvider()
      case .bizeeBee: return BizeeBeeFacePathProvider()
      case .fox: return FoxFacePathProvider()
      case .checklistor: return ChecklistorFacePathProvider()
      }
   }
}

protocol CharacterFacePathProvider
{
   var normalLeftEyePath: CGPath { get }
   var normalRightEyePath: CGPath { get }
   
   var happyLeftEyePath: CGPath { get }
   var happyRightEyePath: CGPath { get }
   
   var angryLeftEyePath: CGPath { get }
   var angryRightEyePath: CGPath { get }
   
   var happyWinkingRightEyePath: CGPath { get }
   var happyWinkingLeftEyePath: CGPath { get }
   
   var angrySquintingLeftEyePath: CGPath { get }
   var angrySquintingRightEyePath: CGPath { get }
   
   var happyMouthPath: CGPath { get }
   var smallHappyMouthPath: CGPath { get }
   var bigHappyMouthPath: CGPath { get }
   var scaredMouthPath: CGPath { get }
   var flatScaredMouthPath: CGPath { get }
   var yellingMouthPath: CGPath { get }
   var angryTeethPath: CGPath { get }
   var leftSurprisedEyePath: CGPath { get }
   var rightSurprisedEyePath: CGPath { get }
   
   func mouthPathForPriority(_ priority: TaskPriority) -> CGPath?
   func teethPathForPriority(_ priority: TaskPriority) -> CGPath?
}

extension CharacterFacePathProvider
{
   func mouthPathForPriority(_ priority: TaskPriority) -> CGPath?
   {
      switch priority
      {
      case .ages, .later: return happyMouthPath
      case .soon: return scaredMouthPath
      case .asap: return yellingMouthPath
      default: return nil
      }
   }
   
   func teethPathForPriority(_ priority: TaskPriority) -> CGPath?
   {
      switch priority
      {
      case .asap: return angryTeethPath
      default: return nil
      }
   }
   
   var angryLeftEyePath: CGPath {
      return self.normalLeftEyePath
   }
   
   var angryRightEyePath: CGPath {
      return self.normalRightEyePath
   }
}
