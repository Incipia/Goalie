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
   static func layerForCharacter(_ character: GoalieCharacter) -> CharacterFaceLayer
   {
      switch character {
      case .goalie: return GoalieFaceLayer()
      case .bizeeBee: return BizeeBeeFaceLayer()
      case .fox: return FoxFaceLayer()
      case .checklistor: return ChecklistorFaceLayer()
      case .unknown: return CharacterFaceLayer()
      }
   }
}
