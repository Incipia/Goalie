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
         sunglassesPath.moveToPoint(CGPointMake(61.54, 19.78))
         sunglassesPath.addCurveToPoint(CGPointMake(57.07, 21.28), controlPoint1: CGPointMake(60.05, 19.04), controlPoint2: CGPointMake(58.21, 19.73))
         sunglassesPath.addCurveToPoint(CGPointMake(52.59, 19.78), controlPoint1: CGPointMake(55.97, 19.73), controlPoint2: CGPointMake(54.09, 19.04))
         sunglassesPath.addCurveToPoint(CGPointMake(50.85, 22.72), controlPoint1: CGPointMake(51.5, 20.33), controlPoint2: CGPointMake(50.9, 21.42))
         sunglassesPath.addCurveToPoint(CGPointMake(43.35, 22.57), controlPoint1: CGPointMake(47.62, 21.57), controlPoint2: CGPointMake(45.09, 21.92))
         sunglassesPath.addCurveToPoint(CGPointMake(41.61, 19.78), controlPoint1: CGPointMake(43.25, 21.37), controlPoint2: CGPointMake(42.65, 20.28))
         sunglassesPath.addCurveToPoint(CGPointMake(37.13, 21.28), controlPoint1: CGPointMake(40.11, 19.04), controlPoint2: CGPointMake(38.27, 19.73))
         sunglassesPath.addCurveToPoint(CGPointMake(32.66, 19.78), controlPoint1: CGPointMake(36.04, 19.73), controlPoint2: CGPointMake(34.15, 19.04))
         sunglassesPath.addCurveToPoint(CGPointMake(31.41, 25), controlPoint1: CGPointMake(30.97, 20.63), controlPoint2: CGPointMake(30.37, 22.97))
         sunglassesPath.addCurveToPoint(CGPointMake(36.68, 30.13), controlPoint1: CGPointMake(32.31, 26.84), controlPoint2: CGPointMake(34.64, 29.63))
         sunglassesPath.addCurveToPoint(CGPointMake(42.4, 25.75), controlPoint1: CGPointMake(38.77, 30.62), controlPoint2: CGPointMake(41.21, 27.74))
         sunglassesPath.addCurveToPoint(CGPointMake(51.8, 25.8), controlPoint1: CGPointMake(42.55, 25.65), controlPoint2: CGPointMake(46.03, 22.82))
         sunglassesPath.addCurveToPoint(CGPointMake(56.62, 30.08), controlPoint1: CGPointMake(52.89, 27.54), controlPoint2: CGPointMake(54.83, 29.68))
         sunglassesPath.addCurveToPoint(CGPointMake(62.79, 24.95), controlPoint1: CGPointMake(58.96, 30.62), controlPoint2: CGPointMake(61.84, 26.84))
         sunglassesPath.addCurveToPoint(CGPointMake(61.54, 19.78), controlPoint1: CGPointMake(63.83, 22.97), controlPoint2: CGPointMake(63.23, 20.63))
         sunglassesPath.closePath()
         sunglassesPath.miterLimit = 4;
         
         UIColor(priority: priority, headComponent: .Stripe).setFill()
         sunglassesPath.fill()
         
      case .Unknown:
         //// Color Declarations
         let fillColor12 = UIColor(red: 0.225, green: 0.211, blue: 0.504, alpha: 1.000)
         
         let oval3Path = UIBezierPath(ovalInRect: CGRectMake(39.49, 27.66, 7.56, 7.56))
         fillColor12.setFill()
         oval3Path.fill()
         
         let bezier6Path = UIBezierPath()
         bezier6Path.moveToPoint(CGPointMake(35.62, 19.31))
         bezier6Path.addLineToPoint(CGPointMake(31.29, 19.31))
         bezier6Path.addCurveToPoint(CGPointMake(30.35, 19.81), controlPoint1: CGPointMake(30.89, 19.31), controlPoint2: CGPointMake(30.54, 19.51))
         bezier6Path.addCurveToPoint(CGPointMake(30.15, 20.8), controlPoint1: CGPointMake(30.15, 20.1), controlPoint2: CGPointMake(30.05, 20.45))
         bezier6Path.addCurveToPoint(CGPointMake(33.43, 23.24), controlPoint1: CGPointMake(30.59, 22.24), controlPoint2: CGPointMake(31.94, 23.24))
         bezier6Path.addCurveToPoint(CGPointMake(36.71, 20.8), controlPoint1: CGPointMake(34.92, 23.24), controlPoint2: CGPointMake(36.26, 22.24))
         bezier6Path.addCurveToPoint(CGPointMake(36.51, 19.81), controlPoint1: CGPointMake(36.81, 20.45), controlPoint2: CGPointMake(36.76, 20.1))
         bezier6Path.addCurveToPoint(CGPointMake(35.62, 19.31), controlPoint1: CGPointMake(36.36, 19.51), controlPoint2: CGPointMake(36.01, 19.31))
         bezier6Path.closePath()
         bezier6Path.miterLimit = 4;
         
         fillColor12.setFill()
         bezier6Path.fill()
         
         let bezier7Path = UIBezierPath()
         bezier7Path.moveToPoint(CGPointMake(56.1, 19.81))
         bezier7Path.addCurveToPoint(CGPointMake(55.16, 19.31), controlPoint1: CGPointMake(55.85, 19.51), controlPoint2: CGPointMake(55.5, 19.31))
         bezier7Path.addLineToPoint(CGPointMake(50.88, 19.31))
         bezier7Path.addCurveToPoint(CGPointMake(49.94, 19.81), controlPoint1: CGPointMake(50.48, 19.31), controlPoint2: CGPointMake(50.13, 19.51))
         bezier7Path.addCurveToPoint(CGPointMake(49.74, 20.8), controlPoint1: CGPointMake(49.74, 20.1), controlPoint2: CGPointMake(49.64, 20.45))
         bezier7Path.addCurveToPoint(CGPointMake(53.02, 23.24), controlPoint1: CGPointMake(50.18, 22.24), controlPoint2: CGPointMake(51.53, 23.24))
         bezier7Path.addCurveToPoint(CGPointMake(56.3, 20.8), controlPoint1: CGPointMake(54.56, 23.24), controlPoint2: CGPointMake(55.85, 22.24))
         bezier7Path.addCurveToPoint(CGPointMake(56.1, 19.81), controlPoint1: CGPointMake(56.35, 20.45), controlPoint2: CGPointMake(56.3, 20.1))
         bezier7Path.closePath()
         bezier7Path.miterLimit = 4;
         
         fillColor12.setFill()
         bezier7Path.fill()
      default:
         break
      }
   }
   
   class func drawBody(bodyColor: UIColor, cheekColor: UIColor, stripeColor: UIColor, bowtieColor: UIColor)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Shadow Declarations
      let shadow = NSShadow()
      shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
      shadow.shadowOffset = CGSizeMake(-1.1, 4.1)
      shadow.shadowBlurRadius = 8
      
      //// Group 2
      //// BodyOutline Drawing
      let bodyOutlinePath = UIBezierPath()
      bodyOutlinePath.moveToPoint(CGPointMake(69.65, 18.54))
      bodyOutlinePath.addCurveToPoint(CGPointMake(76.56, 37.24), controlPoint1: CGPointMake(73.97, 23.66), controlPoint2: CGPointMake(76.56, 30.18))
      bodyOutlinePath.addCurveToPoint(CGPointMake(76.56, 37.43), controlPoint1: CGPointMake(76.56, 37.29), controlPoint2: CGPointMake(76.56, 37.38))
      bodyOutlinePath.addCurveToPoint(CGPointMake(74.82, 47.48), controlPoint1: CGPointMake(76.56, 40.82), controlPoint2: CGPointMake(76.01, 44.25))
      bodyOutlinePath.addCurveToPoint(CGPointMake(56.87, 87.1), controlPoint1: CGPointMake(69.75, 61.15), controlPoint2: CGPointMake(57.22, 71.74))
      bodyOutlinePath.addCurveToPoint(CGPointMake(53.39, 88.99), controlPoint1: CGPointMake(56.82, 88.85), controlPoint2: CGPointMake(54.88, 89.94))
      bodyOutlinePath.addCurveToPoint(CGPointMake(20.67, 55.09), controlPoint1: CGPointMake(40.11, 80.99), controlPoint2: CGPointMake(26.99, 69.55))
      bodyOutlinePath.addCurveToPoint(CGPointMake(32.26, 12.18), controlPoint1: CGPointMake(14.26, 40.37), controlPoint2: CGPointMake(17.94, 20.83))
      bodyOutlinePath.addCurveToPoint(CGPointMake(47.37, 8), controlPoint1: CGPointMake(36.78, 9.44), controlPoint2: CGPointMake(42.05, 8))
      bodyOutlinePath.addCurveToPoint(CGPointMake(69.65, 18.54), controlPoint1: CGPointMake(56.22, 8), controlPoint2: CGPointMake(64.23, 12.13))
      bodyOutlinePath.closePath()
      bodyOutlinePath.miterLimit = 4;
      
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, (shadow.shadowColor as! UIColor).CGColor)
      bodyColor.setFill()
      bodyOutlinePath.fill()
      CGContextRestoreGState(context)
      
      
      
      //// Left Cheek Drawing
      let leftCheekPath = UIBezierPath(ovalInRect: CGRectMake(27.88, 30.18, 5.47, 5.47))
      cheekColor.setFill()
      leftCheekPath.fill()
      
      
      //// Right Cheek Drawing
      let rightCheekPath = UIBezierPath(ovalInRect: CGRectMake(60.85, 30.18, 5.47, 5.47))
      cheekColor.setFill()
      rightCheekPath.fill()
      
      
      //// Bottom Stripe Drawing
      let bottomStripePath = UIBezierPath()
      bottomStripePath.moveToPoint(CGPointMake(56.87, 87.15))
      bottomStripePath.addCurveToPoint(CGPointMake(57.57, 81.44), controlPoint1: CGPointMake(56.92, 85.17), controlPoint2: CGPointMake(57.17, 83.28))
      bottomStripePath.addLineToPoint(CGPointMake(42.4, 81.44))
      bottomStripePath.addCurveToPoint(CGPointMake(53.34, 89.04), controlPoint1: CGPointMake(46.08, 84.37), controlPoint2: CGPointMake(49.81, 86.96))
      bottomStripePath.addCurveToPoint(CGPointMake(56.87, 87.15), controlPoint1: CGPointMake(54.88, 89.94), controlPoint2: CGPointMake(56.87, 88.89))
      bottomStripePath.closePath()
      bottomStripePath.miterLimit = 4;
      
      stripeColor.setFill()
      bottomStripePath.fill()
      
      
      //// Middle Stripe Drawing
      let middleStripePath = UIBezierPath()
      middleStripePath.moveToPoint(CGPointMake(60.4, 73.33))
      middleStripePath.addCurveToPoint(CGPointMake(65.02, 65.08), controlPoint1: CGPointMake(61.74, 70.5), controlPoint2: CGPointMake(63.33, 67.76))
      middleStripePath.addLineToPoint(CGPointMake(26.44, 65.08))
      middleStripePath.addCurveToPoint(CGPointMake(33.45, 73.33), controlPoint1: CGPointMake(28.53, 67.96), controlPoint2: CGPointMake(30.92, 70.75))
      middleStripePath.addLineToPoint(CGPointMake(60.4, 73.33))
      middleStripePath.closePath()
      middleStripePath.miterLimit = 4;
      
      stripeColor.setFill()
      middleStripePath.fill()
      
      
      //// Top Stripe Drawing
      let topStripePath = UIBezierPath()
      topStripePath.moveToPoint(CGPointMake(70.14, 56.97))
      topStripePath.addCurveToPoint(CGPointMake(74.37, 48.72), controlPoint1: CGPointMake(71.74, 54.29), controlPoint2: CGPointMake(73.23, 51.55))
      topStripePath.addLineToPoint(CGPointMake(18.49, 48.72))
      topStripePath.addCurveToPoint(CGPointMake(21.52, 56.97), controlPoint1: CGPointMake(19.18, 51.55), controlPoint2: CGPointMake(20.18, 54.29))
      topStripePath.addLineToPoint(CGPointMake(70.14, 56.97))
      topStripePath.closePath()
      topStripePath.miterLimit = 4;
      
      stripeColor.setFill()
      topStripePath.fill()
      
      
      
      
      //// Group
      //// Bezier 8 Drawing
      let bezier8Path = UIBezierPath()
      bezier8Path.moveToPoint(CGPointMake(46.05, 6.03))
      bezier8Path.addCurveToPoint(CGPointMake(46.05, 7.69), controlPoint1: CGPointMake(46.69, 6.42), controlPoint2: CGPointMake(46.69, 7.3))
      bezier8Path.addLineToPoint(CGPointMake(41.88, 10.13))
      bezier8Path.addLineToPoint(CGPointMake(37.72, 12.58))
      bezier8Path.addCurveToPoint(CGPointMake(36.29, 11.74), controlPoint1: CGPointMake(37.08, 12.97), controlPoint2: CGPointMake(36.29, 12.48))
      bezier8Path.addLineToPoint(CGPointMake(36.29, 1.97))
      bezier8Path.addCurveToPoint(CGPointMake(37.72, 1.14), controlPoint1: CGPointMake(36.29, 1.24), controlPoint2: CGPointMake(37.08, 0.75))
      bezier8Path.addLineToPoint(CGPointMake(41.88, 3.58))
      bezier8Path.addLineToPoint(CGPointMake(46.05, 6.03))
      bezier8Path.closePath()
      bowtieColor.setFill()
      bezier8Path.fill()
      
      
      //// Bezier 9 Drawing
      let bezier9Path = UIBezierPath()
      bezier9Path.moveToPoint(CGPointMake(49.09, 6.03))
      bezier9Path.addCurveToPoint(CGPointMake(49.09, 7.69), controlPoint1: CGPointMake(48.46, 6.42), controlPoint2: CGPointMake(48.46, 7.3))
      bezier9Path.addLineToPoint(CGPointMake(53.26, 10.13))
      bezier9Path.addLineToPoint(CGPointMake(57.43, 12.58))
      bezier9Path.addCurveToPoint(CGPointMake(58.85, 11.74), controlPoint1: CGPointMake(58.07, 12.97), controlPoint2: CGPointMake(58.85, 12.48))
      bezier9Path.addLineToPoint(CGPointMake(58.85, 1.97))
      bezier9Path.addCurveToPoint(CGPointMake(57.43, 1.14), controlPoint1: CGPointMake(58.85, 1.24), controlPoint2: CGPointMake(58.07, 0.75))
      bezier9Path.addLineToPoint(CGPointMake(53.26, 3.58))
      bezier9Path.addLineToPoint(CGPointMake(49.09, 6.03))
      bezier9Path.closePath()
      bowtieColor.setFill()
      bezier9Path.fill()
      
      
      //// Rectangle Drawing
      let rectanglePath = UIBezierPath(roundedRect: CGRectMake(43.6, 3.89, 7.1, 6.1), cornerRadius: 3.05)
      bowtieColor.setFill()
      rectanglePath.fill()
   }
}
