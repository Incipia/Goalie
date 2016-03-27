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
}

class ChecklistorFacePathProvider: GoalieFacePathProvider
{
}
