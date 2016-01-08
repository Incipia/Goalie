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
      bezierPath.moveToPoint(CGPointMake(frame.minX + 6.65, frame.maxY - 12.55))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 13.15, frame.maxY - 12.55))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 13.2, frame.maxY - 2))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 27.05, frame.maxY - 12.55))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 6.95, frame.maxY - 12.55))
      bezierPath.addCurveToPoint(CGPointMake(frame.maxX - 3.45, frame.maxY - 16.05), controlPoint1: CGPointMake(frame.maxX - 5.05, frame.maxY - 12.55), controlPoint2: CGPointMake(frame.maxX - 3.45, frame.maxY - 14.1))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 2.3, frame.minY + 5.5))
      bezierPath.addCurveToPoint(CGPointMake(frame.maxX - 5.8, frame.minY + 2), controlPoint1: CGPointMake(frame.maxX - 2.3, frame.minY + 3.6), controlPoint2: CGPointMake(frame.maxX - 3.85, frame.minY + 2))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 5.5, frame.minY + 2))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 2, frame.minY + 5.5), controlPoint1: CGPointMake(frame.minX + 3.6, frame.minY + 2), controlPoint2: CGPointMake(frame.minX + 2, frame.minY + 3.55))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 3.15, frame.maxY - 16.05))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 6.65, frame.maxY - 12.55), controlPoint1: CGPointMake(frame.minX + 3.2, frame.maxY - 14.15), controlPoint2: CGPointMake(frame.minX + 4.75, frame.maxY - 12.55))
      bezierPath.closePath()
      bezierPath.miterLimit = 4;
      
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, speechBubbleShadow.shadowOffset, speechBubbleShadow.shadowBlurRadius, (speechBubbleShadow.shadowColor as! UIColor).CGColor)
      color.setFill()
      bezierPath.fill()
      CGContextRestoreGState(context)
   }
   
   private static func _drawBubblePointingRight(frame frame: CGRect = CGRectMake(0, 0, 180, 87), withColor color: UIColor) {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Shadow Declarations
      let speechBubbleShadow = NSShadow()
      speechBubbleShadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
      speechBubbleShadow.shadowOffset = CGSizeMake(0.1, 3.1)
      speechBubbleShadow.shadowBlurRadius = 5
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.moveToPoint(CGPointMake(frame.minX + 6.65, frame.maxY - 12.55))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 27.35, frame.maxY - 12.55))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 13.45, frame.maxY - 2))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 13.45, frame.maxY - 12.55))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 6.95, frame.maxY - 12.55))
      bezierPath.addCurveToPoint(CGPointMake(frame.maxX - 3.45, frame.maxY - 16.05), controlPoint1: CGPointMake(frame.maxX - 5.05, frame.maxY - 12.55), controlPoint2: CGPointMake(frame.maxX - 3.45, frame.maxY - 14.1))
      bezierPath.addLineToPoint(CGPointMake(frame.maxX - 2.3, frame.minY + 5.5))
      bezierPath.addCurveToPoint(CGPointMake(frame.maxX - 5.8, frame.minY + 2), controlPoint1: CGPointMake(frame.maxX - 2.3, frame.minY + 3.6), controlPoint2: CGPointMake(frame.maxX - 3.85, frame.minY + 2))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 5.5, frame.minY + 2))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 2, frame.minY + 5.5), controlPoint1: CGPointMake(frame.minX + 3.6, frame.minY + 2), controlPoint2: CGPointMake(frame.minX + 2, frame.minY + 3.55))
      bezierPath.addLineToPoint(CGPointMake(frame.minX + 3.15, frame.maxY - 16.05))
      bezierPath.addCurveToPoint(CGPointMake(frame.minX + 6.65, frame.maxY - 12.55), controlPoint1: CGPointMake(frame.minX + 3.2, frame.maxY - 14.15), controlPoint2: CGPointMake(frame.minX + 4.75, frame.maxY - 12.55))
      bezierPath.closePath()
      bezierPath.miterLimit = 4;
      
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, speechBubbleShadow.shadowOffset, speechBubbleShadow.shadowBlurRadius, (speechBubbleShadow.shadowColor as! UIColor).CGColor)
      color.setFill()
      bezierPath.fill()
      CGContextRestoreGState(context)
   }
}