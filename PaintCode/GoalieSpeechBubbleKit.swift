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
   static func drawBubbleWithColor(_ color: UIColor, tailDirection: BubbleTailDirection, inFrame frame: CGRect)
   {
      switch tailDirection
      {
      case .left: _drawBubblePointingLeft(frame: frame, withColor: color)
      case .right: _drawBubblePointingRight(frame: frame, withColor: color)
      }
   }
   
   fileprivate static func _drawBubblePointingLeft(frame: CGRect = CGRect(x: 0, y: 0, width: 180, height: 87), withColor color: UIColor) {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Shadow Declarations
      let speechBubbleShadow = NSShadow()
      speechBubbleShadow.shadowColor = UIColor.black.withAlphaComponent(0.2)
      speechBubbleShadow.shadowOffset = CGSize(width: 0.1, height: 3.1)
      speechBubbleShadow.shadowBlurRadius = 5
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.move(to: CGPoint(x: frame.minX + 17.65, y: frame.maxY - 22.55))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 24.15, y: frame.maxY - 22.55))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 24.15, y: frame.maxY - 12))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 38.05, y: frame.maxY - 22.55))
      bezierPath.addLine(to: CGPoint(x: frame.maxX - 18.95, y: frame.maxY - 22.55))
      bezierPath.addCurve(to: CGPoint(x: frame.maxX - 15.45, y: frame.maxY - 26.05), controlPoint1: CGPoint(x: frame.maxX - 17.05, y: frame.maxY - 22.55), controlPoint2: CGPoint(x: frame.maxX - 15.45, y: frame.maxY - 24.1))
      bezierPath.addLine(to: CGPoint(x: frame.maxX - 14.3, y: frame.minY + 8.5))
      bezierPath.addCurve(to: CGPoint(x: frame.maxX - 17.8, y: frame.minY + 5), controlPoint1: CGPoint(x: frame.maxX - 14.3, y: frame.minY + 6.6), controlPoint2: CGPoint(x: frame.maxX - 15.85, y: frame.minY + 5))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 16.5, y: frame.minY + 5))
      bezierPath.addCurve(to: CGPoint(x: frame.minX + 13, y: frame.minY + 8.5), controlPoint1: CGPoint(x: frame.minX + 14.6, y: frame.minY + 5), controlPoint2: CGPoint(x: frame.minX + 13, y: frame.minY + 6.55))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 14.15, y: frame.maxY - 26.05))
      bezierPath.addCurve(to: CGPoint(x: frame.minX + 17.65, y: frame.maxY - 22.55), controlPoint1: CGPoint(x: frame.minX + 14.2, y: frame.maxY - 24.15), controlPoint2: CGPoint(x: frame.minX + 15.75, y: frame.maxY - 22.55))
      bezierPath.close()
      bezierPath.miterLimit = 4;
      
      context!.saveGState()
      context!.setShadow(offset: speechBubbleShadow.shadowOffset, blur: speechBubbleShadow.shadowBlurRadius, color: (speechBubbleShadow.shadowColor as! UIColor).cgColor)
      color.setFill()
      bezierPath.fill()
      context!.restoreGState()
   }
   
   fileprivate static func _drawBubblePointingRight(frame: CGRect = CGRect(x: 0, y: 0, width: 180, height: 87), withColor color: UIColor) {
      //// General Declarations
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Shadow Declarations
      let speechBubbleShadow = NSShadow()
      speechBubbleShadow.shadowColor = UIColor.black.withAlphaComponent(0.2)
      speechBubbleShadow.shadowOffset = CGSize(width: 0.1, height: 3.1)
      speechBubbleShadow.shadowBlurRadius = 5
      
      //// Bezier Drawing
      let bezierPath = UIBezierPath()
      bezierPath.move(to: CGPoint(x: frame.minX + 17.65, y: frame.maxY - 22.55))
      bezierPath.addLine(to: CGPoint(x: frame.maxX - 39.35, y: frame.maxY - 22.55))
      bezierPath.addLine(to: CGPoint(x: frame.maxX - 25.45, y: frame.maxY - 12))
      bezierPath.addLine(to: CGPoint(x: frame.maxX - 25.45, y: frame.maxY - 22.55))
      bezierPath.addLine(to: CGPoint(x: frame.maxX - 18.95, y: frame.maxY - 22.55))
      bezierPath.addCurve(to: CGPoint(x: frame.maxX - 15.45, y: frame.maxY - 26.05), controlPoint1: CGPoint(x: frame.maxX - 17.05, y: frame.maxY - 22.55), controlPoint2: CGPoint(x: frame.maxX - 15.45, y: frame.maxY - 24.1))
      bezierPath.addLine(to: CGPoint(x: frame.maxX - 14.3, y: frame.minY + 8.5))
      bezierPath.addCurve(to: CGPoint(x: frame.maxX - 17.8, y: frame.minY + 5), controlPoint1: CGPoint(x: frame.maxX - 14.3, y: frame.minY + 6.6), controlPoint2: CGPoint(x: frame.maxX - 15.85, y: frame.minY + 5))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 16.5, y: frame.minY + 5))
      bezierPath.addCurve(to: CGPoint(x: frame.minX + 13, y: frame.minY + 8.5), controlPoint1: CGPoint(x: frame.minX + 14.6, y: frame.minY + 5), controlPoint2: CGPoint(x: frame.minX + 13, y: frame.minY + 6.55))
      bezierPath.addLine(to: CGPoint(x: frame.minX + 14.15, y: frame.maxY - 26.05))
      bezierPath.addCurve(to: CGPoint(x: frame.minX + 17.65, y: frame.maxY - 22.55), controlPoint1: CGPoint(x: frame.minX + 14.2, y: frame.maxY - 24.15), controlPoint2: CGPoint(x: frame.minX + 15.75, y: frame.maxY - 22.55))
      bezierPath.close()
      bezierPath.miterLimit = 4;
      
      context!.saveGState()
      context!.setShadow(offset: speechBubbleShadow.shadowOffset, blur: speechBubbleShadow.shadowBlurRadius, color: (speechBubbleShadow.shadowColor as! UIColor).cgColor)
      color.setFill()
      bezierPath.fill()
      context!.restoreGState()
   }
}
