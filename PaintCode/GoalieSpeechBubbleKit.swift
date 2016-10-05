//
//  File.swift
//  Goalie
//
//  Created by Gregory Klein on 1/7/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

struct GoalieSpeechBubbleKit
{
   static func drawBubbleWithColor(color: UIColor, tailDirection: BubbleTailDirection, inFrame frame: CGRect)
   {
      switch tailDirection
      {
      case .Left: _drawBubblePointingLeft(frame: frame, withColor: color)
      case .Right: _drawBubblePointingRight(frame: frame, withColor: color)
      }
   }
   
   private static func _drawBubblePointingLeft(frame frame: CGRect = CGRectMake(0, 0, 180, 87), withColor color: UIColor) {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Shadow Declarations
      let speechBubbleShadow = NSShadow()
      speechBubbleShadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
      speechBubbleShadow.shadowOffset = CGSizeMake(0.1, 3.1)
      speechBubbleShadow.shadowBlurRadius = 5
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(frame.minX + 17.65, frame.maxY - 22.55))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 24.15, frame.maxY - 22.55))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 24.15, frame.maxY - 12))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 38.05, frame.maxY - 22.55))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 18.95, frame.maxY - 22.55))
      bezierPath.addCurveToPoint(CGPointMake(frame.maxX - 15.45, frame.maxY - 26.05), controlPoint1: CGPointMake(frame.maxX - 17.05, frame.maxY - 22.55), controlPoint2: CGPointMake(frame.maxX - 15.45, frame.maxY - 24.1))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 14.3, frame.minY + 8.5))
      bezierPath.addCurveToPoint(CGPointMake(frame.maxX - 17.8, frame.minY + 5), controlPoint1: CGPointMake(frame.maxX - 14.3, frame.minY + 6.6), controlPoint2: CGPointMake(frame.maxX - 15.85, frame.minY + 5))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 16.5, frame.minY + 5))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 13, frame.minY + 8.5), controlPoint1: CGPointMake(frame.minX + 14.6, frame.minY + 5), controlPoint2: CGPointMake(frame.minX + 13, frame.minY + 6.55))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 14.15, frame.maxY - 26.05))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 17.65, frame.maxY - 22.55), controlPoint1: CGPointMake(frame.minX + 14.2, frame.maxY - 24.15), controlPoint2: CGPointMake(frame.minX + 15.75, frame.maxY - 22.55))
      bezierPath.closePath()
      bezierPath.miterLimit = 4;
      
      CGContextSaveGState(context!)
      CGContextSetShadowWithColor(context!, speechBubbleShadow.shadowOffset, speechBubbleShadow.shadowBlurRadius, (speechBubbleShadow.shadowColor as! UIColor).CGColor)
      color.setFill()
      bezierPath.fill()
      CGContextRestoreGState(context!)
   }
   
   private static func _drawBubblePointingRight(frame frame: CGRect = CGRectMake(0, 0, 180, 87), withColor color: UIColor) {
      //// General Declarations
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Shadow Declarations
      let speechBubbleShadow = NSShadow()
      speechBubbleShadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
      speechBubbleShadow.shadowOffset = CGSizeMake(0.1, 3.1)
      speechBubbleShadow.shadowBlurRadius = 5
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(frame.minX + 17.65, frame.maxY - 22.55))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 39.35, frame.maxY - 22.55))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 25.45, frame.maxY - 12))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 25.45, frame.maxY - 22.55))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 18.95, frame.maxY - 22.55))
      bezierPath.addCurveToPoint(CGPointMake(frame.maxX - 15.45, frame.maxY - 26.05), controlPoint1: CGPointMake(frame.maxX - 17.05, frame.maxY - 22.55), controlPoint2: CGPointMake(frame.maxX - 15.45, frame.maxY - 24.1))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 14.3, frame.minY + 8.5))
      bezierPath.addCurveToPoint(CGPointMake(frame.maxX - 17.8, frame.minY + 5), controlPoint1: CGPointMake(frame.maxX - 14.3, frame.minY + 6.6), controlPoint2: CGPointMake(frame.maxX - 15.85, frame.minY + 5))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 16.5, frame.minY + 5))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 13, frame.minY + 8.5), controlPoint1: CGPointMake(frame.minX + 14.6, frame.minY + 5), controlPoint2: CGPointMake(frame.minX + 13, frame.minY + 6.55))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 14.15, frame.maxY - 26.05))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 17.65, frame.maxY - 22.55), controlPoint1: CGPointMake(frame.minX + 14.2, frame.maxY - 24.15), controlPoint2: CGPointMake(frame.minX + 15.75, frame.maxY - 22.55))
      bezierPath.closePath()
      bezierPath.miterLimit = 4;
      
      CGContextSaveGState(context!)
      CGContextSetShadowWithColor(context!, speechBubbleShadow.shadowOffset, speechBubbleShadow.shadowBlurRadius, (speechBubbleShadow.shadowColor as! UIColor).CGColor)
      color.setFill()
      bezierPath.fill()
      CGContextRestoreGState(context!)
   }
}
