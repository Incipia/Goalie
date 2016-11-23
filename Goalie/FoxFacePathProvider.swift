//
//  FoxFacePathProvider.swift
//  Goalie
//
//  Created by Gregory Klein on 3/25/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class FoxFacePathProvider: CharacterFacePathProvider
{
   lazy var normalLeftEyePath: CGPath = {
      //// Left Eye Drawing
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 35.4, y: 31.19))
      leftEyePath.addCurve(to: CGPoint(x: 31.82, y: 35), controlPoint1: CGPoint(x: 35.4, y: 33.29), controlPoint2: CGPoint(x: 33.8, y: 35))
      leftEyePath.addCurve(to: CGPoint(x: 28.24, y: 31.19), controlPoint1: CGPoint(x: 29.84, y: 35), controlPoint2: CGPoint(x: 28.24, y: 33.29))
      leftEyePath.addCurve(to: CGPoint(x: 31.82, y: 27.38), controlPoint1: CGPoint(x: 28.24, y: 29.08), controlPoint2: CGPoint(x: 29.84, y: 27.38))
      leftEyePath.addCurve(to: CGPoint(x: 35.4, y: 31.19), controlPoint1: CGPoint(x: 33.8, y: 27.38), controlPoint2: CGPoint(x: 35.4, y: 29.08))
      leftEyePath.close()

      return leftEyePath.cgPath
   }()
   
   lazy var happyLeftEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 35.4, y: 31.19))
      leftEyePath.addCurve(to: CGPoint(x: 32, y: 31), controlPoint1: CGPoint(x: 35.4, y: 33.29), controlPoint2: CGPoint(x: 33.98, y: 31))
      leftEyePath.addCurve(to: CGPoint(x: 28.24, y: 31.19), controlPoint1: CGPoint(x: 30.02, y: 31), controlPoint2: CGPoint(x: 28.24, y: 33.29))
      leftEyePath.addCurve(to: CGPoint(x: 31.82, y: 27.38), controlPoint1: CGPoint(x: 28.24, y: 29.08), controlPoint2: CGPoint(x: 29.84, y: 27.38))
      leftEyePath.addCurve(to: CGPoint(x: 35.4, y: 31.19), controlPoint1: CGPoint(x: 33.8, y: 27.38), controlPoint2: CGPoint(x: 35.4, y: 29.08))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var normalRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 67.42, y: 31.19))
      rightEyePath.addCurve(to: CGPoint(x: 63.84, y: 35), controlPoint1: CGPoint(x: 67.42, y: 33.29), controlPoint2: CGPoint(x: 65.82, y: 35))
      rightEyePath.addCurve(to: CGPoint(x: 60.26, y: 31.19), controlPoint1: CGPoint(x: 61.86, y: 35), controlPoint2: CGPoint(x: 60.26, y: 33.29))
      rightEyePath.addCurve(to: CGPoint(x: 63.84, y: 27.38), controlPoint1: CGPoint(x: 60.26, y: 29.08), controlPoint2: CGPoint(x: 61.86, y: 27.38))
      rightEyePath.addCurve(to: CGPoint(x: 67.42, y: 31.19), controlPoint1: CGPoint(x: 65.82, y: 27.38), controlPoint2: CGPoint(x: 67.42, y: 29.08))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   lazy var happyRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 67.42, y: 31.19))
      rightEyePath.addCurve(to: CGPoint(x: 64, y: 31), controlPoint1: CGPoint(x: 67.42, y: 33.29), controlPoint2: CGPoint(x: 65.98, y: 31))
      rightEyePath.addCurve(to: CGPoint(x: 60.26, y: 31.19), controlPoint1: CGPoint(x: 62.02, y: 31), controlPoint2: CGPoint(x: 60.26, y: 33.29))
      rightEyePath.addCurve(to: CGPoint(x: 63.84, y: 27.38), controlPoint1: CGPoint(x: 60.26, y: 29.08), controlPoint2: CGPoint(x: 61.86, y: 27.38))
      rightEyePath.addCurve(to: CGPoint(x: 67.42, y: 31.19), controlPoint1: CGPoint(x: 65.82, y: 27.38), controlPoint2: CGPoint(x: 67.42, y: 29.08))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   lazy var happyMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      return mouthPath.cgPath
   }()
   
   lazy var smallHappyMouthPath: CGPath = {
      //// Mouth Drawing
      let mouthPath = UIBezierPath()
      return mouthPath.cgPath
   }()
   
   lazy var bigHappyMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      return mouthPath.cgPath
   }()
   
   lazy var scaredMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      return mouthPath.cgPath
   }()
   
   lazy var flatScaredMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      return mouthPath.cgPath
   }()
   
   lazy var yellingMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      return mouthPath.cgPath
   }()
   
   lazy var angryTeethPath: CGPath = {
      let teethPath = UIBezierPath()
      return teethPath.cgPath
   }()
   
   lazy var angrySquintingLeftEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 35.4, y: 31.19))
      leftEyePath.addCurve(to: CGPoint(x: 32, y: 32), controlPoint1: CGPoint(x: 35.4, y: 33.29), controlPoint2: CGPoint(x: 33.98, y: 32))
      leftEyePath.addCurve(to: CGPoint(x: 28.24, y: 31.19), controlPoint1: CGPoint(x: 30.02, y: 32), controlPoint2: CGPoint(x: 28.24, y: 33.29))
      leftEyePath.addCurve(to: CGPoint(x: 32, y: 29), controlPoint1: CGPoint(x: 28.24, y: 29.08), controlPoint2: CGPoint(x: 30.02, y: 29))
      leftEyePath.addCurve(to: CGPoint(x: 35.4, y: 31.19), controlPoint1: CGPoint(x: 33.98, y: 29), controlPoint2: CGPoint(x: 35.4, y: 29.08))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var angrySquintingRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 67.42, y: 31.19))
      rightEyePath.addCurve(to: CGPoint(x: 64, y: 32), controlPoint1: CGPoint(x: 67.42, y: 33.29), controlPoint2: CGPoint(x: 65.98, y: 32))
      rightEyePath.addCurve(to: CGPoint(x: 60.26, y: 31.19), controlPoint1: CGPoint(x: 62.02, y: 32), controlPoint2: CGPoint(x: 60.26, y: 33.29))
      rightEyePath.addCurve(to: CGPoint(x: 64, y: 29), controlPoint1: CGPoint(x: 60.26, y: 29.08), controlPoint2: CGPoint(x: 62.02, y: 29))
      rightEyePath.addCurve(to: CGPoint(x: 67.42, y: 31.19), controlPoint1: CGPoint(x: 65.98, y: 29), controlPoint2: CGPoint(x: 67.42, y: 29.08))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   lazy var happyWinkingRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 67.42, y: 31.19))
      rightEyePath.addCurve(to: CGPoint(x: 64, y: 31), controlPoint1: CGPoint(x: 67.42, y: 33.29), controlPoint2: CGPoint(x: 65.98, y: 31))
      rightEyePath.addCurve(to: CGPoint(x: 60.26, y: 31.19), controlPoint1: CGPoint(x: 62.02, y: 31), controlPoint2: CGPoint(x: 60.26, y: 33.29))
      rightEyePath.addCurve(to: CGPoint(x: 63.84, y: 27.38), controlPoint1: CGPoint(x: 60.26, y: 29.08), controlPoint2: CGPoint(x: 61.86, y: 27.38))
      rightEyePath.addCurve(to: CGPoint(x: 67.42, y: 31.19), controlPoint1: CGPoint(x: 65.82, y: 27.38), controlPoint2: CGPoint(x: 67.42, y: 29.08))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   lazy var happyWinkingLeftEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 35.4, y: 31.19))
      leftEyePath.addCurve(to: CGPoint(x: 32, y: 31), controlPoint1: CGPoint(x: 35.4, y: 33.29), controlPoint2: CGPoint(x: 33.98, y: 31))
      leftEyePath.addCurve(to: CGPoint(x: 28.24, y: 31.19), controlPoint1: CGPoint(x: 30.02, y: 31), controlPoint2: CGPoint(x: 28.24, y: 33.29))
      leftEyePath.addCurve(to: CGPoint(x: 31.82, y: 27.38), controlPoint1: CGPoint(x: 28.24, y: 29.08), controlPoint2: CGPoint(x: 29.84, y: 27.38))
      leftEyePath.addCurve(to: CGPoint(x: 35.4, y: 31.19), controlPoint1: CGPoint(x: 33.8, y: 27.38), controlPoint2: CGPoint(x: 35.4, y: 29.08))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var leftSurprisedEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 34.06, y: 33.04))
      leftEyePath.addLine(to: CGPoint(x: 29.66, y: 33.04))
      leftEyePath.addCurve(to: CGPoint(x: 28.01, y: 31.32), controlPoint1: CGPoint(x: 28.77, y: 33.04), controlPoint2: CGPoint(x: 28.01, y: 32.26))
      leftEyePath.addCurve(to: CGPoint(x: 29.66, y: 29.61), controlPoint1: CGPoint(x: 28.01, y: 30.39), controlPoint2: CGPoint(x: 28.77, y: 29.61))
      leftEyePath.addLine(to: CGPoint(x: 34.06, y: 29.61))
      leftEyePath.addCurve(to: CGPoint(x: 35.71, y: 31.32), controlPoint1: CGPoint(x: 34.95, y: 29.61), controlPoint2: CGPoint(x: 35.71, y: 30.39))
      leftEyePath.addCurve(to: CGPoint(x: 34.06, y: 33.04), controlPoint1: CGPoint(x: 35.66, y: 32.31), controlPoint2: CGPoint(x: 34.95, y: 33.04))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var rightSurprisedEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 66.17, y: 33.04))
      rightEyePath.addLine(to: CGPoint(x: 61.77, y: 33.04))
      rightEyePath.addCurve(to: CGPoint(x: 60.12, y: 31.32), controlPoint1: CGPoint(x: 60.88, y: 33.04), controlPoint2: CGPoint(x: 60.12, y: 32.26))
      rightEyePath.addCurve(to: CGPoint(x: 61.77, y: 29.61), controlPoint1: CGPoint(x: 60.12, y: 30.39), controlPoint2: CGPoint(x: 60.88, y: 29.61))
      rightEyePath.addLine(to: CGPoint(x: 66.17, y: 29.61))
      rightEyePath.addCurve(to: CGPoint(x: 67.82, y: 31.32), controlPoint1: CGPoint(x: 67.06, y: 29.61), controlPoint2: CGPoint(x: 67.82, y: 30.39))
      rightEyePath.addCurve(to: CGPoint(x: 66.17, y: 33.04), controlPoint1: CGPoint(x: 67.77, y: 32.31), controlPoint2: CGPoint(x: 67.06, y: 33.04))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
}
