//
//  GoalieFacePathProvider.swift
//  Goalie
//
//  Created by Gregory Klein on 1/11/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class GoalieFacePathProvider: CharacterFacePathProvider
{
   lazy var normalLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(34.61, 43.3))
      leftEyePath.addCurveToPoint(CGPointMake(31.3, 46.61), controlPoint1: CGPointMake(34.61, 45.13), controlPoint2: CGPointMake(33.13, 46.61))
      leftEyePath.addCurveToPoint(CGPointMake(28, 43.3), controlPoint1: CGPointMake(29.48, 46.61), controlPoint2: CGPointMake(28, 45.13))
      leftEyePath.addCurveToPoint(CGPointMake(31.3, 40), controlPoint1: CGPointMake(28, 41.48), controlPoint2: CGPointMake(29.48, 40))
      leftEyePath.addCurveToPoint(CGPointMake(34.61, 43.3), controlPoint1: CGPointMake(33.13, 40), controlPoint2: CGPointMake(34.61, 41.48))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var happyLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(34.61, 43.3))
      leftEyePath.addCurveToPoint(CGPointMake(31, 43), controlPoint1: CGPointMake(34.61, 45.13), controlPoint2: CGPointMake(32.82, 43))
      leftEyePath.addCurveToPoint(CGPointMake(28, 43.3), controlPoint1: CGPointMake(29.18, 43), controlPoint2: CGPointMake(28, 45.13))
      leftEyePath.addCurveToPoint(CGPointMake(31.3, 40), controlPoint1: CGPointMake(28, 41.48), controlPoint2: CGPointMake(29.48, 40))
      leftEyePath.addCurveToPoint(CGPointMake(34.61, 43.3), controlPoint1: CGPointMake(33.13, 40), controlPoint2: CGPointMake(34.61, 41.48))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var normalRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(52.73, 43.3))
      rightEyePath.addCurveToPoint(CGPointMake(49.42, 46.61), controlPoint1: CGPointMake(52.73, 45.13), controlPoint2: CGPointMake(51.25, 46.61))
      rightEyePath.addCurveToPoint(CGPointMake(46.12, 43.3), controlPoint1: CGPointMake(47.6, 46.61), controlPoint2: CGPointMake(46.12, 45.13))
      rightEyePath.addCurveToPoint(CGPointMake(49.42, 40), controlPoint1: CGPointMake(46.12, 41.48), controlPoint2: CGPointMake(47.6, 40))
      rightEyePath.addCurveToPoint(CGPointMake(52.73, 43.3), controlPoint1: CGPointMake(51.25, 40), controlPoint2: CGPointMake(52.73, 41.48))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(52.73, 43.3))
      rightEyePath.addCurveToPoint(CGPointMake(49, 43), controlPoint1: CGPointMake(52.73, 45.13), controlPoint2: CGPointMake(50.82, 43))
      rightEyePath.addCurveToPoint(CGPointMake(46.12, 43.3), controlPoint1: CGPointMake(47.18, 43), controlPoint2: CGPointMake(46.12, 45.13))
      rightEyePath.addCurveToPoint(CGPointMake(49.42, 40), controlPoint1: CGPointMake(46.12, 41.48), controlPoint2: CGPointMake(47.6, 40))
      rightEyePath.addCurveToPoint(CGPointMake(52.73, 43.3), controlPoint1: CGPointMake(51.25, 40), controlPoint2: CGPointMake(52.73, 41.48))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      mouthPath.moveToPoint(CGPointMake(35, 57.13))
      mouthPath.addCurveToPoint(CGPointMake(40.32, 58.64), controlPoint1: CGPointMake(36.49, 58.07), controlPoint2: CGPointMake(38.33, 58.64))
      mouthPath.addCurveToPoint(CGPointMake(45.73, 57.04), controlPoint1: CGPointMake(42.34, 58.64), controlPoint2: CGPointMake(44.21, 58.04))
      mouthPath.addCurveToPoint(CGPointMake(48.76, 53.64), controlPoint1: CGPointMake(47.05, 56.17), controlPoint2: CGPointMake(48.1, 55))
      mouthPath.addCurveToPoint(CGPointMake(47.16, 50.47), controlPoint1: CGPointMake(49.42, 52.22), controlPoint2: CGPointMake(48.53, 50.47))
      mouthPath.addLineToPoint(CGPointMake(40.29, 50.47))
      mouthPath.addLineToPoint(CGPointMake(33.52, 50.47))
      mouthPath.addCurveToPoint(CGPointMake(31.96, 53.78), controlPoint1: CGPointMake(32.11, 50.47), controlPoint2: CGPointMake(31.26, 52.32))
      mouthPath.addCurveToPoint(CGPointMake(35, 57.13), controlPoint1: CGPointMake(32.61, 55.12), controlPoint2: CGPointMake(33.67, 56.28))
      mouthPath.closePath()
      mouthPath.miterLimit = 4;
      return mouthPath.CGPath
   }()
   
   lazy var smallHappyMouthPath: CGPathRef = {
      //// Mouth Drawing
      let mouthPath = UIBezierPath()
      mouthPath.moveToPoint(CGPointMake(38.33, 53.59))
      mouthPath.addCurveToPoint(CGPointMake(40.49, 54.64), controlPoint1: CGPointMake(38.94, 54.25), controlPoint2: CGPointMake(39.68, 54.64))
      mouthPath.addCurveToPoint(CGPointMake(42.68, 53.53), controlPoint1: CGPointMake(41.31, 54.64), controlPoint2: CGPointMake(42.07, 54.23))
      mouthPath.addCurveToPoint(CGPointMake(43.91, 51.18), controlPoint1: CGPointMake(43.22, 52.93), controlPoint2: CGPointMake(43.64, 52.12))
      mouthPath.addCurveToPoint(CGPointMake(43.26, 49), controlPoint1: CGPointMake(44.18, 50.21), controlPoint2: CGPointMake(43.81, 49))
      mouthPath.addLineToPoint(CGPointMake(40.48, 49))
      mouthPath.addLineToPoint(CGPointMake(37.73, 49))
      mouthPath.addCurveToPoint(CGPointMake(37.1, 51.28), controlPoint1: CGPointMake(37.16, 49), controlPoint2: CGPointMake(36.82, 50.27))
      mouthPath.addCurveToPoint(CGPointMake(38.33, 53.59), controlPoint1: CGPointMake(37.37, 52.21), controlPoint2: CGPointMake(37.79, 53.01))
      mouthPath.closePath()
      mouthPath.miterLimit = 4;
      return mouthPath.CGPath
   }()
   
   lazy var bigHappyMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      mouthPath.moveToPoint(CGPointMake(33.34, 58.68))
      mouthPath.addCurveToPoint(CGPointMake(40.81, 61), controlPoint1: CGPointMake(35.43, 60.13), controlPoint2: CGPointMake(38.01, 61))
      mouthPath.addCurveToPoint(CGPointMake(48.43, 58.55), controlPoint1: CGPointMake(43.65, 61), controlPoint2: CGPointMake(46.29, 60.09))
      mouthPath.addCurveToPoint(CGPointMake(52.69, 53.33), controlPoint1: CGPointMake(50.28, 57.21), controlPoint2: CGPointMake(51.76, 55.41))
      mouthPath.addCurveToPoint(CGPointMake(50.43, 48.47), controlPoint1: CGPointMake(53.62, 51.15), controlPoint2: CGPointMake(52.36, 48.47))
      mouthPath.addLineToPoint(CGPointMake(40.77, 48.47))
      mouthPath.addLineToPoint(CGPointMake(31.26, 48.47))
      mouthPath.addCurveToPoint(CGPointMake(29.07, 53.54), controlPoint1: CGPointMake(29.27, 48.47), controlPoint2: CGPointMake(28.07, 51.3))
      mouthPath.addCurveToPoint(CGPointMake(33.34, 58.68), controlPoint1: CGPointMake(29.98, 55.6), controlPoint2: CGPointMake(31.46, 57.37))
      mouthPath.closePath()
      mouthPath.miterLimit = 4;
      return mouthPath.CGPath
   }()
   
   lazy var scaredMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      mouthPath.moveToPoint(CGPointMake(46.14, 51.81))
      mouthPath.addCurveToPoint(CGPointMake(41.02, 50.42), controlPoint1: CGPointMake(44.69, 50.94), controlPoint2: CGPointMake(42.93, 50.42))
      mouthPath.addCurveToPoint(CGPointMake(36.05, 51.74), controlPoint1: CGPointMake(39.19, 50.42), controlPoint2: CGPointMake(37.48, 50.9))
      mouthPath.addCurveToPoint(CGPointMake(32.57, 55.42), controlPoint1: CGPointMake(34.52, 52.63), controlPoint2: CGPointMake(33.3, 53.91))
      mouthPath.addCurveToPoint(CGPointMake(34.18, 58.58), controlPoint1: CGPointMake(31.91, 56.83), controlPoint2: CGPointMake(32.81, 58.58))
      mouthPath.addLineToPoint(CGPointMake(41.48, 58.58))
      mouthPath.addLineToPoint(CGPointMake(47.81, 58.58))
      mouthPath.addCurveToPoint(CGPointMake(49.37, 55.28), controlPoint1: CGPointMake(49.23, 58.58), controlPoint2: CGPointMake(50.08, 56.74))
      mouthPath.addCurveToPoint(CGPointMake(46.14, 51.81), controlPoint1: CGPointMake(48.69, 53.88), controlPoint2: CGPointMake(47.57, 52.67))
      mouthPath.closePath()
      mouthPath.miterLimit = 4;
      return mouthPath.CGPath
   }()
   
   lazy var flatScaredMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      mouthPath.moveToPoint(CGPointMake(46.14, 53.03))
      mouthPath.addCurveToPoint(CGPointMake(41.02, 52.42), controlPoint1: CGPointMake(44.69, 52.64), controlPoint2: CGPointMake(42.93, 52.42))
      mouthPath.addCurveToPoint(CGPointMake(36.05, 53), controlPoint1: CGPointMake(39.19, 52.42), controlPoint2: CGPointMake(37.48, 52.63))
      mouthPath.addCurveToPoint(CGPointMake(32.57, 54.61), controlPoint1: CGPointMake(34.52, 53.39), controlPoint2: CGPointMake(33.3, 53.95))
      mouthPath.addCurveToPoint(CGPointMake(34.18, 56), controlPoint1: CGPointMake(31.91, 55.23), controlPoint2: CGPointMake(32.81, 56))
      mouthPath.addLineToPoint(CGPointMake(41.48, 56))
      mouthPath.addLineToPoint(CGPointMake(47.81, 56))
      mouthPath.addCurveToPoint(CGPointMake(49.37, 54.55), controlPoint1: CGPointMake(49.23, 56), controlPoint2: CGPointMake(50.08, 55.19))
      mouthPath.addCurveToPoint(CGPointMake(46.14, 53.03), controlPoint1: CGPointMake(48.69, 53.94), controlPoint2: CGPointMake(47.57, 53.41))
      mouthPath.closePath()
      mouthPath.miterLimit = 4;
      return mouthPath.CGPath
   }()
   
   lazy var yellingMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      mouthPath.moveToPoint(CGPointMake(44.89, 62.7))
      mouthPath.addLineToPoint(CGPointMake(35.79, 62.7))
      mouthPath.addCurveToPoint(CGPointMake(31.59, 59.11), controlPoint1: CGPointMake(33.71, 62.7), controlPoint2: CGPointMake(31.92, 61.19))
      mouthPath.addLineToPoint(CGPointMake(31.07, 55.85))
      mouthPath.addCurveToPoint(CGPointMake(35.27, 50.9), controlPoint1: CGPointMake(30.64, 53.26), controlPoint2: CGPointMake(32.67, 50.9))
      mouthPath.addLineToPoint(CGPointMake(45.41, 50.9))
      mouthPath.addCurveToPoint(CGPointMake(49.61, 55.85), controlPoint1: CGPointMake(48.05, 50.9), controlPoint2: CGPointMake(50.04, 53.26))
      mouthPath.addLineToPoint(CGPointMake(49.09, 59.11))
      mouthPath.addCurveToPoint(CGPointMake(44.89, 62.7), controlPoint1: CGPointMake(48.76, 61.19), controlPoint2: CGPointMake(46.97, 62.7))
      mouthPath.closePath()
      mouthPath.miterLimit = 4;
      return mouthPath.CGPath
   }()
   
   lazy var angryTeethPath: CGPathRef = {
      let teethPath = UIBezierPath()
      teethPath.moveToPoint(CGPointMake(33.76, 52.74))
      teethPath.addLineToPoint(CGPointMake(46.87, 52.74))
      teethPath.addCurveToPoint(CGPointMake(49.23, 53.26), controlPoint1: CGPointMake(47.72, 52.74), controlPoint2: CGPointMake(48.53, 52.93))
      teethPath.addCurveToPoint(CGPointMake(45.41, 50.9), controlPoint1: CGPointMake(48.53, 51.84), controlPoint2: CGPointMake(47.11, 50.9))
      teethPath.addLineToPoint(CGPointMake(35.27, 50.9))
      teethPath.addCurveToPoint(CGPointMake(31.44, 53.26), controlPoint1: CGPointMake(33.57, 50.9), controlPoint2: CGPointMake(32.15, 51.89))
      teethPath.addCurveToPoint(CGPointMake(33.76, 52.74), controlPoint1: CGPointMake(32.15, 52.93), controlPoint2: CGPointMake(32.91, 52.74))
      teethPath.closePath()
      teethPath.miterLimit = 4;
      return teethPath.CGPath
   }()
   
   lazy var angrySquintingLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(34.61, 43.3))
      leftEyePath.addCurveToPoint(CGPointMake(31, 43), controlPoint1: CGPointMake(34.61, 45.13), controlPoint2: CGPointMake(32.82, 43))
      leftEyePath.addCurveToPoint(CGPointMake(28, 43.3), controlPoint1: CGPointMake(29.18, 43), controlPoint2: CGPointMake(28, 45.13))
      leftEyePath.addCurveToPoint(CGPointMake(31, 41), controlPoint1: CGPointMake(28, 41.48), controlPoint2: CGPointMake(29.18, 41))
      leftEyePath.addCurveToPoint(CGPointMake(34.61, 43.3), controlPoint1: CGPointMake(32.82, 41), controlPoint2: CGPointMake(34.61, 41.48))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var angrySquintingRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(52.73, 43.3))
      rightEyePath.addCurveToPoint(CGPointMake(49, 43), controlPoint1: CGPointMake(52.73, 45.13), controlPoint2: CGPointMake(50.82, 43))
      rightEyePath.addCurveToPoint(CGPointMake(46.12, 43.3), controlPoint1: CGPointMake(47.18, 43), controlPoint2: CGPointMake(46.12, 45.13))
      rightEyePath.addCurveToPoint(CGPointMake(49, 41), controlPoint1: CGPointMake(46.12, 41.48), controlPoint2: CGPointMake(47.18, 41))
      rightEyePath.addCurveToPoint(CGPointMake(52.73, 43.3), controlPoint1: CGPointMake(50.82, 41), controlPoint2: CGPointMake(52.73, 41.48))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyWinkingRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(52.73, 43.3))
      rightEyePath.addCurveToPoint(CGPointMake(49, 42), controlPoint1: CGPointMake(52.73, 45.13), controlPoint2: CGPointMake(50.82, 42))
      rightEyePath.addCurveToPoint(CGPointMake(46.12, 43.3), controlPoint1: CGPointMake(47.18, 42), controlPoint2: CGPointMake(46.12, 45.13))
      rightEyePath.addCurveToPoint(CGPointMake(49.42, 40), controlPoint1: CGPointMake(46.12, 41.48), controlPoint2: CGPointMake(47.6, 40))
      rightEyePath.addCurveToPoint(CGPointMake(52.73, 43.3), controlPoint1: CGPointMake(51.25, 40), controlPoint2: CGPointMake(52.73, 41.48))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyWinkingLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(34.61, 43.3))
      leftEyePath.addCurveToPoint(CGPointMake(31, 42), controlPoint1: CGPointMake(34.61, 45.13), controlPoint2: CGPointMake(32.82, 42))
      leftEyePath.addCurveToPoint(CGPointMake(28, 43.3), controlPoint1: CGPointMake(29.18, 42), controlPoint2: CGPointMake(28, 45.13))
      leftEyePath.addCurveToPoint(CGPointMake(31.3, 40), controlPoint1: CGPointMake(28, 41.48), controlPoint2: CGPointMake(29.48, 40))
      leftEyePath.addCurveToPoint(CGPointMake(34.61, 43.3), controlPoint1: CGPointMake(33.13, 40), controlPoint2: CGPointMake(34.61, 41.48))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var leftSurprisedEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(35, 44.3))
      leftEyePath.addCurveToPoint(CGPointMake(32.5, 46.6), controlPoint1: CGPointMake(35, 45.57), controlPoint2: CGPointMake(33.88, 46.6))
      leftEyePath.addCurveToPoint(CGPointMake(30, 44.3), controlPoint1: CGPointMake(31.12, 46.6), controlPoint2: CGPointMake(30, 45.57))
      leftEyePath.addCurveToPoint(CGPointMake(32.5, 42), controlPoint1: CGPointMake(30, 43.03), controlPoint2: CGPointMake(31.12, 42))
      leftEyePath.addCurveToPoint(CGPointMake(35, 44.3), controlPoint1: CGPointMake(33.88, 42), controlPoint2: CGPointMake(35, 43.03))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var rightSurprisedEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(52, 44.3))
      rightEyePath.addCurveToPoint(CGPointMake(49.5, 46.6), controlPoint1: CGPointMake(52, 45.57), controlPoint2: CGPointMake(50.88, 46.6))
      rightEyePath.addCurveToPoint(CGPointMake(47, 44.3), controlPoint1: CGPointMake(48.12, 46.6), controlPoint2: CGPointMake(47, 45.57))
      rightEyePath.addCurveToPoint(CGPointMake(49.5, 42), controlPoint1: CGPointMake(47, 43.03), controlPoint2: CGPointMake(48.12, 42))
      rightEyePath.addCurveToPoint(CGPointMake(52, 44.3), controlPoint1: CGPointMake(50.88, 42), controlPoint2: CGPointMake(52, 43.03))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
}
