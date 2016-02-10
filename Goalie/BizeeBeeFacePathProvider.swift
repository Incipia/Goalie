//
//  BizeeBeeFacePathProvider.swift
//  Goalie
//
//  Created by Gregory Klein on 2/9/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class BizeeBeeFacePathProvider: CharacterFacePathProvider
{
   //
   lazy var normalLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(36.26, 19.71))
      leftEyePath.addCurveToPoint(CGPointMake(33.33, 22.64), controlPoint1: CGPointMake(36.26, 21.33), controlPoint2: CGPointMake(34.95, 22.64))
      leftEyePath.addCurveToPoint(CGPointMake(30.4, 19.71), controlPoint1: CGPointMake(31.71, 22.64), controlPoint2: CGPointMake(30.4, 21.33))
      leftEyePath.addCurveToPoint(CGPointMake(33.33, 16.77), controlPoint1: CGPointMake(30.4, 18.09), controlPoint2: CGPointMake(31.71, 16.77))
      leftEyePath.addCurveToPoint(CGPointMake(36.26, 19.71), controlPoint1: CGPointMake(34.95, 16.77), controlPoint2: CGPointMake(36.26, 18.09))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var happyLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(36.26, 19.71))
      leftEyePath.addCurveToPoint(CGPointMake(33, 20), controlPoint1: CGPointMake(36.26, 21.33), controlPoint2: CGPointMake(34.62, 20))
      leftEyePath.addCurveToPoint(CGPointMake(30.4, 19.71), controlPoint1: CGPointMake(31.38, 20), controlPoint2: CGPointMake(30.4, 21.33))
      leftEyePath.addCurveToPoint(CGPointMake(33.33, 16.77), controlPoint1: CGPointMake(30.4, 18.09), controlPoint2: CGPointMake(31.71, 16.77))
      leftEyePath.addCurveToPoint(CGPointMake(36.26, 19.71), controlPoint1: CGPointMake(34.95, 16.77), controlPoint2: CGPointMake(36.26, 18.09))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var angryLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(35.02, 16.87))
      leftEyePath.addCurveToPoint(CGPointMake(30.35, 18.21), controlPoint1: CGPointMake(33.38, 16.72), controlPoint2: CGPointMake(31.54, 17.42))
      leftEyePath.addCurveToPoint(CGPointMake(29.15, 19.31), controlPoint1: CGPointMake(29.9, 18.51), controlPoint2: CGPointMake(29.5, 18.86))
      leftEyePath.addCurveToPoint(CGPointMake(29.35, 19.61), controlPoint1: CGPointMake(29.05, 19.46), controlPoint2: CGPointMake(29.15, 19.66))
      leftEyePath.addCurveToPoint(CGPointMake(32.19, 18.96), controlPoint1: CGPointMake(29.95, 19.41), controlPoint2: CGPointMake(31.04, 19.16))
      leftEyePath.addCurveToPoint(CGPointMake(32.04, 19.86), controlPoint1: CGPointMake(32.09, 19.26), controlPoint2: CGPointMake(32.04, 19.56))
      leftEyePath.addCurveToPoint(CGPointMake(34.97, 22.79), controlPoint1: CGPointMake(32.04, 21.5), controlPoint2: CGPointMake(33.33, 22.79))
      leftEyePath.addCurveToPoint(CGPointMake(37.9, 19.86), controlPoint1: CGPointMake(36.61, 22.79), controlPoint2: CGPointMake(37.9, 21.5))
      leftEyePath.addCurveToPoint(CGPointMake(36.76, 17.57), controlPoint1: CGPointMake(37.9, 18.96), controlPoint2: CGPointMake(37.51, 18.11))
      leftEyePath.addCurveToPoint(CGPointMake(35.02, 16.87), controlPoint1: CGPointMake(36.26, 17.17), controlPoint2: CGPointMake(35.67, 16.97))
      leftEyePath.closePath()
      leftEyePath.miterLimit = 4;
      return leftEyePath.CGPath
   }()
   
   lazy var angryRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(54.51, 16.87))
      rightEyePath.addCurveToPoint(CGPointMake(49.84, 18.21), controlPoint1: CGPointMake(52.87, 16.72), controlPoint2: CGPointMake(51.03, 17.42))
      rightEyePath.addCurveToPoint(CGPointMake(48.64, 19.31), controlPoint1: CGPointMake(49.39, 18.51), controlPoint2: CGPointMake(48.99, 18.86))
      rightEyePath.addCurveToPoint(CGPointMake(48.84, 19.61), controlPoint1: CGPointMake(48.54, 19.46), controlPoint2: CGPointMake(48.64, 19.66))
      rightEyePath.addCurveToPoint(CGPointMake(51.68, 18.96), controlPoint1: CGPointMake(49.44, 19.41), controlPoint2: CGPointMake(50.53, 19.16))
      rightEyePath.addCurveToPoint(CGPointMake(51.53, 19.86), controlPoint1: CGPointMake(51.58, 19.26), controlPoint2: CGPointMake(51.53, 19.56))
      rightEyePath.addCurveToPoint(CGPointMake(54.46, 22.79), controlPoint1: CGPointMake(51.53, 21.5), controlPoint2: CGPointMake(52.82, 22.79))
      rightEyePath.addCurveToPoint(CGPointMake(57.39, 19.86), controlPoint1: CGPointMake(56.1, 22.79), controlPoint2: CGPointMake(57.39, 21.5))
      rightEyePath.addCurveToPoint(CGPointMake(56.25, 17.57), controlPoint1: CGPointMake(57.39, 18.96), controlPoint2: CGPointMake(57, 18.11))
      rightEyePath.addCurveToPoint(CGPointMake(54.51, 16.87), controlPoint1: CGPointMake(55.75, 17.17), controlPoint2: CGPointMake(55.16, 16.97))
      rightEyePath.closePath()
      rightEyePath.miterLimit = 4;
      return rightEyePath.CGPath
   }()
   
   //
   lazy var normalRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(55.75, 19.71))
      rightEyePath.addCurveToPoint(CGPointMake(52.82, 22.64), controlPoint1: CGPointMake(55.75, 21.33), controlPoint2: CGPointMake(54.44, 22.64))
      rightEyePath.addCurveToPoint(CGPointMake(49.89, 19.71), controlPoint1: CGPointMake(51.2, 22.64), controlPoint2: CGPointMake(49.89, 21.33))
      rightEyePath.addCurveToPoint(CGPointMake(52.82, 16.77), controlPoint1: CGPointMake(49.89, 18.09), controlPoint2: CGPointMake(51.2, 16.77))
      rightEyePath.addCurveToPoint(CGPointMake(55.75, 19.71), controlPoint1: CGPointMake(54.44, 16.77), controlPoint2: CGPointMake(55.75, 18.09))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(55.75, 19.71))
      rightEyePath.addCurveToPoint(CGPointMake(53, 20), controlPoint1: CGPointMake(55.75, 21.33), controlPoint2: CGPointMake(54.62, 20))
      rightEyePath.addCurveToPoint(CGPointMake(49.89, 19.71), controlPoint1: CGPointMake(51.38, 20), controlPoint2: CGPointMake(49.89, 21.33))
      rightEyePath.addCurveToPoint(CGPointMake(52.82, 16.77), controlPoint1: CGPointMake(49.89, 18.09), controlPoint2: CGPointMake(51.2, 16.77))
      rightEyePath.addCurveToPoint(CGPointMake(55.75, 19.71), controlPoint1: CGPointMake(54.44, 16.77), controlPoint2: CGPointMake(55.75, 18.09))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   //
   lazy var happyMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      mouthPath.moveToPoint(CGPointMake(43.02, 27.96))
      mouthPath.addCurveToPoint(CGPointMake(35.37, 26.72), controlPoint1: CGPointMake(40.24, 27.96), controlPoint2: CGPointMake(37.61, 27.51))
      mouthPath.addCurveToPoint(CGPointMake(34.03, 27.96), controlPoint1: CGPointMake(34.57, 26.42), controlPoint2: CGPointMake(33.83, 27.16))
      mouthPath.addCurveToPoint(CGPointMake(43.02, 34.82), controlPoint1: CGPointMake(35.07, 31.94), controlPoint2: CGPointMake(38.7, 34.82))
      mouthPath.addCurveToPoint(CGPointMake(52.02, 27.96), controlPoint1: CGPointMake(47.35, 34.82), controlPoint2: CGPointMake(50.93, 31.89))
      mouthPath.addCurveToPoint(CGPointMake(50.68, 26.72), controlPoint1: CGPointMake(52.22, 27.16), controlPoint2: CGPointMake(51.48, 26.42))
      mouthPath.addCurveToPoint(CGPointMake(43.02, 27.96), controlPoint1: CGPointMake(48.39, 27.51), controlPoint2: CGPointMake(45.81, 27.96))
      mouthPath.closePath()
      mouthPath.miterLimit = 4;
      return mouthPath.CGPath
   }()
   
   lazy var smallHappyMouthPath: CGPathRef = {
      //// Mouth Drawing
      let mouthPath = UIBezierPath()
      mouthPath.moveToPoint(CGPointMake(43, 26.35))
      mouthPath.addCurveToPoint(CGPointMake(38.75, 25.69), controlPoint1: CGPointMake(41.45, 26.35), controlPoint2: CGPointMake(39.99, 26.11))
      mouthPath.addCurveToPoint(CGPointMake(38.01, 26.35), controlPoint1: CGPointMake(38.31, 25.53), controlPoint2: CGPointMake(37.9, 25.92))
      mouthPath.addCurveToPoint(CGPointMake(43, 30), controlPoint1: CGPointMake(38.59, 28.46), controlPoint2: CGPointMake(40.6, 30))
      mouthPath.addCurveToPoint(CGPointMake(47.98, 26.35), controlPoint1: CGPointMake(45.39, 30), controlPoint2: CGPointMake(47.38, 28.44))
      mouthPath.addCurveToPoint(CGPointMake(47.24, 25.69), controlPoint1: CGPointMake(48.09, 25.92), controlPoint2: CGPointMake(47.68, 25.53))
      mouthPath.addCurveToPoint(CGPointMake(43, 26.35), controlPoint1: CGPointMake(45.97, 26.11), controlPoint2: CGPointMake(44.54, 26.35))
      mouthPath.closePath()
      mouthPath.miterLimit = 4;
      return mouthPath.CGPath
   }()
   
   lazy var bigHappyMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      mouthPath.moveToPoint(CGPointMake(43.5, 29.15))
      mouthPath.addCurveToPoint(CGPointMake(32.9, 27.73), controlPoint1: CGPointMake(39.64, 29.15), controlPoint2: CGPointMake(35.99, 28.64))
      mouthPath.addCurveToPoint(CGPointMake(31.04, 29.15), controlPoint1: CGPointMake(31.8, 27.38), controlPoint2: CGPointMake(30.76, 28.24))
      mouthPath.addCurveToPoint(CGPointMake(43.5, 37), controlPoint1: CGPointMake(32.48, 33.7), controlPoint2: CGPointMake(37.51, 37))
      mouthPath.addCurveToPoint(CGPointMake(55.95, 29.15), controlPoint1: CGPointMake(49.48, 37), controlPoint2: CGPointMake(54.44, 33.64))
      mouthPath.addCurveToPoint(CGPointMake(54.1, 27.73), controlPoint1: CGPointMake(56.23, 28.24), controlPoint2: CGPointMake(55.2, 27.38))
      mouthPath.addCurveToPoint(CGPointMake(43.5, 29.15), controlPoint1: CGPointMake(50.93, 28.64), controlPoint2: CGPointMake(47.35, 29.15))
      mouthPath.closePath()
      mouthPath.miterLimit = 4;
      return mouthPath.CGPath
   }()
   
   lazy var scaredMouthPath: CGPathRef = {
      let mouthPath = UIBezierPath()
      mouthPath.moveToPoint(CGPointMake(42.98, 33.58))
      mouthPath.addCurveToPoint(CGPointMake(50.63, 34.82), controlPoint1: CGPointMake(45.76, 33.58), controlPoint2: CGPointMake(48.39, 34.03))
      mouthPath.addCurveToPoint(CGPointMake(51.97, 33.58), controlPoint1: CGPointMake(51.43, 35.12), controlPoint2: CGPointMake(52.17, 34.37))
      mouthPath.addCurveToPoint(CGPointMake(42.98, 26.72), controlPoint1: CGPointMake(50.93, 29.6), controlPoint2: CGPointMake(47.3, 26.72))
      mouthPath.addCurveToPoint(CGPointMake(33.98, 33.58), controlPoint1: CGPointMake(38.65, 26.72), controlPoint2: CGPointMake(35.07, 29.65))
      mouthPath.addCurveToPoint(CGPointMake(35.32, 34.82), controlPoint1: CGPointMake(33.78, 34.37), controlPoint2: CGPointMake(34.52, 35.12))
      mouthPath.addCurveToPoint(CGPointMake(42.98, 33.58), controlPoint1: CGPointMake(37.56, 34.03), controlPoint2: CGPointMake(40.19, 33.58))
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
      return self.scaredMouthPath
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
      leftEyePath.moveToPoint(CGPointMake(35.02, 16.87))
      leftEyePath.addCurveToPoint(CGPointMake(30.35, 18.21), controlPoint1: CGPointMake(33.38, 16.72), controlPoint2: CGPointMake(31.54, 17.42))
      leftEyePath.addCurveToPoint(CGPointMake(29.15, 19.31), controlPoint1: CGPointMake(29.9, 18.51), controlPoint2: CGPointMake(29.5, 18.86))
      leftEyePath.addCurveToPoint(CGPointMake(29.35, 19.61), controlPoint1: CGPointMake(29.05, 19.46), controlPoint2: CGPointMake(29.15, 19.66))
      leftEyePath.addCurveToPoint(CGPointMake(32.19, 18.96), controlPoint1: CGPointMake(29.95, 19.41), controlPoint2: CGPointMake(31.04, 19.16))
      leftEyePath.addCurveToPoint(CGPointMake(32.04, 19.86), controlPoint1: CGPointMake(32.09, 19.26), controlPoint2: CGPointMake(32.04, 19.56))
      leftEyePath.addCurveToPoint(CGPointMake(35, 19), controlPoint1: CGPointMake(32.04, 21.5), controlPoint2: CGPointMake(33.36, 19))
      leftEyePath.addCurveToPoint(CGPointMake(37.9, 19.86), controlPoint1: CGPointMake(36.64, 19), controlPoint2: CGPointMake(37.9, 21.5))
      leftEyePath.addCurveToPoint(CGPointMake(36.76, 17.57), controlPoint1: CGPointMake(37.9, 18.96), controlPoint2: CGPointMake(37.51, 18.11))
      leftEyePath.addCurveToPoint(CGPointMake(35.02, 16.87), controlPoint1: CGPointMake(36.26, 17.17), controlPoint2: CGPointMake(35.67, 16.97))
      leftEyePath.closePath()
      return leftEyePath.CGPath
   }()
   
   lazy var angrySquintingRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(54.51, 16.87))
      rightEyePath.addCurveToPoint(CGPointMake(49.84, 18.21), controlPoint1: CGPointMake(52.87, 16.72), controlPoint2: CGPointMake(51.03, 17.42))
      rightEyePath.addCurveToPoint(CGPointMake(48.64, 19.31), controlPoint1: CGPointMake(49.39, 18.51), controlPoint2: CGPointMake(48.99, 18.86))
      rightEyePath.addCurveToPoint(CGPointMake(48.84, 19.61), controlPoint1: CGPointMake(48.54, 19.46), controlPoint2: CGPointMake(48.64, 19.66))
      rightEyePath.addCurveToPoint(CGPointMake(51.68, 18.96), controlPoint1: CGPointMake(49.44, 19.41), controlPoint2: CGPointMake(50.53, 19.16))
      rightEyePath.addCurveToPoint(CGPointMake(51.53, 19.86), controlPoint1: CGPointMake(51.58, 19.26), controlPoint2: CGPointMake(51.53, 19.56))
      rightEyePath.addCurveToPoint(CGPointMake(55, 19), controlPoint1: CGPointMake(51.53, 21.5), controlPoint2: CGPointMake(53.36, 19))
      rightEyePath.addCurveToPoint(CGPointMake(57.39, 19.86), controlPoint1: CGPointMake(56.64, 19), controlPoint2: CGPointMake(57.39, 21.5))
      rightEyePath.addCurveToPoint(CGPointMake(56.25, 17.57), controlPoint1: CGPointMake(57.39, 18.96), controlPoint2: CGPointMake(57, 18.11))
      rightEyePath.addCurveToPoint(CGPointMake(54.51, 16.87), controlPoint1: CGPointMake(55.75, 17.17), controlPoint2: CGPointMake(55.16, 16.97))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyWinkingRightEyePath: CGPathRef = {
      let rightEyePath = UIBezierPath()
      rightEyePath.moveToPoint(CGPointMake(55.75, 19.71))
      rightEyePath.addCurveToPoint(CGPointMake(53, 19), controlPoint1: CGPointMake(55.75, 21.33), controlPoint2: CGPointMake(54.62, 19))
      rightEyePath.addCurveToPoint(CGPointMake(49.89, 19.71), controlPoint1: CGPointMake(51.38, 19), controlPoint2: CGPointMake(49.89, 21.33))
      rightEyePath.addCurveToPoint(CGPointMake(52.82, 16.77), controlPoint1: CGPointMake(49.89, 18.09), controlPoint2: CGPointMake(51.2, 16.77))
      rightEyePath.addCurveToPoint(CGPointMake(55.75, 19.71), controlPoint1: CGPointMake(54.44, 16.77), controlPoint2: CGPointMake(55.75, 18.09))
      rightEyePath.closePath()
      return rightEyePath.CGPath
   }()
   
   lazy var happyWinkingLeftEyePath: CGPathRef = {
      let leftEyePath = UIBezierPath()
      leftEyePath.moveToPoint(CGPointMake(36.26, 19.71))
      leftEyePath.addCurveToPoint(CGPointMake(33, 19), controlPoint1: CGPointMake(36.26, 21.33), controlPoint2: CGPointMake(34.62, 19))
      leftEyePath.addCurveToPoint(CGPointMake(30.4, 19.71), controlPoint1: CGPointMake(31.38, 19), controlPoint2: CGPointMake(30.4, 21.33))
      leftEyePath.addCurveToPoint(CGPointMake(33.33, 16.77), controlPoint1: CGPointMake(30.4, 18.09), controlPoint2: CGPointMake(31.71, 16.77))
      leftEyePath.addCurveToPoint(CGPointMake(36.26, 19.71), controlPoint1: CGPointMake(34.95, 16.77), controlPoint2: CGPointMake(36.26, 18.09))
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
