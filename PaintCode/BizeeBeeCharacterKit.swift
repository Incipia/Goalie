//
//  BizeeBeeCharacterKit.swift
//  Goalie
//
//  Created by Gregory Klein on 2/9/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class BizeeBeeCharacterKit
{
   class func drawAccessoriesForPriority(priority: TaskPriority)
   {
      switch priority
      {
      case .Ages:
         //// Sunglasses Drawing
         let sunglassesPath = UIBezierPath()
         sunglassesPath.moveToPoint(CGPointMake(57.54, 14.78))
         sunglassesPath.addCurveToPoint(CGPointMake(53.07, 16.28), controlPoint1: CGPointMake(56.05, 14.04), controlPoint2: CGPointMake(54.21, 14.73))
         sunglassesPath.addCurveToPoint(CGPointMake(48.59, 14.78), controlPoint1: CGPointMake(51.97, 14.73), controlPoint2: CGPointMake(50.09, 14.04))
         sunglassesPath.addCurveToPoint(CGPointMake(46.85, 17.72), controlPoint1: CGPointMake(47.5, 15.33), controlPoint2: CGPointMake(46.9, 16.42))
         sunglassesPath.addCurveToPoint(CGPointMake(39.35, 17.57), controlPoint1: CGPointMake(43.62, 16.57), controlPoint2: CGPointMake(41.09, 16.92))
         sunglassesPath.addCurveToPoint(CGPointMake(37.61, 14.78), controlPoint1: CGPointMake(39.25, 16.37), controlPoint2: CGPointMake(38.65, 15.28))
         sunglassesPath.addCurveToPoint(CGPointMake(33.13, 16.28), controlPoint1: CGPointMake(36.11, 14.04), controlPoint2: CGPointMake(34.27, 14.73))
         sunglassesPath.addCurveToPoint(CGPointMake(28.66, 14.78), controlPoint1: CGPointMake(32.04, 14.73), controlPoint2: CGPointMake(30.15, 14.04))
         sunglassesPath.addCurveToPoint(CGPointMake(27.41, 20), controlPoint1: CGPointMake(26.97, 15.63), controlPoint2: CGPointMake(26.37, 17.97))
         sunglassesPath.addCurveToPoint(CGPointMake(32.68, 25.13), controlPoint1: CGPointMake(28.31, 21.84), controlPoint2: CGPointMake(30.64, 24.63))
         sunglassesPath.addCurveToPoint(CGPointMake(38.4, 20.75), controlPoint1: CGPointMake(34.77, 25.62), controlPoint2: CGPointMake(37.21, 22.74))
         sunglassesPath.addCurveToPoint(CGPointMake(47.8, 20.8), controlPoint1: CGPointMake(38.55, 20.65), controlPoint2: CGPointMake(42.03, 17.82))
         sunglassesPath.addCurveToPoint(CGPointMake(52.62, 25.08), controlPoint1: CGPointMake(48.89, 22.54), controlPoint2: CGPointMake(50.83, 24.68))
         sunglassesPath.addCurveToPoint(CGPointMake(58.79, 19.95), controlPoint1: CGPointMake(54.96, 25.62), controlPoint2: CGPointMake(57.84, 21.84))
         sunglassesPath.addCurveToPoint(CGPointMake(57.54, 14.78), controlPoint1: CGPointMake(59.83, 17.97), controlPoint2: CGPointMake(59.23, 15.63))
         sunglassesPath.closePath()
         sunglassesPath.miterLimit = 4;
         
         UIColor(priority: priority, headComponent: .Stripe).setFill()
         sunglassesPath.fill()
         break
      default:
         break
      }
   }
   
   class func drawBody(bodyColor: UIColor, cheekColor: UIColor, stripeColor: UIColor)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Color Declarations
      let wingColor = UIColor(red: 0.965, green: 0.753, blue: 0.843, alpha: 0.302)
      
      //// Shadow Declarations
      let shadow = NSShadow()
      shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
      shadow.shadowOffset = CGSizeMake(-1.1, 4.1)
      shadow.shadowBlurRadius = 8
      
      //// Group 2
      //// Wings Drawing
      let wingsPath = UIBezierPath()
      wingsPath.moveToPoint(CGPointMake(68.68, 59.38))
      wingsPath.addLineToPoint(CGPointMake(17.32, 59.38))
      wingsPath.addCurveToPoint(CGPointMake(3, 45.06), controlPoint1: CGPointMake(9.41, 59.38), controlPoint2: CGPointMake(3, 52.92))
      wingsPath.addCurveToPoint(CGPointMake(17.32, 30.74), controlPoint1: CGPointMake(3, 37.16), controlPoint2: CGPointMake(9.46, 30.74))
      wingsPath.addLineToPoint(CGPointMake(68.68, 30.74))
      wingsPath.addCurveToPoint(CGPointMake(83, 45.06), controlPoint1: CGPointMake(76.59, 30.74), controlPoint2: CGPointMake(83, 37.21))
      wingsPath.addCurveToPoint(CGPointMake(68.68, 59.38), controlPoint1: CGPointMake(83, 52.92), controlPoint2: CGPointMake(76.59, 59.38))
      wingsPath.closePath()
      wingsPath.miterLimit = 4;
      
      wingColor.setFill()
      wingsPath.fill()
      
      
      //// BodyOutline Drawing
      let bodyOutlinePath = UIBezierPath()
      bodyOutlinePath.moveToPoint(CGPointMake(65.65, 13.54))
      bodyOutlinePath.addCurveToPoint(CGPointMake(72.56, 32.24), controlPoint1: CGPointMake(69.97, 18.66), controlPoint2: CGPointMake(72.56, 25.18))
      bodyOutlinePath.addCurveToPoint(CGPointMake(72.56, 32.43), controlPoint1: CGPointMake(72.56, 32.29), controlPoint2: CGPointMake(72.56, 32.38))
      bodyOutlinePath.addCurveToPoint(CGPointMake(70.82, 42.48), controlPoint1: CGPointMake(72.56, 35.82), controlPoint2: CGPointMake(72.01, 39.25))
      bodyOutlinePath.addCurveToPoint(CGPointMake(52.87, 82.1), controlPoint1: CGPointMake(65.75, 56.15), controlPoint2: CGPointMake(53.22, 66.74))
      bodyOutlinePath.addCurveToPoint(CGPointMake(49.39, 83.99), controlPoint1: CGPointMake(52.82, 83.85), controlPoint2: CGPointMake(50.88, 84.94))
      bodyOutlinePath.addCurveToPoint(CGPointMake(16.67, 50.09), controlPoint1: CGPointMake(36.11, 75.99), controlPoint2: CGPointMake(22.99, 64.55))
      bodyOutlinePath.addCurveToPoint(CGPointMake(28.26, 7.18), controlPoint1: CGPointMake(10.26, 35.37), controlPoint2: CGPointMake(13.94, 15.83))
      bodyOutlinePath.addCurveToPoint(CGPointMake(43.37, 3), controlPoint1: CGPointMake(32.78, 4.44), controlPoint2: CGPointMake(38.05, 3))
      bodyOutlinePath.addCurveToPoint(CGPointMake(65.65, 13.54), controlPoint1: CGPointMake(52.22, 3), controlPoint2: CGPointMake(60.23, 7.13))
      bodyOutlinePath.closePath()
      bodyOutlinePath.miterLimit = 4;
      
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, (shadow.shadowColor as! UIColor).CGColor)
      bodyColor.setFill()
      bodyOutlinePath.fill()
      CGContextRestoreGState(context)
      
      
      
      //// Left Cheek Drawing
      let leftCheekPath = UIBezierPath(ovalInRect: CGRectMake(23.88, 25.18, 5.47, 5.47))
      stripeColor.setFill()
      leftCheekPath.fill()
      
      
      //// Right Cheek Drawing
      let rightCheekPath = UIBezierPath(ovalInRect: CGRectMake(56.85, 25.18, 5.47, 5.47))
      stripeColor.setFill()
      rightCheekPath.fill()
      
      
      //// Bottom Stripe Drawing
      let bottomStripePath = UIBezierPath()
      bottomStripePath.moveToPoint(CGPointMake(52.87, 82.15))
      bottomStripePath.addCurveToPoint(CGPointMake(53.57, 76.44), controlPoint1: CGPointMake(52.92, 80.17), controlPoint2: CGPointMake(53.17, 78.28))
      bottomStripePath.addLineToPoint(CGPointMake(38.4, 76.44))
      bottomStripePath.addCurveToPoint(CGPointMake(49.34, 84.04), controlPoint1: CGPointMake(42.08, 79.37), controlPoint2: CGPointMake(45.81, 81.96))
      bottomStripePath.addCurveToPoint(CGPointMake(52.87, 82.15), controlPoint1: CGPointMake(50.88, 84.94), controlPoint2: CGPointMake(52.87, 83.89))
      bottomStripePath.closePath()
      bottomStripePath.miterLimit = 4;
      
      stripeColor.setFill()
      bottomStripePath.fill()
      
      
      //// Middle Stripe Drawing
      let middleStripePath = UIBezierPath()
      middleStripePath.moveToPoint(CGPointMake(56.4, 68.33))
      middleStripePath.addCurveToPoint(CGPointMake(61.02, 60.08), controlPoint1: CGPointMake(57.74, 65.5), controlPoint2: CGPointMake(59.33, 62.76))
      middleStripePath.addLineToPoint(CGPointMake(22.44, 60.08))
      middleStripePath.addCurveToPoint(CGPointMake(29.45, 68.33), controlPoint1: CGPointMake(24.53, 62.96), controlPoint2: CGPointMake(26.92, 65.75))
      middleStripePath.addLineToPoint(CGPointMake(56.4, 68.33))
      middleStripePath.closePath()
      middleStripePath.miterLimit = 4;
      
      stripeColor.setFill()
      middleStripePath.fill()
      
      
      //// Top Stripe Drawing
      let topStripePath = UIBezierPath()
      topStripePath.moveToPoint(CGPointMake(66.14, 51.97))
      topStripePath.addCurveToPoint(CGPointMake(70.37, 43.72), controlPoint1: CGPointMake(67.74, 49.29), controlPoint2: CGPointMake(69.23, 46.55))
      topStripePath.addLineToPoint(CGPointMake(14.49, 43.72))
      topStripePath.addCurveToPoint(CGPointMake(17.52, 51.97), controlPoint1: CGPointMake(15.18, 46.55), controlPoint2: CGPointMake(16.18, 49.29))
      topStripePath.addLineToPoint(CGPointMake(66.14, 51.97))
      topStripePath.closePath()
      topStripePath.miterLimit = 4;
      
      stripeColor.setFill()
      topStripePath.fill()
   }
}
