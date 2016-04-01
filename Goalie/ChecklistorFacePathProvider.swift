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
   lazy var normalEyePath: CGPathRef = {
      let eyePath = UIBezierPath(ovalInRect: CGRectMake(36.25, 26.5, 6.4, 6.4))
      return eyePath.CGPath
   }()
   
   lazy var gushyEyePath: CGPathRef = {
      let eyePath = UIBezierPath()
      eyePath.moveToPoint(CGPointMake(46, 29.01))
      eyePath.addCurveToPoint(CGPointMake(39.71, 33), controlPoint1: CGPointMake(46, 32.34), controlPoint2: CGPointMake(43.37, 33))
      eyePath.addCurveToPoint(CGPointMake(32.75, 29.01), controlPoint1: CGPointMake(36.05, 33), controlPoint2: CGPointMake(32.75, 32.34))
      eyePath.addCurveToPoint(CGPointMake(39.37, 23), controlPoint1: CGPointMake(32.75, 25.69), controlPoint2: CGPointMake(35.72, 23))
      eyePath.addCurveToPoint(CGPointMake(46, 29.01), controlPoint1: CGPointMake(43.03, 23), controlPoint2: CGPointMake(46, 25.69))
      eyePath.closePath()
      return eyePath.CGPath
   }()
   
   lazy var bigEyePath: CGPathRef = {
      let eyePath = UIBezierPath(ovalInRect: CGRectMake(33.0, 23.5, 12.75, 12.5))
      return eyePath.CGPath
   }()
   
   lazy var bigVerticalEyePath: CGPathRef = {
      let eyePath = UIBezierPath()
      eyePath.moveToPoint(CGPointMake(43, 30))
      eyePath.addCurveToPoint(CGPointMake(39.62, 38), controlPoint1: CGPointMake(43, 34.42), controlPoint2: CGPointMake(41.49, 38))
      eyePath.addCurveToPoint(CGPointMake(36.25, 30), controlPoint1: CGPointMake(37.76, 38), controlPoint2: CGPointMake(36.25, 34.42))
      eyePath.addCurveToPoint(CGPointMake(39.62, 22), controlPoint1: CGPointMake(36.25, 25.58), controlPoint2: CGPointMake(37.76, 22))
      eyePath.addCurveToPoint(CGPointMake(43, 30), controlPoint1: CGPointMake(41.49, 22), controlPoint2: CGPointMake(43, 25.58))
      eyePath.closePath()
      return eyePath.CGPath
   }()
   
   lazy var thinHorizontalEyePath: CGPathRef = {
      let eyePath = UIBezierPath()
      eyePath.moveToPoint(CGPointMake(47, 29.5))
      eyePath.addCurveToPoint(CGPointMake(39.5, 32), controlPoint1: CGPointMake(47, 30.88), controlPoint2: CGPointMake(43.64, 32))
      eyePath.addCurveToPoint(CGPointMake(32, 29.5), controlPoint1: CGPointMake(35.36, 32), controlPoint2: CGPointMake(32, 30.88))
      eyePath.addCurveToPoint(CGPointMake(39.5, 27), controlPoint1: CGPointMake(32, 28.12), controlPoint2: CGPointMake(35.36, 27))
      eyePath.addCurveToPoint(CGPointMake(47, 29.5), controlPoint1: CGPointMake(43.64, 27), controlPoint2: CGPointMake(47, 28.12))
      eyePath.closePath()
      return eyePath.CGPath
   }()
   
   lazy var lookingDownEyePath: CGPathRef = {
      let eyePath = UIBezierPath()
      eyePath.moveToPoint(CGPointMake(43, 34.5))
      eyePath.addCurveToPoint(CGPointMake(39.12, 38), controlPoint1: CGPointMake(43, 36.43), controlPoint2: CGPointMake(41.27, 38))
      eyePath.addCurveToPoint(CGPointMake(35.25, 34.5), controlPoint1: CGPointMake(36.98, 38), controlPoint2: CGPointMake(35.25, 36.43))
      eyePath.addCurveToPoint(CGPointMake(39.12, 31), controlPoint1: CGPointMake(35.25, 32.57), controlPoint2: CGPointMake(36.98, 31))
      eyePath.addCurveToPoint(CGPointMake(43, 34.5), controlPoint1: CGPointMake(41.27, 31), controlPoint2: CGPointMake(43, 32.57))
      eyePath.closePath()
      return eyePath.CGPath
   }()
}

class ChecklistorFacePathProvider: GoalieFacePathProvider
{
}
