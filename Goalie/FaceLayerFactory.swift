//
//  FaceLayerFactory.swift
//  Goalie
//
//  Created by Gregory Klein on 3/25/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

class FaceLayerFactory
{
   static func layerForCharacter(character: GoalieCharacter) -> CharacterFaceLayer
   {
      switch character {
      case .Goalie: return GoalieFaceLayer()
      case .BizeeBee: return BizeeBeeFaceLayer()
      case .Fox: return FoxFaceLayer()
      case .Checklistor: return ChecklistorFaceLayer()
      case .Unknown: return CharacterFaceLayer()
      }
   }
}