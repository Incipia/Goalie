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
   lazy var normalLeftEyePath: CGPathRef = {
      //// Left Eye Drawing
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(35.4, 31.19))
      leftEyePath.addCurveToPoint(CGPointMake(31.82, 35), controlPoint1: CGPointMake(35.4, 33.29), controlPoint2: CGPointMake(33.8, 35))
      leftEyePath.addCurveToPoint(CGPointMake(28.24, 31.19), controlPoint1: CGPointMake(29.84, 35), controlPoint2: CGPointMake(28.24, 33.29))
      leftEyePath.addCurveToPoint(CGPointMake(31.82, 27.38), controlPoint1: CGPointMake(28.24, 29.08), controlPoint2: CGPointMake(29.84, 27.38))
      leftEyePath.addCurveToPoint(CGPointMake(35.4, 31.19), controlPoint1: CGPointMake(33.8, 27.38), controlPoint2: CGPointMake(35.4, 29.08))
      leftEyePath.closePath()

      return leftEyePath.CGPath
   }()
   
   lazy var happyLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(35.4, 31.19))
      leftEyePath.addCurveToPoint(CGPointMake(32, 31), controlPoint1: CGPointMake(35.4, 33.29), controlPoint2: CGPointMake(33.98, 31))
      leftEyePath.addCurveToPoint(CGPointMake(28.24, 31.19), controlPoint1: CGPointMake(30.02, 31), controlPoint2: CGPointMake(28.24, 33.29))
      leftEyePath.addCurveToPoint(CGPointMake(31.82, 27.38), controlPoint1: CGPointMake(28.24, 29.08), controlPoint2: CGPointMake(29.84, 27.38))
      leftEyePath.addCurveToPoint(CGPointMake(35.4, 31.19), controlPoint1: CGPointMake(33.8, 27.38), controlPoint2: CGPointMake(35.4, 29.08))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var normalRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(67.42, 31.19))
      rightEyePath.addCurveToPoint(CGPointMake(63.84, 35), controlPoint1: CGPointMake(67.42, 33.29), controlPoint2: CGPointMake(65.82, 35))
      rightEyePath.addCurveToPoint(CGPointMake(60.26, 31.19), controlPoint1: CGPointMake(61.86, 35), controlPoint2: CGPointMake(60.26, 33.29))
      rightEyePath.addCurveToPoint(CGPointMake(63.84, 27.38), controlPoint1: CGPointMake(60.26, 29.08), controlPoint2: CGPointMake(61.86, 27.38))
      rightEyePath.addCurveToPoint(CGPointMake(67.42, 31.19), controlPoint1: CGPointMake(65.82, 27.38), controlPoint2: CGPointMake(67.42, 29.08))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(67.42, 31.19))
      rightEyePath.addCurveToPoint(CGPointMake(64, 31), controlPoint1: CGPointMake(67.42, 33.29), controlPoint2: CGPointMake(65.98, 31))
      rightEyePath.addCurveToPoint(CGPointMake(60.26, 31.19), controlPoint1: CGPointMake(62.02, 31), controlPoint2: CGPointMake(60.26, 33.29))
      rightEyePath.addCurveToPoint(CGPointMake(63.84, 27.38), controlPoint1: CGPointMake(60.26, 29.08), controlPoint2: CGPointMake(61.86, 27.38))
      rightEyePath.addCurveToPoint(CGPointMake(67.42, 31.19), controlPoint1: CGPointMake(65.82, 27.38), controlPoint2: CGPointMake(67.42, 29.08))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      return mouthPath.CGPath
   }()
   
   lazy var smallHappyMouthPath: CGPathRef = {
      //// Mouth Drawing
      let mouthPath = UIBezierPath()
      return mouthPath.CGPath
   }()
   
   lazy var bigHappyMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      return mouthPath.CGPath
   }()
   
   lazy var scaredMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      return mouthPath.CGPath
   }()
   
   lazy var flatScaredMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      return mouthPath.CGPath
   }()
   
   lazy var yellingMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      return mouthPath.CGPath
   }()
   
   lazy var angryTeethPath: CGPathRef = {
      let teethPath = UIBezierPath()
      return teethPath.CGPath
   }()
   
   lazy var angrySquintingLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(35.4, 31.19))
      leftEyePath.addCurveToPoint(CGPointMake(32, 32), controlPoint1: CGPointMake(35.4, 33.29), controlPoint2: CGPointMake(33.98, 32))
      leftEyePath.addCurveToPoint(CGPointMake(28.24, 31.19), controlPoint1: CGPointMake(30.02, 32), controlPoint2: CGPointMake(28.24, 33.29))
      leftEyePath.addCurveToPoint(CGPointMake(32, 29), controlPoint1: CGPointMake(28.24, 29.08), controlPoint2: CGPointMake(30.02, 29))
      leftEyePath.addCurveToPoint(CGPointMake(35.4, 31.19), controlPoint1: CGPointMake(33.98, 29), controlPoint2: CGPointMake(35.4, 29.08))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var angrySquintingRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(67.42, 31.19))
      rightEyePath.addCurveToPoint(CGPointMake(64, 32), controlPoint1: CGPointMake(67.42, 33.29), controlPoint2: CGPointMake(65.98, 32))
      rightEyePath.addCurveToPoint(CGPointMake(60.26, 31.19), controlPoint1: CGPointMake(62.02, 32), controlPoint2: CGPointMake(60.26, 33.29))
      rightEyePath.addCurveToPoint(CGPointMake(64, 29), controlPoint1: CGPointMake(60.26, 29.08), controlPoint2: CGPointMake(62.02, 29))
      rightEyePath.addCurveToPoint(CGPointMake(67.42, 31.19), controlPoint1: CGPointMake(65.98, 29), controlPoint2: CGPointMake(67.42, 29.08))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyWinkingRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(67.42, 31.19))
      rightEyePath.addCurveToPoint(CGPointMake(64, 31), controlPoint1: CGPointMake(67.42, 33.29), controlPoint2: CGPointMake(65.98, 31))
      rightEyePath.addCurveToPoint(CGPointMake(60.26, 31.19), controlPoint1: CGPointMake(62.02, 31), controlPoint2: CGPointMake(60.26, 33.29))
      rightEyePath.addCurveToPoint(CGPointMake(63.84, 27.38), controlPoint1: CGPointMake(60.26, 29.08), controlPoint2: CGPointMake(61.86, 27.38))
      rightEyePath.addCurveToPoint(CGPointMake(67.42, 31.19), controlPoint1: CGPointMake(65.82, 27.38), controlPoint2: CGPointMake(67.42, 29.08))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyWinkingLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(35.4, 31.19))
      leftEyePath.addCurveToPoint(CGPointMake(32, 31), controlPoint1: CGPointMake(35.4, 33.29), controlPoint2: CGPointMake(33.98, 31))
      leftEyePath.addCurveToPoint(CGPointMake(28.24, 31.19), controlPoint1: CGPointMake(30.02, 31), controlPoint2: CGPointMake(28.24, 33.29))
      leftEyePath.addCurveToPoint(CGPointMake(31.82, 27.38), controlPoint1: CGPointMake(28.24, 29.08), controlPoint2: CGPointMake(29.84, 27.38))
      leftEyePath.addCurveToPoint(CGPointMake(35.4, 31.19), controlPoint1: CGPointMake(33.8, 27.38), controlPoint2: CGPointMake(35.4, 29.08))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var leftSurprisedEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(34.06, 33.04))
      leftEyePath.addLineToPoint(CGPointMake(29.66, 33.04))
      leftEyePath.addCurveToPoint(CGPointMake(28.01, 31.32), controlPoint1: CGPointMake(28.77, 33.04), controlPoint2: CGPointMake(28.01, 32.26))
      leftEyePath.addCurveToPoint(CGPointMake(29.66, 29.61), controlPoint1: CGPointMake(28.01, 30.39), controlPoint2: CGPointMake(28.77, 29.61))
      leftEyePath.addLineToPoint(CGPointMake(34.06, 29.61))
      leftEyePath.addCurveToPoint(CGPointMake(35.71, 31.32), controlPoint1: CGPointMake(34.95, 29.61), controlPoint2: CGPointMake(35.71, 30.39))
      leftEyePath.addCurveToPoint(CGPointMake(34.06, 33.04), controlPoint1: CGPointMake(35.66, 32.31), controlPoint2: CGPointMake(34.95, 33.04))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var rightSurprisedEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(66.17, 33.04))
      rightEyePath.addLineToPoint(CGPointMake(61.77, 33.04))
      rightEyePath.addCurveToPoint(CGPointMake(60.12, 31.32), controlPoint1: CGPointMake(60.88, 33.04), controlPoint2: CGPointMake(60.12, 32.26))
      rightEyePath.addCurveToPoint(CGPointMake(61.77, 29.61), controlPoint1: CGPointMake(60.12, 30.39), controlPoint2: CGPointMake(60.88, 29.61))
      rightEyePath.addLineToPoint(CGPointMake(66.17, 29.61))
      rightEyePath.addCurveToPoint(CGPointMake(67.82, 31.32), controlPoint1: CGPointMake(67.06, 29.61), controlPoint2: CGPointMake(67.82, 30.39))
      rightEyePath.addCurveToPoint(CGPointMake(66.17, 33.04), controlPoint1: CGPointMake(67.77, 32.31), controlPoint2: CGPointMake(67.06, 33.04))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
}
