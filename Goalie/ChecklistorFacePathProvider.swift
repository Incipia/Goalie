//
//  ChecklistorFacePathProvider.swift
//  Goalie
//
//  Created by Gregory Klein on 3/25/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class ChecklistorEyePathProvider
{
   lazy var normalEyePath: CGPath = {
      let eyePath = UIBezierPath(ovalIn: CGRect(x: 36.25, y: 26.5, width: 6.4, height: 6.4))
      return eyePath.cgPath
   }()
   
   lazy var gushyEyePath: CGPath = {
      let eyePath = UIBezierPath()
      eyePath.move(to: CGPoint(x: 46, y: 29.01))
      eyePath.addCurve(to: CGPoint(x: 39.71, y: 33), controlPoint1: CGPoint(x: 46, y: 32.34), controlPoint2: CGPoint(x: 43.37, y: 33))
      eyePath.addCurve(to: CGPoint(x: 32.75, y: 29.01), controlPoint1: CGPoint(x: 36.05, y: 33), controlPoint2: CGPoint(x: 32.75, y: 32.34))
      eyePath.addCurve(to: CGPoint(x: 39.37, y: 23), controlPoint1: CGPoint(x: 32.75, y: 25.69), controlPoint2: CGPoint(x: 35.72, y: 23))
      eyePath.addCurve(to: CGPoint(x: 46, y: 29.01), controlPoint1: CGPoint(x: 43.03, y: 23), controlPoint2: CGPoint(x: 46, y: 25.69))
      eyePath.close()
      return eyePath.cgPath
   }()
   
   lazy var bigEyePath: CGPath = {
      let eyePath = UIBezierPath(ovalIn: CGRect(x: 33.0, y: 23.5, width: 12.75, height: 12.5))
      return eyePath.cgPath
   }()
   
   lazy var bigVerticalEyePath: CGPath = {
      let eyePath = UIBezierPath()
      eyePath.move(to: CGPoint(x: 43, y: 30))
      eyePath.addCurve(to: CGPoint(x: 39.62, y: 38), controlPoint1: CGPoint(x: 43, y: 34.42), controlPoint2: CGPoint(x: 41.49, y: 38))
      eyePath.addCurve(to: CGPoint(x: 36.25, y: 30), controlPoint1: CGPoint(x: 37.76, y: 38), controlPoint2: CGPoint(x: 36.25, y: 34.42))
      eyePath.addCurve(to: CGPoint(x: 39.62, y: 22), controlPoint1: CGPoint(x: 36.25, y: 25.58), controlPoint2: CGPoint(x: 37.76, y: 22))
      eyePath.addCurve(to: CGPoint(x: 43, y: 30), controlPoint1: CGPoint(x: 41.49, y: 22), controlPoint2: CGPoint(x: 43, y: 25.58))
      eyePath.close()
      return eyePath.cgPath
   }()
   
   lazy var thinHorizontalEyePath: CGPath = {
      let eyePath = UIBezierPath()
      eyePath.move(to: CGPoint(x: 47, y: 29.5))
      eyePath.addCurve(to: CGPoint(x: 39.5, y: 32), controlPoint1: CGPoint(x: 47, y: 30.88), controlPoint2: CGPoint(x: 43.64, y: 32))
      eyePath.addCurve(to: CGPoint(x: 32, y: 29.5), controlPoint1: CGPoint(x: 35.36, y: 32), controlPoint2: CGPoint(x: 32, y: 30.88))
      eyePath.addCurve(to: CGPoint(x: 39.5, y: 27), controlPoint1: CGPoint(x: 32, y: 28.12), controlPoint2: CGPoint(x: 35.36, y: 27))
      eyePath.addCurve(to: CGPoint(x: 47, y: 29.5), controlPoint1: CGPoint(x: 43.64, y: 27), controlPoint2: CGPoint(x: 47, y: 28.12))
      eyePath.close()
      return eyePath.cgPath
   }()
   
   lazy var lookingDownEyePath: CGPath = {
      let eyePath = UIBezierPath()
      eyePath.move(to: CGPoint(x: 43, y: 34.5))
      eyePath.addCurve(to: CGPoint(x: 39.12, y: 38), controlPoint1: CGPoint(x: 43, y: 36.43), controlPoint2: CGPoint(x: 41.27, y: 38))
      eyePath.addCurve(to: CGPoint(x: 35.25, y: 34.5), controlPoint1: CGPoint(x: 36.98, y: 38), controlPoint2: CGPoint(x: 35.25, y: 36.43))
      eyePath.addCurve(to: CGPoint(x: 39.12, y: 31), controlPoint1: CGPoint(x: 35.25, y: 32.57), controlPoint2: CGPoint(x: 36.98, y: 31))
      eyePath.addCurve(to: CGPoint(x: 43, y: 34.5), controlPoint1: CGPoint(x: 41.27, y: 31), controlPoint2: CGPoint(x: 43, y: 32.57))
      eyePath.close()
      return eyePath.cgPath
   }()
}

class ChecklistorFacePathProvider: GoalieFacePathProvider
{
}
