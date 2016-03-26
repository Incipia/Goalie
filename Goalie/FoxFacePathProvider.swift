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
      let leftEyePath = UIBezierPath(ovalInRect: CGRectMake(26.11, 25.8, 8.9, 8.9))
      return leftEyePath.CGPath
   }()
   
   lazy var happyLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(35.01, 30.25))
      leftEyePath.addCurveToPoint(CGPointMake(31, 30), controlPoint1: CGPointMake(35.01, 32.71), controlPoint2: CGPointMake(33.46, 30))
      leftEyePath.addCurveToPoint(CGPointMake(26.11, 30.25), controlPoint1: CGPointMake(28.54, 30), controlPoint2: CGPointMake(26.11, 32.71))
      leftEyePath.addCurveToPoint(CGPointMake(30.56, 25.8), controlPoint1: CGPointMake(26.11, 27.79), controlPoint2: CGPointMake(28.1, 25.8))
      leftEyePath.addCurveToPoint(CGPointMake(35.01, 30.25), controlPoint1: CGPointMake(33.02, 25.8), controlPoint2: CGPointMake(35.01, 27.79))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var normalRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath(ovalInRect: CGRectMake(63.61, 25.8, 8.9, 8.9))
      return rightEyePath.CGPath
   }()
   
   lazy var happyRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(71.51, 30.4))
      rightEyePath.addCurveToPoint(CGPointMake(67, 30), controlPoint1: CGPointMake(71.51, 32.94), controlPoint2: CGPointMake(69.46, 30))
      rightEyePath.addCurveToPoint(CGPointMake(62.61, 30.4), controlPoint1: CGPointMake(64.54, 30), controlPoint2: CGPointMake(62.61, 32.94))
      rightEyePath.addCurveToPoint(CGPointMake(67.06, 25.8), controlPoint1: CGPointMake(62.61, 27.86), controlPoint2: CGPointMake(64.6, 25.8))
      rightEyePath.addCurveToPoint(CGPointMake(71.51, 30.4), controlPoint1: CGPointMake(69.52, 25.8), controlPoint2: CGPointMake(71.51, 27.86))
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
      leftEyePath.moveToPoint(CGPointMake(35.01, 30.25))
      leftEyePath.addCurveToPoint(CGPointMake(30, 30), controlPoint1: CGPointMake(35.01, 32.71), controlPoint2: CGPointMake(32.46, 30))
      leftEyePath.addCurveToPoint(CGPointMake(26.11, 30.25), controlPoint1: CGPointMake(27.54, 30), controlPoint2: CGPointMake(26.11, 32.71))
      leftEyePath.addCurveToPoint(CGPointMake(30, 27), controlPoint1: CGPointMake(26.11, 27.79), controlPoint2: CGPointMake(27.54, 27))
      leftEyePath.addCurveToPoint(CGPointMake(35.01, 30.25), controlPoint1: CGPointMake(32.46, 27), controlPoint2: CGPointMake(35.01, 27.79))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var angrySquintingRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(71.51, 30.4))
      rightEyePath.addCurveToPoint(CGPointMake(67, 30), controlPoint1: CGPointMake(71.51, 32.94), controlPoint2: CGPointMake(69.46, 30))
      rightEyePath.addCurveToPoint(CGPointMake(62.61, 30.4), controlPoint1: CGPointMake(64.54, 30), controlPoint2: CGPointMake(62.61, 32.94))
      rightEyePath.addCurveToPoint(CGPointMake(67, 27), controlPoint1: CGPointMake(62.61, 27.86), controlPoint2: CGPointMake(64.54, 27))
      rightEyePath.addCurveToPoint(CGPointMake(71.51, 30.4), controlPoint1: CGPointMake(69.46, 27), controlPoint2: CGPointMake(71.51, 27.86))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyWinkingRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(71.51, 30.4))
      rightEyePath.addCurveToPoint(CGPointMake(67, 30), controlPoint1: CGPointMake(71.51, 32.94), controlPoint2: CGPointMake(69.46, 30))
      rightEyePath.addCurveToPoint(CGPointMake(62.61, 30.4), controlPoint1: CGPointMake(64.54, 30), controlPoint2: CGPointMake(62.61, 32.94))
      rightEyePath.addCurveToPoint(CGPointMake(67.06, 25.8), controlPoint1: CGPointMake(62.61, 27.86), controlPoint2: CGPointMake(64.6, 25.8))
      rightEyePath.addCurveToPoint(CGPointMake(71.51, 30.4), controlPoint1: CGPointMake(69.52, 25.8), controlPoint2: CGPointMake(71.51, 27.86))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyWinkingLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(35.01, 30.25))
      leftEyePath.addCurveToPoint(CGPointMake(31, 30), controlPoint1: CGPointMake(35.01, 32.71), controlPoint2: CGPointMake(33.46, 30))
      leftEyePath.addCurveToPoint(CGPointMake(26.11, 30.25), controlPoint1: CGPointMake(28.54, 30), controlPoint2: CGPointMake(26.11, 32.71))
      leftEyePath.addCurveToPoint(CGPointMake(30.56, 25.8), controlPoint1: CGPointMake(26.11, 27.79), controlPoint2: CGPointMake(28.1, 25.8))
      leftEyePath.addCurveToPoint(CGPointMake(35.01, 30.25), controlPoint1: CGPointMake(33.02, 25.8), controlPoint2: CGPointMake(35.01, 27.79))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var leftSurprisedEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(33.13, 32.17))
      leftEyePath.addLineToPoint(CGPointMake(28, 32.17))
      leftEyePath.addCurveToPoint(CGPointMake(26.07, 30.24), controlPoint1: CGPointMake(26.95, 32.17), controlPoint2: CGPointMake(26.07, 31.29))
      leftEyePath.addCurveToPoint(CGPointMake(28, 28.31), controlPoint1: CGPointMake(26.07, 29.19), controlPoint2: CGPointMake(26.95, 28.31))
      leftEyePath.addLineToPoint(CGPointMake(33.13, 28.31))
      leftEyePath.addCurveToPoint(CGPointMake(35.06, 30.24), controlPoint1: CGPointMake(34.18, 28.31), controlPoint2: CGPointMake(35.06, 29.19))
      leftEyePath.addCurveToPoint(CGPointMake(33.13, 32.17), controlPoint1: CGPointMake(35, 31.34), controlPoint2: CGPointMake(34.18, 32.17))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var rightSurprisedEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(70.63, 32.17))
      rightEyePath.addLineToPoint(CGPointMake(65.5, 32.17))
      rightEyePath.addCurveToPoint(CGPointMake(63.57, 30.24), controlPoint1: CGPointMake(64.45, 32.17), controlPoint2: CGPointMake(63.57, 31.29))
      rightEyePath.addCurveToPoint(CGPointMake(65.5, 28.31), controlPoint1: CGPointMake(63.57, 29.19), controlPoint2: CGPointMake(64.45, 28.31))
      rightEyePath.addLineToPoint(CGPointMake(70.63, 28.31))
      rightEyePath.addCurveToPoint(CGPointMake(72.56, 30.24), controlPoint1: CGPointMake(71.68, 28.31), controlPoint2: CGPointMake(72.56, 29.19))
      rightEyePath.addCurveToPoint(CGPointMake(70.63, 32.17), controlPoint1: CGPointMake(72.51, 31.34), controlPoint2: CGPointMake(71.68, 32.17))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
}
