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
   lazy var normalLeftEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 36.26, y: 19.71))
      leftEyePath.addCurve(to: CGPoint(x: 33.33, y: 22.64), controlPoint1: CGPoint(x: 36.26, y: 21.33), controlPoint2: CGPoint(x: 34.95, y: 22.64))
      leftEyePath.addCurve(to: CGPoint(x: 30.4, y: 19.71), controlPoint1: CGPoint(x: 31.71, y: 22.64), controlPoint2: CGPoint(x: 30.4, y: 21.33))
      leftEyePath.addCurve(to: CGPoint(x: 33.33, y: 16.77), controlPoint1: CGPoint(x: 30.4, y: 18.09), controlPoint2: CGPoint(x: 31.71, y: 16.77))
      leftEyePath.addCurve(to: CGPoint(x: 36.26, y: 19.71), controlPoint1: CGPoint(x: 34.95, y: 16.77), controlPoint2: CGPoint(x: 36.26, y: 18.09))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var happyLeftEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 36.26, y: 19.71))
      leftEyePath.addCurve(to: CGPoint(x: 33, y: 20), controlPoint1: CGPoint(x: 36.26, y: 21.33), controlPoint2: CGPoint(x: 34.62, y: 20))
      leftEyePath.addCurve(to: CGPoint(x: 30.4, y: 19.71), controlPoint1: CGPoint(x: 31.38, y: 20), controlPoint2: CGPoint(x: 30.4, y: 21.33))
      leftEyePath.addCurve(to: CGPoint(x: 33.33, y: 16.77), controlPoint1: CGPoint(x: 30.4, y: 18.09), controlPoint2: CGPoint(x: 31.71, y: 16.77))
      leftEyePath.addCurve(to: CGPoint(x: 36.26, y: 19.71), controlPoint1: CGPoint(x: 34.95, y: 16.77), controlPoint2: CGPoint(x: 36.26, y: 18.09))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var angryLeftEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 35.02, y: 16.87))
      leftEyePath.addCurve(to: CGPoint(x: 30.35, y: 18.21), controlPoint1: CGPoint(x: 33.38, y: 16.72), controlPoint2: CGPoint(x: 31.54, y: 17.42))
      leftEyePath.addCurve(to: CGPoint(x: 29.15, y: 19.31), controlPoint1: CGPoint(x: 29.9, y: 18.51), controlPoint2: CGPoint(x: 29.5, y: 18.86))
      leftEyePath.addCurve(to: CGPoint(x: 29.35, y: 19.61), controlPoint1: CGPoint(x: 29.05, y: 19.46), controlPoint2: CGPoint(x: 29.15, y: 19.66))
      leftEyePath.addCurve(to: CGPoint(x: 32.19, y: 18.96), controlPoint1: CGPoint(x: 29.95, y: 19.41), controlPoint2: CGPoint(x: 31.04, y: 19.16))
      leftEyePath.addCurve(to: CGPoint(x: 32.04, y: 19.86), controlPoint1: CGPoint(x: 32.09, y: 19.26), controlPoint2: CGPoint(x: 32.04, y: 19.56))
      leftEyePath.addCurve(to: CGPoint(x: 34.97, y: 22.79), controlPoint1: CGPoint(x: 32.04, y: 21.5), controlPoint2: CGPoint(x: 33.33, y: 22.79))
      leftEyePath.addCurve(to: CGPoint(x: 37.9, y: 19.86), controlPoint1: CGPoint(x: 36.61, y: 22.79), controlPoint2: CGPoint(x: 37.9, y: 21.5))
      leftEyePath.addCurve(to: CGPoint(x: 36.76, y: 17.57), controlPoint1: CGPoint(x: 37.9, y: 18.96), controlPoint2: CGPoint(x: 37.51, y: 18.11))
      leftEyePath.addCurve(to: CGPoint(x: 35.02, y: 16.87), controlPoint1: CGPoint(x: 36.26, y: 17.17), controlPoint2: CGPoint(x: 35.67, y: 16.97))
      leftEyePath.close()
      leftEyePath.miterLimit = 4;
      return leftEyePath.cgPath
   }()
   
   lazy var angryRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 54.51, y: 16.87))
      rightEyePath.addCurve(to: CGPoint(x: 49.84, y: 18.21), controlPoint1: CGPoint(x: 52.87, y: 16.72), controlPoint2: CGPoint(x: 51.03, y: 17.42))
      rightEyePath.addCurve(to: CGPoint(x: 48.64, y: 19.31), controlPoint1: CGPoint(x: 49.39, y: 18.51), controlPoint2: CGPoint(x: 48.99, y: 18.86))
      rightEyePath.addCurve(to: CGPoint(x: 48.84, y: 19.61), controlPoint1: CGPoint(x: 48.54, y: 19.46), controlPoint2: CGPoint(x: 48.64, y: 19.66))
      rightEyePath.addCurve(to: CGPoint(x: 51.68, y: 18.96), controlPoint1: CGPoint(x: 49.44, y: 19.41), controlPoint2: CGPoint(x: 50.53, y: 19.16))
      rightEyePath.addCurve(to: CGPoint(x: 51.53, y: 19.86), controlPoint1: CGPoint(x: 51.58, y: 19.26), controlPoint2: CGPoint(x: 51.53, y: 19.56))
      rightEyePath.addCurve(to: CGPoint(x: 54.46, y: 22.79), controlPoint1: CGPoint(x: 51.53, y: 21.5), controlPoint2: CGPoint(x: 52.82, y: 22.79))
      rightEyePath.addCurve(to: CGPoint(x: 57.39, y: 19.86), controlPoint1: CGPoint(x: 56.1, y: 22.79), controlPoint2: CGPoint(x: 57.39, y: 21.5))
      rightEyePath.addCurve(to: CGPoint(x: 56.25, y: 17.57), controlPoint1: CGPoint(x: 57.39, y: 18.96), controlPoint2: CGPoint(x: 57, y: 18.11))
      rightEyePath.addCurve(to: CGPoint(x: 54.51, y: 16.87), controlPoint1: CGPoint(x: 55.75, y: 17.17), controlPoint2: CGPoint(x: 55.16, y: 16.97))
      rightEyePath.close()
      rightEyePath.miterLimit = 4;
      return rightEyePath.cgPath
   }()
   
   //
   lazy var normalRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 55.75, y: 19.71))
      rightEyePath.addCurve(to: CGPoint(x: 52.82, y: 22.64), controlPoint1: CGPoint(x: 55.75, y: 21.33), controlPoint2: CGPoint(x: 54.44, y: 22.64))
      rightEyePath.addCurve(to: CGPoint(x: 49.89, y: 19.71), controlPoint1: CGPoint(x: 51.2, y: 22.64), controlPoint2: CGPoint(x: 49.89, y: 21.33))
      rightEyePath.addCurve(to: CGPoint(x: 52.82, y: 16.77), controlPoint1: CGPoint(x: 49.89, y: 18.09), controlPoint2: CGPoint(x: 51.2, y: 16.77))
      rightEyePath.addCurve(to: CGPoint(x: 55.75, y: 19.71), controlPoint1: CGPoint(x: 54.44, y: 16.77), controlPoint2: CGPoint(x: 55.75, y: 18.09))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   lazy var happyRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 55.75, y: 19.71))
      rightEyePath.addCurve(to: CGPoint(x: 53, y: 20), controlPoint1: CGPoint(x: 55.75, y: 21.33), controlPoint2: CGPoint(x: 54.62, y: 20))
      rightEyePath.addCurve(to: CGPoint(x: 49.89, y: 19.71), controlPoint1: CGPoint(x: 51.38, y: 20), controlPoint2: CGPoint(x: 49.89, y: 21.33))
      rightEyePath.addCurve(to: CGPoint(x: 52.82, y: 16.77), controlPoint1: CGPoint(x: 49.89, y: 18.09), controlPoint2: CGPoint(x: 51.2, y: 16.77))
      rightEyePath.addCurve(to: CGPoint(x: 55.75, y: 19.71), controlPoint1: CGPoint(x: 54.44, y: 16.77), controlPoint2: CGPoint(x: 55.75, y: 18.09))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   //
   lazy var happyMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      mouthPath.move(to: CGPoint(x: 43.02, y: 27.96))
      mouthPath.addCurve(to: CGPoint(x: 35.37, y: 26.72), controlPoint1: CGPoint(x: 40.24, y: 27.96), controlPoint2: CGPoint(x: 37.61, y: 27.51))
      mouthPath.addCurve(to: CGPoint(x: 34.03, y: 27.96), controlPoint1: CGPoint(x: 34.57, y: 26.42), controlPoint2: CGPoint(x: 33.83, y: 27.16))
      mouthPath.addCurve(to: CGPoint(x: 43.02, y: 34.82), controlPoint1: CGPoint(x: 35.07, y: 31.94), controlPoint2: CGPoint(x: 38.7, y: 34.82))
      mouthPath.addCurve(to: CGPoint(x: 52.02, y: 27.96), controlPoint1: CGPoint(x: 47.35, y: 34.82), controlPoint2: CGPoint(x: 50.93, y: 31.89))
      mouthPath.addCurve(to: CGPoint(x: 50.68, y: 26.72), controlPoint1: CGPoint(x: 52.22, y: 27.16), controlPoint2: CGPoint(x: 51.48, y: 26.42))
      mouthPath.addCurve(to: CGPoint(x: 43.02, y: 27.96), controlPoint1: CGPoint(x: 48.39, y: 27.51), controlPoint2: CGPoint(x: 45.81, y: 27.96))
      mouthPath.close()
      mouthPath.miterLimit = 4;
      return mouthPath.cgPath
   }()
   
   lazy var smallHappyMouthPath: CGPath = {
      //// Mouth Drawing
      let mouthPath = UIBezierPath()
      mouthPath.move(to: CGPoint(x: 43, y: 26.35))
      mouthPath.addCurve(to: CGPoint(x: 38.75, y: 25.69), controlPoint1: CGPoint(x: 41.45, y: 26.35), controlPoint2: CGPoint(x: 39.99, y: 26.11))
      mouthPath.addCurve(to: CGPoint(x: 38.01, y: 26.35), controlPoint1: CGPoint(x: 38.31, y: 25.53), controlPoint2: CGPoint(x: 37.9, y: 25.92))
      mouthPath.addCurve(to: CGPoint(x: 43, y: 30), controlPoint1: CGPoint(x: 38.59, y: 28.46), controlPoint2: CGPoint(x: 40.6, y: 30))
      mouthPath.addCurve(to: CGPoint(x: 47.98, y: 26.35), controlPoint1: CGPoint(x: 45.39, y: 30), controlPoint2: CGPoint(x: 47.38, y: 28.44))
      mouthPath.addCurve(to: CGPoint(x: 47.24, y: 25.69), controlPoint1: CGPoint(x: 48.09, y: 25.92), controlPoint2: CGPoint(x: 47.68, y: 25.53))
      mouthPath.addCurve(to: CGPoint(x: 43, y: 26.35), controlPoint1: CGPoint(x: 45.97, y: 26.11), controlPoint2: CGPoint(x: 44.54, y: 26.35))
      mouthPath.close()
      mouthPath.miterLimit = 4;
      return mouthPath.cgPath
   }()
   
   lazy var bigHappyMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      mouthPath.move(to: CGPoint(x: 43.5, y: 29.15))
      mouthPath.addCurve(to: CGPoint(x: 32.9, y: 27.73), controlPoint1: CGPoint(x: 39.64, y: 29.15), controlPoint2: CGPoint(x: 35.99, y: 28.64))
      mouthPath.addCurve(to: CGPoint(x: 31.04, y: 29.15), controlPoint1: CGPoint(x: 31.8, y: 27.38), controlPoint2: CGPoint(x: 30.76, y: 28.24))
      mouthPath.addCurve(to: CGPoint(x: 43.5, y: 37), controlPoint1: CGPoint(x: 32.48, y: 33.7), controlPoint2: CGPoint(x: 37.51, y: 37))
      mouthPath.addCurve(to: CGPoint(x: 55.95, y: 29.15), controlPoint1: CGPoint(x: 49.48, y: 37), controlPoint2: CGPoint(x: 54.44, y: 33.64))
      mouthPath.addCurve(to: CGPoint(x: 54.1, y: 27.73), controlPoint1: CGPoint(x: 56.23, y: 28.24), controlPoint2: CGPoint(x: 55.2, y: 27.38))
      mouthPath.addCurve(to: CGPoint(x: 43.5, y: 29.15), controlPoint1: CGPoint(x: 50.93, y: 28.64), controlPoint2: CGPoint(x: 47.35, y: 29.15))
      mouthPath.close()
      mouthPath.miterLimit = 4;
      return mouthPath.cgPath
   }()
   
   lazy var scaredMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      mouthPath.move(to: CGPoint(x: 42.98, y: 33.58))
      mouthPath.addCurve(to: CGPoint(x: 50.63, y: 34.82), controlPoint1: CGPoint(x: 45.76, y: 33.58), controlPoint2: CGPoint(x: 48.39, y: 34.03))
      mouthPath.addCurve(to: CGPoint(x: 51.97, y: 33.58), controlPoint1: CGPoint(x: 51.43, y: 35.12), controlPoint2: CGPoint(x: 52.17, y: 34.37))
      mouthPath.addCurve(to: CGPoint(x: 42.98, y: 26.72), controlPoint1: CGPoint(x: 50.93, y: 29.6), controlPoint2: CGPoint(x: 47.3, y: 26.72))
      mouthPath.addCurve(to: CGPoint(x: 33.98, y: 33.58), controlPoint1: CGPoint(x: 38.65, y: 26.72), controlPoint2: CGPoint(x: 35.07, y: 29.65))
      mouthPath.addCurve(to: CGPoint(x: 35.32, y: 34.82), controlPoint1: CGPoint(x: 33.78, y: 34.37), controlPoint2: CGPoint(x: 34.52, y: 35.12))
      mouthPath.addCurve(to: CGPoint(x: 42.98, y: 33.58), controlPoint1: CGPoint(x: 37.56, y: 34.03), controlPoint2: CGPoint(x: 40.19, y: 33.58))
      mouthPath.close()
      mouthPath.miterLimit = 4;
      return mouthPath.cgPath
   }()
   
   lazy var flatScaredMouthPath: CGPath = {
      let mouthPath = UIBezierPath()
      mouthPath.move(to: CGPoint(x: 42.98, y: 30.22))
      mouthPath.addCurve(to: CGPoint(x: 50.63, y: 30.85), controlPoint1: CGPoint(x: 45.76, y: 30.22), controlPoint2: CGPoint(x: 48.39, y: 30.45))
      mouthPath.addCurve(to: CGPoint(x: 51.97, y: 30.22), controlPoint1: CGPoint(x: 51.43, y: 31.01), controlPoint2: CGPoint(x: 52.17, y: 30.63))
      mouthPath.addCurve(to: CGPoint(x: 42.98, y: 26.72), controlPoint1: CGPoint(x: 50.93, y: 28.19), controlPoint2: CGPoint(x: 47.3, y: 26.72))
      mouthPath.addCurve(to: CGPoint(x: 33.98, y: 30.22), controlPoint1: CGPoint(x: 38.65, y: 26.72), controlPoint2: CGPoint(x: 35.07, y: 28.21))
      mouthPath.addCurve(to: CGPoint(x: 35.32, y: 30.85), controlPoint1: CGPoint(x: 33.78, y: 30.63), controlPoint2: CGPoint(x: 34.52, y: 31.01))
      mouthPath.addCurve(to: CGPoint(x: 42.98, y: 30.22), controlPoint1: CGPoint(x: 37.56, y: 30.45), controlPoint2: CGPoint(x: 40.19, y: 30.22))
      mouthPath.close()
      mouthPath.miterLimit = 4;
      return mouthPath.cgPath
   }()
   
   lazy var yellingMouthPath: CGPath = {
      return self.scaredMouthPath
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
      leftEyePath.move(to: CGPoint(x: 35.02, y: 16.87))
      leftEyePath.addCurve(to: CGPoint(x: 30.35, y: 18.21), controlPoint1: CGPoint(x: 33.38, y: 16.72), controlPoint2: CGPoint(x: 31.54, y: 17.42))
      leftEyePath.addCurve(to: CGPoint(x: 29.15, y: 19.31), controlPoint1: CGPoint(x: 29.9, y: 18.51), controlPoint2: CGPoint(x: 29.5, y: 18.86))
      leftEyePath.addCurve(to: CGPoint(x: 29.35, y: 19.61), controlPoint1: CGPoint(x: 29.05, y: 19.46), controlPoint2: CGPoint(x: 29.15, y: 19.66))
      leftEyePath.addCurve(to: CGPoint(x: 32.19, y: 18.96), controlPoint1: CGPoint(x: 29.95, y: 19.41), controlPoint2: CGPoint(x: 31.04, y: 19.16))
      leftEyePath.addCurve(to: CGPoint(x: 32.04, y: 19.86), controlPoint1: CGPoint(x: 32.09, y: 19.26), controlPoint2: CGPoint(x: 32.04, y: 19.56))
      leftEyePath.addCurve(to: CGPoint(x: 35, y: 19), controlPoint1: CGPoint(x: 32.04, y: 21.5), controlPoint2: CGPoint(x: 33.36, y: 19))
      leftEyePath.addCurve(to: CGPoint(x: 37.9, y: 19.86), controlPoint1: CGPoint(x: 36.64, y: 19), controlPoint2: CGPoint(x: 37.9, y: 21.5))
      leftEyePath.addCurve(to: CGPoint(x: 36.76, y: 17.57), controlPoint1: CGPoint(x: 37.9, y: 18.96), controlPoint2: CGPoint(x: 37.51, y: 18.11))
      leftEyePath.addCurve(to: CGPoint(x: 35.02, y: 16.87), controlPoint1: CGPoint(x: 36.26, y: 17.17), controlPoint2: CGPoint(x: 35.67, y: 16.97))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var angrySquintingRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 54.51, y: 16.87))
      rightEyePath.addCurve(to: CGPoint(x: 49.84, y: 18.21), controlPoint1: CGPoint(x: 52.87, y: 16.72), controlPoint2: CGPoint(x: 51.03, y: 17.42))
      rightEyePath.addCurve(to: CGPoint(x: 48.64, y: 19.31), controlPoint1: CGPoint(x: 49.39, y: 18.51), controlPoint2: CGPoint(x: 48.99, y: 18.86))
      rightEyePath.addCurve(to: CGPoint(x: 48.84, y: 19.61), controlPoint1: CGPoint(x: 48.54, y: 19.46), controlPoint2: CGPoint(x: 48.64, y: 19.66))
      rightEyePath.addCurve(to: CGPoint(x: 51.68, y: 18.96), controlPoint1: CGPoint(x: 49.44, y: 19.41), controlPoint2: CGPoint(x: 50.53, y: 19.16))
      rightEyePath.addCurve(to: CGPoint(x: 51.53, y: 19.86), controlPoint1: CGPoint(x: 51.58, y: 19.26), controlPoint2: CGPoint(x: 51.53, y: 19.56))
      rightEyePath.addCurve(to: CGPoint(x: 55, y: 19), controlPoint1: CGPoint(x: 51.53, y: 21.5), controlPoint2: CGPoint(x: 53.36, y: 19))
      rightEyePath.addCurve(to: CGPoint(x: 57.39, y: 19.86), controlPoint1: CGPoint(x: 56.64, y: 19), controlPoint2: CGPoint(x: 57.39, y: 21.5))
      rightEyePath.addCurve(to: CGPoint(x: 56.25, y: 17.57), controlPoint1: CGPoint(x: 57.39, y: 18.96), controlPoint2: CGPoint(x: 57, y: 18.11))
      rightEyePath.addCurve(to: CGPoint(x: 54.51, y: 16.87), controlPoint1: CGPoint(x: 55.75, y: 17.17), controlPoint2: CGPoint(x: 55.16, y: 16.97))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   lazy var happyWinkingRightEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 55.75, y: 19.71))
      rightEyePath.addCurve(to: CGPoint(x: 53, y: 19), controlPoint1: CGPoint(x: 55.75, y: 21.33), controlPoint2: CGPoint(x: 54.62, y: 19))
      rightEyePath.addCurve(to: CGPoint(x: 49.89, y: 19.71), controlPoint1: CGPoint(x: 51.38, y: 19), controlPoint2: CGPoint(x: 49.89, y: 21.33))
      rightEyePath.addCurve(to: CGPoint(x: 52.82, y: 16.77), controlPoint1: CGPoint(x: 49.89, y: 18.09), controlPoint2: CGPoint(x: 51.2, y: 16.77))
      rightEyePath.addCurve(to: CGPoint(x: 55.75, y: 19.71), controlPoint1: CGPoint(x: 54.44, y: 16.77), controlPoint2: CGPoint(x: 55.75, y: 18.09))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   lazy var happyWinkingLeftEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 36.26, y: 19.71))
      leftEyePath.addCurve(to: CGPoint(x: 33, y: 19), controlPoint1: CGPoint(x: 36.26, y: 21.33), controlPoint2: CGPoint(x: 34.62, y: 19))
      leftEyePath.addCurve(to: CGPoint(x: 30.4, y: 19.71), controlPoint1: CGPoint(x: 31.38, y: 19), controlPoint2: CGPoint(x: 30.4, y: 21.33))
      leftEyePath.addCurve(to: CGPoint(x: 33.33, y: 16.77), controlPoint1: CGPoint(x: 30.4, y: 18.09), controlPoint2: CGPoint(x: 31.71, y: 16.77))
      leftEyePath.addCurve(to: CGPoint(x: 36.26, y: 19.71), controlPoint1: CGPoint(x: 34.95, y: 16.77), controlPoint2: CGPoint(x: 36.26, y: 18.09))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var leftSurprisedEyePath: CGPath = {
      let leftEyePath = UIBezierPath()
      leftEyePath.move(to: CGPoint(x: 36.26, y: 20.82))
      leftEyePath.addCurve(to: CGPoint(x: 34.13, y: 22.64), controlPoint1: CGPoint(x: 36.26, y: 21.82), controlPoint2: CGPoint(x: 35.31, y: 22.64))
      leftEyePath.addCurve(to: CGPoint(x: 32, y: 20.82), controlPoint1: CGPoint(x: 32.95, y: 22.64), controlPoint2: CGPoint(x: 32, y: 21.82))
      leftEyePath.addCurve(to: CGPoint(x: 34.13, y: 19), controlPoint1: CGPoint(x: 32, y: 19.81), controlPoint2: CGPoint(x: 32.95, y: 19))
      leftEyePath.addCurve(to: CGPoint(x: 36.26, y: 20.82), controlPoint1: CGPoint(x: 35.31, y: 19), controlPoint2: CGPoint(x: 36.26, y: 19.81))
      leftEyePath.close()
      return leftEyePath.cgPath
   }()
   
   lazy var rightSurprisedEyePath: CGPath = {
      let rightEyePath = UIBezierPath()
      rightEyePath.move(to: CGPoint(x: 53.75, y: 20.71))
      rightEyePath.addCurve(to: CGPoint(x: 51.82, y: 22.64), controlPoint1: CGPoint(x: 53.75, y: 21.77), controlPoint2: CGPoint(x: 52.89, y: 22.64))
      rightEyePath.addCurve(to: CGPoint(x: 49.89, y: 20.71), controlPoint1: CGPoint(x: 50.75, y: 22.64), controlPoint2: CGPoint(x: 49.89, y: 21.77))
      rightEyePath.addCurve(to: CGPoint(x: 51.82, y: 18.77), controlPoint1: CGPoint(x: 49.89, y: 19.64), controlPoint2: CGPoint(x: 50.75, y: 18.77))
      rightEyePath.addCurve(to: CGPoint(x: 53.75, y: 20.71), controlPoint1: CGPoint(x: 52.89, y: 18.77), controlPoint2: CGPoint(x: 53.75, y: 19.64))
      rightEyePath.close()
      return rightEyePath.cgPath
   }()
   
   lazy var wingsPath: CGPath = {
      let wingsPath = UIBezierPath()
      wingsPath.move(to: CGPoint(x: 68.68, y: 59.38))
      wingsPath.addLine(to: CGPoint(x: 17.32, y: 59.38))
      wingsPath.addCurve(to: CGPoint(x: 3, y: 45.06), controlPoint1: CGPoint(x: 9.41, y: 59.38), controlPoint2: CGPoint(x: 3, y: 52.92))
      wingsPath.addCurve(to: CGPoint(x: 17.32, y: 30.74), controlPoint1: CGPoint(x: 3, y: 37.16), controlPoint2: CGPoint(x: 9.46, y: 30.74))
      wingsPath.addLine(to: CGPoint(x: 68.68, y: 30.74))
      wingsPath.addCurve(to: CGPoint(x: 83, y: 45.06), controlPoint1: CGPoint(x: 76.59, y: 30.74), controlPoint2: CGPoint(x: 83, y: 37.21))
      wingsPath.addCurve(to: CGPoint(x: 68.68, y: 59.38), controlPoint1: CGPoint(x: 83, y: 52.92), controlPoint2: CGPoint(x: 76.59, y: 59.38))
      wingsPath.close()
      wingsPath.miterLimit = 4;
      return wingsPath.cgPath
   }()
}
