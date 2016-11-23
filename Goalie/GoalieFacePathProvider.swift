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
   lazy var normalLeftEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 34.61, y: 43.3))
      leftEyePath.addCurve(to: CGPoint(x: 31.3, y: 46.61), controlPoint1: CGPoint(x: 34.61, y: 45.13), controlPoint2: CGPoint(x: 33.13, y: 46.61))
      leftEyePath.addCurve(to: CGPoint(x: 28, y: 43.3), controlPoint1: CGPoint(x: 29.48, y: 46.61), controlPoint2: CGPoint(x: 28, y: 45.13))
      leftEyePath.addCurve(to: CGPoint(x: 31.3, y: 40), controlPoint1: CGPoint(x: 28, y: 41.48), controlPoint2: CGPoint(x: 29.48, y: 40))
      leftEyePath.addCurve(to: CGPoint(x: 34.61, y: 43.3), controlPoint1: CGPoint(x: 33.13, y: 40), controlPoint2: CGPoint(x: 34.61, y: 41.48))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var happyLeftEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 34.61, y: 43.3))
      leftEyePath.addCurve(to: CGPoint(x: 31, y: 43), controlPoint1: CGPoint(x: 34.61, y: 45.13), controlPoint2: CGPoint(x: 32.82, y: 43))
      leftEyePath.addCurve(to: CGPoint(x: 28, y: 43.3), controlPoint1: CGPoint(x: 29.18, y: 43), controlPoint2: CGPoint(x: 28, y: 45.13))
      leftEyePath.addCurve(to: CGPoint(x: 31.3, y: 40), controlPoint1: CGPoint(x: 28, y: 41.48), controlPoint2: CGPoint(x: 29.48, y: 40))
      leftEyePath.addCurve(to: CGPoint(x: 34.61, y: 43.3), controlPoint1: CGPoint(x: 33.13, y: 40), controlPoint2: CGPoint(x: 34.61, y: 41.48))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var normalRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 52.73, y: 43.3))
      rightEyePath.addCurve(to: CGPoint(x: 49.42, y: 46.61), controlPoint1: CGPoint(x: 52.73, y: 45.13), controlPoint2: CGPoint(x: 51.25, y: 46.61))
      rightEyePath.addCurve(to: CGPoint(x: 46.12, y: 43.3), controlPoint1: CGPoint(x: 47.6, y: 46.61), controlPoint2: CGPoint(x: 46.12, y: 45.13))
      rightEyePath.addCurve(to: CGPoint(x: 49.42, y: 40), controlPoint1: CGPoint(x: 46.12, y: 41.48), controlPoint2: CGPoint(x: 47.6, y: 40))
      rightEyePath.addCurve(to: CGPoint(x: 52.73, y: 43.3), controlPoint1: CGPoint(x: 51.25, y: 40), controlPoint2: CGPoint(x: 52.73, y: 41.48))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   lazy var happyRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 52.73, y: 43.3))
      rightEyePath.addCurve(to: CGPoint(x: 49, y: 43), controlPoint1: CGPoint(x: 52.73, y: 45.13), controlPoint2: CGPoint(x: 50.82, y: 43))
      rightEyePath.addCurve(to: CGPoint(x: 46.12, y: 43.3), controlPoint1: CGPoint(x: 47.18, y: 43), controlPoint2: CGPoint(x: 46.12, y: 45.13))
      rightEyePath.addCurve(to: CGPoint(x: 49.42, y: 40), controlPoint1: CGPoint(x: 46.12, y: 41.48), controlPoint2: CGPoint(x: 47.6, y: 40))
      rightEyePath.addCurve(to: CGPoint(x: 52.73, y: 43.3), controlPoint1: CGPoint(x: 51.25, y: 40), controlPoint2: CGPoint(x: 52.73, y: 41.48))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   lazy var happyMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      mouthPath.move(to: CGPoint(x: 35, y: 57.13))
      mouthPath.addCurve(to: CGPoint(x: 40.32, y: 58.64), controlPoint1: CGPoint(x: 36.49, y: 58.07), controlPoint2: CGPoint(x: 38.33, y: 58.64))
      mouthPath.addCurve(to: CGPoint(x: 45.73, y: 57.04), controlPoint1: CGPoint(x: 42.34, y: 58.64), controlPoint2: CGPoint(x: 44.21, y: 58.04))
      mouthPath.addCurve(to: CGPoint(x: 48.76, y: 53.64), controlPoint1: CGPoint(x: 47.05, y: 56.17), controlPoint2: CGPoint(x: 48.1, y: 55))
      mouthPath.addCurve(to: CGPoint(x: 47.16, y: 50.47), controlPoint1: CGPoint(x: 49.42, y: 52.22), controlPoint2: CGPoint(x: 48.53, y: 50.47))
      mouthPath.addLine(to: CGPoint(x: 40.29, y: 50.47))
      mouthPath.addLine(to: CGPoint(x: 33.52, y: 50.47))
      mouthPath.addCurve(to: CGPoint(x: 31.96, y: 53.78), controlPoint1: CGPoint(x: 32.11, y: 50.47), controlPoint2: CGPoint(x: 31.26, y: 52.32))
      mouthPath.addCurve(to: CGPoint(x: 35, y: 57.13), controlPoint1: CGPoint(x: 32.61, y: 55.12), controlPoint2: CGPoint(x: 33.67, y: 56.28))
      mouthPath.close()
      mouthPath.miterLimit = 4;
      return mouthPath.cgPath
   }()
   
   lazy var smallHappyMouthPath: CGPath = {
      //// Mouth Drawing
      let mouthPath = UIBezierPath()
      mouthPath.move(to: CGPoint(x: 38.33, y: 53.59))
      mouthPath.addCurve(to: CGPoint(x: 40.49, y: 54.64), controlPoint1: CGPoint(x: 38.94, y: 54.25), controlPoint2: CGPoint(x: 39.68, y: 54.64))
      mouthPath.addCurve(to: CGPoint(x: 42.68, y: 53.53), controlPoint1: CGPoint(x: 41.31, y: 54.64), controlPoint2: CGPoint(x: 42.07, y: 54.23))
      mouthPath.addCurve(to: CGPoint(x: 43.91, y: 51.18), controlPoint1: CGPoint(x: 43.22, y: 52.93), controlPoint2: CGPoint(x: 43.64, y: 52.12))
      mouthPath.addCurve(to: CGPoint(x: 43.26, y: 49), controlPoint1: CGPoint(x: 44.18, y: 50.21), controlPoint2: CGPoint(x: 43.81, y: 49))
      mouthPath.addLine(to: CGPoint(x: 40.48, y: 49))
      mouthPath.addLine(to: CGPoint(x: 37.73, y: 49))
      mouthPath.addCurve(to: CGPoint(x: 37.1, y: 51.28), controlPoint1: CGPoint(x: 37.16, y: 49), controlPoint2: CGPoint(x: 36.82, y: 50.27))
      mouthPath.addCurve(to: CGPoint(x: 38.33, y: 53.59), controlPoint1: CGPoint(x: 37.37, y: 52.21), controlPoint2: CGPoint(x: 37.79, y: 53.01))
      mouthPath.close()
      mouthPath.miterLimit = 4;
      return mouthPath.cgPath
   }()
   
   lazy var bigHappyMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      mouthPath.move(to: CGPoint(x: 33.34, y: 58.68))
      mouthPath.addCurve(to: CGPoint(x: 40.81, y: 61), controlPoint1: CGPoint(x: 35.43, y: 60.13), controlPoint2: CGPoint(x: 38.01, y: 61))
      mouthPath.addCurve(to: CGPoint(x: 48.43, y: 58.55), controlPoint1: CGPoint(x: 43.65, y: 61), controlPoint2: CGPoint(x: 46.29, y: 60.09))
      mouthPath.addCurve(to: CGPoint(x: 52.69, y: 53.33), controlPoint1: CGPoint(x: 50.28, y: 57.21), controlPoint2: CGPoint(x: 51.76, y: 55.41))
      mouthPath.addCurve(to: CGPoint(x: 50.43, y: 48.47), controlPoint1: CGPoint(x: 53.62, y: 51.15), controlPoint2: CGPoint(x: 52.36, y: 48.47))
      mouthPath.addLine(to: CGPoint(x: 40.77, y: 48.47))
      mouthPath.addLine(to: CGPoint(x: 31.26, y: 48.47))
      mouthPath.addCurve(to: CGPoint(x: 29.07, y: 53.54), controlPoint1: CGPoint(x: 29.27, y: 48.47), controlPoint2: CGPoint(x: 28.07, y: 51.3))
      mouthPath.addCurve(to: CGPoint(x: 33.34, y: 58.68), controlPoint1: CGPoint(x: 29.98, y: 55.6), controlPoint2: CGPoint(x: 31.46, y: 57.37))
      mouthPath.close()
      mouthPath.miterLimit = 4;
      return mouthPath.cgPath
   }()
   
   lazy var scaredMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      mouthPath.move(to: CGPoint(x: 46.14, y: 51.81))
      mouthPath.addCurve(to: CGPoint(x: 41.02, y: 50.42), controlPoint1: CGPoint(x: 44.69, y: 50.94), controlPoint2: CGPoint(x: 42.93, y: 50.42))
      mouthPath.addCurve(to: CGPoint(x: 36.05, y: 51.74), controlPoint1: CGPoint(x: 39.19, y: 50.42), controlPoint2: CGPoint(x: 37.48, y: 50.9))
      mouthPath.addCurve(to: CGPoint(x: 32.57, y: 55.42), controlPoint1: CGPoint(x: 34.52, y: 52.63), controlPoint2: CGPoint(x: 33.3, y: 53.91))
      mouthPath.addCurve(to: CGPoint(x: 34.18, y: 58.58), controlPoint1: CGPoint(x: 31.91, y: 56.83), controlPoint2: CGPoint(x: 32.81, y: 58.58))
      mouthPath.addLine(to: CGPoint(x: 41.48, y: 58.58))
      mouthPath.addLine(to: CGPoint(x: 47.81, y: 58.58))
      mouthPath.addCurve(to: CGPoint(x: 49.37, y: 55.28), controlPoint1: CGPoint(x: 49.23, y: 58.58), controlPoint2: CGPoint(x: 50.08, y: 56.74))
      mouthPath.addCurve(to: CGPoint(x: 46.14, y: 51.81), controlPoint1: CGPoint(x: 48.69, y: 53.88), controlPoint2: CGPoint(x: 47.57, y: 52.67))
      mouthPath.close()
      mouthPath.miterLimit = 4;
      return mouthPath.cgPath
   }()
   
   lazy var flatScaredMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      mouthPath.move(to: CGPoint(x: 46.14, y: 53.03))
      mouthPath.addCurve(to: CGPoint(x: 41.02, y: 52.42), controlPoint1: CGPoint(x: 44.69, y: 52.64), controlPoint2: CGPoint(x: 42.93, y: 52.42))
      mouthPath.addCurve(to: CGPoint(x: 36.05, y: 53), controlPoint1: CGPoint(x: 39.19, y: 52.42), controlPoint2: CGPoint(x: 37.48, y: 52.63))
      mouthPath.addCurve(to: CGPoint(x: 32.57, y: 54.61), controlPoint1: CGPoint(x: 34.52, y: 53.39), controlPoint2: CGPoint(x: 33.3, y: 53.95))
      mouthPath.addCurve(to: CGPoint(x: 34.18, y: 56), controlPoint1: CGPoint(x: 31.91, y: 55.23), controlPoint2: CGPoint(x: 32.81, y: 56))
      mouthPath.addLine(to: CGPoint(x: 41.48, y: 56))
      mouthPath.addLine(to: CGPoint(x: 47.81, y: 56))
      mouthPath.addCurve(to: CGPoint(x: 49.37, y: 54.55), controlPoint1: CGPoint(x: 49.23, y: 56), controlPoint2: CGPoint(x: 50.08, y: 55.19))
      mouthPath.addCurve(to: CGPoint(x: 46.14, y: 53.03), controlPoint1: CGPoint(x: 48.69, y: 53.94), controlPoint2: CGPoint(x: 47.57, y: 53.41))
      mouthPath.close()
      mouthPath.miterLimit = 4;
      return mouthPath.cgPath
   }()
   
   lazy var yellingMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      mouthPath.move(to: CGPoint(x: 44.89, y: 62.7))
      mouthPath.addLine(to: CGPoint(x: 35.79, y: 62.7))
      mouthPath.addCurve(to: CGPoint(x: 31.59, y: 59.11), controlPoint1: CGPoint(x: 33.71, y: 62.7), controlPoint2: CGPoint(x: 31.92, y: 61.19))
      mouthPath.addLine(to: CGPoint(x: 31.07, y: 55.85))
      mouthPath.addCurve(to: CGPoint(x: 35.27, y: 50.9), controlPoint1: CGPoint(x: 30.64, y: 53.26), controlPoint2: CGPoint(x: 32.67, y: 50.9))
      mouthPath.addLine(to: CGPoint(x: 45.41, y: 50.9))
      mouthPath.addCurve(to: CGPoint(x: 49.61, y: 55.85), controlPoint1: CGPoint(x: 48.05, y: 50.9), controlPoint2: CGPoint(x: 50.04, y: 53.26))
      mouthPath.addLine(to: CGPoint(x: 49.09, y: 59.11))
      mouthPath.addCurve(to: CGPoint(x: 44.89, y: 62.7), controlPoint1: CGPoint(x: 48.76, y: 61.19), controlPoint2: CGPoint(x: 46.97, y: 62.7))
      mouthPath.close()
      mouthPath.miterLimit = 4;
      return mouthPath.cgPath
   }()
   
   lazy var angryTeethPath: CGPath = {
      let teethPath = UIBezierPath()
      teethPath.move(to: CGPoint(x: 33.76, y: 52.74))
      teethPath.addLine(to: CGPoint(x: 46.87, y: 52.74))
      teethPath.addCurve(to: CGPoint(x: 49.23, y: 53.26), controlPoint1: CGPoint(x: 47.72, y: 52.74), controlPoint2: CGPoint(x: 48.53, y: 52.93))
      teethPath.addCurve(to: CGPoint(x: 45.41, y: 50.9), controlPoint1: CGPoint(x: 48.53, y: 51.84), controlPoint2: CGPoint(x: 47.11, y: 50.9))
      teethPath.addLine(to: CGPoint(x: 35.27, y: 50.9))
      teethPath.addCurve(to: CGPoint(x: 31.44, y: 53.26), controlPoint1: CGPoint(x: 33.57, y: 50.9), controlPoint2: CGPoint(x: 32.15, y: 51.89))
      teethPath.addCurve(to: CGPoint(x: 33.76, y: 52.74), controlPoint1: CGPoint(x: 32.15, y: 52.93), controlPoint2: CGPoint(x: 32.91, y: 52.74))
      teethPath.close()
      teethPath.miterLimit = 4;
      return teethPath.cgPath
   }()
   
   lazy var angrySquintingLeftEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 34.61, y: 43.3))
      leftEyePath.addCurve(to: CGPoint(x: 31, y: 43), controlPoint1: CGPoint(x: 34.61, y: 45.13), controlPoint2: CGPoint(x: 32.82, y: 43))
      leftEyePath.addCurve(to: CGPoint(x: 28, y: 43.3), controlPoint1: CGPoint(x: 29.18, y: 43), controlPoint2: CGPoint(x: 28, y: 45.13))
      leftEyePath.addCurve(to: CGPoint(x: 31, y: 41), controlPoint1: CGPoint(x: 28, y: 41.48), controlPoint2: CGPoint(x: 29.18, y: 41))
      leftEyePath.addCurve(to: CGPoint(x: 34.61, y: 43.3), controlPoint1: CGPoint(x: 32.82, y: 41), controlPoint2: CGPoint(x: 34.61, y: 41.48))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var angrySquintingRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 52.73, y: 43.3))
      rightEyePath.addCurve(to: CGPoint(x: 49, y: 43), controlPoint1: CGPoint(x: 52.73, y: 45.13), controlPoint2: CGPoint(x: 50.82, y: 43))
      rightEyePath.addCurve(to: CGPoint(x: 46.12, y: 43.3), controlPoint1: CGPoint(x: 47.18, y: 43), controlPoint2: CGPoint(x: 46.12, y: 45.13))
      rightEyePath.addCurve(to: CGPoint(x: 49, y: 41), controlPoint1: CGPoint(x: 46.12, y: 41.48), controlPoint2: CGPoint(x: 47.18, y: 41))
      rightEyePath.addCurve(to: CGPoint(x: 52.73, y: 43.3), controlPoint1: CGPoint(x: 50.82, y: 41), controlPoint2: CGPoint(x: 52.73, y: 41.48))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   lazy var happyWinkingRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 52.73, y: 43.3))
      rightEyePath.addCurve(to: CGPoint(x: 49, y: 42), controlPoint1: CGPoint(x: 52.73, y: 45.13), controlPoint2: CGPoint(x: 50.82, y: 42))
      rightEyePath.addCurve(to: CGPoint(x: 46.12, y: 43.3), controlPoint1: CGPoint(x: 47.18, y: 42), controlPoint2: CGPoint(x: 46.12, y: 45.13))
      rightEyePath.addCurve(to: CGPoint(x: 49.42, y: 40), controlPoint1: CGPoint(x: 46.12, y: 41.48), controlPoint2: CGPoint(x: 47.6, y: 40))
      rightEyePath.addCurve(to: CGPoint(x: 52.73, y: 43.3), controlPoint1: CGPoint(x: 51.25, y: 40), controlPoint2: CGPoint(x: 52.73, y: 41.48))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   lazy var happyWinkingLeftEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 34.61, y: 43.3))
      leftEyePath.addCurve(to: CGPoint(x: 31, y: 42), controlPoint1: CGPoint(x: 34.61, y: 45.13), controlPoint2: CGPoint(x: 32.82, y: 42))
      leftEyePath.addCurve(to: CGPoint(x: 28, y: 43.3), controlPoint1: CGPoint(x: 29.18, y: 42), controlPoint2: CGPoint(x: 28, y: 45.13))
      leftEyePath.addCurve(to: CGPoint(x: 31.3, y: 40), controlPoint1: CGPoint(x: 28, y: 41.48), controlPoint2: CGPoint(x: 29.48, y: 40))
      leftEyePath.addCurve(to: CGPoint(x: 34.61, y: 43.3), controlPoint1: CGPoint(x: 33.13, y: 40), controlPoint2: CGPoint(x: 34.61, y: 41.48))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var leftSurprisedEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 35, y: 44.3))
      leftEyePath.addCurve(to: CGPoint(x: 32.5, y: 46.6), controlPoint1: CGPoint(x: 35, y: 45.57), controlPoint2: CGPoint(x: 33.88, y: 46.6))
      leftEyePath.addCurve(to: CGPoint(x: 30, y: 44.3), controlPoint1: CGPoint(x: 31.12, y: 46.6), controlPoint2: CGPoint(x: 30, y: 45.57))
      leftEyePath.addCurve(to: CGPoint(x: 32.5, y: 42), controlPoint1: CGPoint(x: 30, y: 43.03), controlPoint2: CGPoint(x: 31.12, y: 42))
      leftEyePath.addCurve(to: CGPoint(x: 35, y: 44.3), controlPoint1: CGPoint(x: 33.88, y: 42), controlPoint2: CGPoint(x: 35, y: 43.03))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var rightSurprisedEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 52, y: 44.3))
      rightEyePath.addCurve(to: CGPoint(x: 49.5, y: 46.6), controlPoint1: CGPoint(x: 52, y: 45.57), controlPoint2: CGPoint(x: 50.88, y: 46.6))
      rightEyePath.addCurve(to: CGPoint(x: 47, y: 44.3), controlPoint1: CGPoint(x: 48.12, y: 46.6), controlPoint2: CGPoint(x: 47, y: 45.57))
      rightEyePath.addCurve(to: CGPoint(x: 49.5, y: 42), controlPoint1: CGPoint(x: 47, y: 43.03), controlPoint2: CGPoint(x: 48.12, y: 42))
      rightEyePath.addCurve(to: CGPoint(x: 52, y: 44.3), controlPoint1: CGPoint(x: 50.88, y: 42), controlPoint2: CGPoint(x: 52, y: 43.03))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
}
