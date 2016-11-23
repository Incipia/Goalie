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
   class func drawAccessoriesForPriority(_ priority: TaskPriority)
   {
      switch priority
      {
      case .ages:
         //// Sunglasses Drawing
         let sunglassesPath = UIBezierPath()
         sunglassesPath.move(to: CGPoint(x: 61.54, y: 19.78))
         sunglassesPath.addCurve(to: CGPoint(x: 57.07, y: 21.28), controlPoint1: CGPoint(x: 60.05, y: 19.04), controlPoint2: CGPoint(x: 58.21, y: 19.73))
         sunglassesPath.addCurve(to: CGPoint(x: 52.59, y: 19.78), controlPoint1: CGPoint(x: 55.97, y: 19.73), controlPoint2: CGPoint(x: 54.09, y: 19.04))
         sunglassesPath.addCurve(to: CGPoint(x: 50.85, y: 22.72), controlPoint1: CGPoint(x: 51.5, y: 20.33), controlPoint2: CGPoint(x: 50.9, y: 21.42))
         sunglassesPath.addCurve(to: CGPoint(x: 43.35, y: 22.57), controlPoint1: CGPoint(x: 47.62, y: 21.57), controlPoint2: CGPoint(x: 45.09, y: 21.92))
         sunglassesPath.addCurve(to: CGPoint(x: 41.61, y: 19.78), controlPoint1: CGPoint(x: 43.25, y: 21.37), controlPoint2: CGPoint(x: 42.65, y: 20.28))
         sunglassesPath.addCurve(to: CGPoint(x: 37.13, y: 21.28), controlPoint1: CGPoint(x: 40.11, y: 19.04), controlPoint2: CGPoint(x: 38.27, y: 19.73))
         sunglassesPath.addCurve(to: CGPoint(x: 32.66, y: 19.78), controlPoint1: CGPoint(x: 36.04, y: 19.73), controlPoint2: CGPoint(x: 34.15, y: 19.04))
         sunglassesPath.addCurve(to: CGPoint(x: 31.41, y: 25), controlPoint1: CGPoint(x: 30.97, y: 20.63), controlPoint2: CGPoint(x: 30.37, y: 22.97))
         sunglassesPath.addCurve(to: CGPoint(x: 36.68, y: 30.13), controlPoint1: CGPoint(x: 32.31, y: 26.84), controlPoint2: CGPoint(x: 34.64, y: 29.63))
         sunglassesPath.addCurve(to: CGPoint(x: 42.4, y: 25.75), controlPoint1: CGPoint(x: 38.77, y: 30.62), controlPoint2: CGPoint(x: 41.21, y: 27.74))
         sunglassesPath.addCurve(to: CGPoint(x: 51.8, y: 25.8), controlPoint1: CGPoint(x: 42.55, y: 25.65), controlPoint2: CGPoint(x: 46.03, y: 22.82))
         sunglassesPath.addCurve(to: CGPoint(x: 56.62, y: 30.08), controlPoint1: CGPoint(x: 52.89, y: 27.54), controlPoint2: CGPoint(x: 54.83, y: 29.68))
         sunglassesPath.addCurve(to: CGPoint(x: 62.79, y: 24.95), controlPoint1: CGPoint(x: 58.96, y: 30.62), controlPoint2: CGPoint(x: 61.84, y: 26.84))
         sunglassesPath.addCurve(to: CGPoint(x: 61.54, y: 19.78), controlPoint1: CGPoint(x: 63.83, y: 22.97), controlPoint2: CGPoint(x: 63.23, y: 20.63))
         sunglassesPath.close()
         sunglassesPath.miterLimit = 4;
         
         UIColor(priority: priority, headComponent: .stripe).setFill()
         sunglassesPath.fill()
         
      case .unknown: _drawSleepingFace()
      default:
         break
      }
   }
   
   class func _drawSleepingFace()
   {
      let fillColor12 = UIColor.eyeColorForPriority(.unknown)
      //// Group 9
      //// Oval 3 Drawing
      let oval3Path = UIBezierPath(ovalIn: CGRect(x: 43.49, y: 32.66, width: 7.56, height: 7.56))
      fillColor12.setFill()
      oval3Path.fill()
      
      
      
      
      //// Group 10
      //// Bezier 6 Drawing
      let bezier6Path = UIBezierPath()
      bezier6Path.move(to: CGPoint(x: 39.62, y: 24.31))
      bezier6Path.addLine(to: CGPoint(x: 35.29, y: 24.31))
      bezier6Path.addCurve(to: CGPoint(x: 34.35, y: 24.81), controlPoint1: CGPoint(x: 34.89, y: 24.31), controlPoint2: CGPoint(x: 34.54, y: 24.51))
      bezier6Path.addCurve(to: CGPoint(x: 34.15, y: 25.8), controlPoint1: CGPoint(x: 34.15, y: 25.1), controlPoint2: CGPoint(x: 34.05, y: 25.45))
      bezier6Path.addCurve(to: CGPoint(x: 37.43, y: 28.24), controlPoint1: CGPoint(x: 34.59, y: 27.24), controlPoint2: CGPoint(x: 35.94, y: 28.24))
      bezier6Path.addCurve(to: CGPoint(x: 40.71, y: 25.8), controlPoint1: CGPoint(x: 38.92, y: 28.24), controlPoint2: CGPoint(x: 40.26, y: 27.24))
      bezier6Path.addCurve(to: CGPoint(x: 40.51, y: 24.81), controlPoint1: CGPoint(x: 40.81, y: 25.45), controlPoint2: CGPoint(x: 40.76, y: 25.1))
      bezier6Path.addCurve(to: CGPoint(x: 39.62, y: 24.31), controlPoint1: CGPoint(x: 40.36, y: 24.51), controlPoint2: CGPoint(x: 40.01, y: 24.31))
      bezier6Path.close()
      bezier6Path.miterLimit = 4;
      
      fillColor12.setFill()
      bezier6Path.fill()
      
      
      
      
      //// Group 11
      //// Bezier 7 Drawing
      let bezier7Path = UIBezierPath()
      bezier7Path.move(to: CGPoint(x: 60.1, y: 24.81))
      bezier7Path.addCurve(to: CGPoint(x: 59.16, y: 24.31), controlPoint1: CGPoint(x: 59.85, y: 24.51), controlPoint2: CGPoint(x: 59.5, y: 24.31))
      bezier7Path.addLine(to: CGPoint(x: 54.88, y: 24.31))
      bezier7Path.addCurve(to: CGPoint(x: 53.94, y: 24.81), controlPoint1: CGPoint(x: 54.48, y: 24.31), controlPoint2: CGPoint(x: 54.13, y: 24.51))
      bezier7Path.addCurve(to: CGPoint(x: 53.74, y: 25.8), controlPoint1: CGPoint(x: 53.74, y: 25.1), controlPoint2: CGPoint(x: 53.64, y: 25.45))
      bezier7Path.addCurve(to: CGPoint(x: 57.02, y: 28.24), controlPoint1: CGPoint(x: 54.18, y: 27.24), controlPoint2: CGPoint(x: 55.53, y: 28.24))
      bezier7Path.addCurve(to: CGPoint(x: 60.3, y: 25.8), controlPoint1: CGPoint(x: 58.56, y: 28.24), controlPoint2: CGPoint(x: 59.85, y: 27.24))
      bezier7Path.addCurve(to: CGPoint(x: 60.1, y: 24.81), controlPoint1: CGPoint(x: 60.35, y: 25.45), controlPoint2: CGPoint(x: 60.3, y: 25.1))
      bezier7Path.close()
      bezier7Path.miterLimit = 4;
      
      fillColor12.setFill()
      bezier7Path.fill()
   }
   
   class func drawBody(_ bodyColor: UIColor, cheekColor: UIColor, stripeColor: UIColor, bowtieColor: UIColor)
   {
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Shadow Declarations
      let shadow = NSShadow()
      shadow.shadowColor = UIColor.black.withAlphaComponent(0.2)
      shadow.shadowOffset = CGSize(width: -1.1, height: 4.1)
      shadow.shadowBlurRadius = 8
      
      //// Group 2
      //// BodyOutline Drawing
      let bodyOutlinePath = UIBezierPath()
      bodyOutlinePath.move(to: CGPoint(x: 69.65, y: 18.54))
      bodyOutlinePath.addCurve(to: CGPoint(x: 76.56, y: 37.24), controlPoint1: CGPoint(x: 73.97, y: 23.66), controlPoint2: CGPoint(x: 76.56, y: 30.18))
      bodyOutlinePath.addCurve(to: CGPoint(x: 76.56, y: 37.43), controlPoint1: CGPoint(x: 76.56, y: 37.29), controlPoint2: CGPoint(x: 76.56, y: 37.38))
      bodyOutlinePath.addCurve(to: CGPoint(x: 74.82, y: 47.48), controlPoint1: CGPoint(x: 76.56, y: 40.82), controlPoint2: CGPoint(x: 76.01, y: 44.25))
      bodyOutlinePath.addCurve(to: CGPoint(x: 56.87, y: 87.1), controlPoint1: CGPoint(x: 69.75, y: 61.15), controlPoint2: CGPoint(x: 57.22, y: 71.74))
      bodyOutlinePath.addCurve(to: CGPoint(x: 53.39, y: 88.99), controlPoint1: CGPoint(x: 56.82, y: 88.85), controlPoint2: CGPoint(x: 54.88, y: 89.94))
      bodyOutlinePath.addCurve(to: CGPoint(x: 20.67, y: 55.09), controlPoint1: CGPoint(x: 40.11, y: 80.99), controlPoint2: CGPoint(x: 26.99, y: 69.55))
      bodyOutlinePath.addCurve(to: CGPoint(x: 32.26, y: 12.18), controlPoint1: CGPoint(x: 14.26, y: 40.37), controlPoint2: CGPoint(x: 17.94, y: 20.83))
      bodyOutlinePath.addCurve(to: CGPoint(x: 47.37, y: 8), controlPoint1: CGPoint(x: 36.78, y: 9.44), controlPoint2: CGPoint(x: 42.05, y: 8))
      bodyOutlinePath.addCurve(to: CGPoint(x: 69.65, y: 18.54), controlPoint1: CGPoint(x: 56.22, y: 8), controlPoint2: CGPoint(x: 64.23, y: 12.13))
      bodyOutlinePath.close()
      bodyOutlinePath.miterLimit = 4;
      
      context!.saveGState()
      context!.setShadow(offset: shadow.shadowOffset, blur: shadow.shadowBlurRadius, color: (shadow.shadowColor as! UIColor).cgColor)
      bodyColor.setFill()
      bodyOutlinePath.fill()
      context!.restoreGState()
      
      
      
      //// Left Cheek Drawing
      let leftCheekPath = UIBezierPath(ovalIn: CGRect(x: 27.88, y: 30.18, width: 5.47, height: 5.47))
      cheekColor.setFill()
      leftCheekPath.fill()
      
      
      //// Right Cheek Drawing
      let rightCheekPath = UIBezierPath(ovalIn: CGRect(x: 60.85, y: 30.18, width: 5.47, height: 5.47))
      cheekColor.setFill()
      rightCheekPath.fill()
      
      
      //// Bottom Stripe Drawing
      let bottomStripePath = UIBezierPath()
      bottomStripePath.move(to: CGPoint(x: 56.87, y: 87.15))
      bottomStripePath.addCurve(to: CGPoint(x: 57.57, y: 81.44), controlPoint1: CGPoint(x: 56.92, y: 85.17), controlPoint2: CGPoint(x: 57.17, y: 83.28))
      bottomStripePath.addLine(to: CGPoint(x: 42.4, y: 81.44))
      bottomStripePath.addCurve(to: CGPoint(x: 53.34, y: 89.04), controlPoint1: CGPoint(x: 46.08, y: 84.37), controlPoint2: CGPoint(x: 49.81, y: 86.96))
      bottomStripePath.addCurve(to: CGPoint(x: 56.87, y: 87.15), controlPoint1: CGPoint(x: 54.88, y: 89.94), controlPoint2: CGPoint(x: 56.87, y: 88.89))
      bottomStripePath.close()
      bottomStripePath.miterLimit = 4;
      
      stripeColor.setFill()
      bottomStripePath.fill()
      
      
      //// Middle Stripe Drawing
      let middleStripePath = UIBezierPath()
      middleStripePath.move(to: CGPoint(x: 60.4, y: 73.33))
      middleStripePath.addCurve(to: CGPoint(x: 65.02, y: 65.08), controlPoint1: CGPoint(x: 61.74, y: 70.5), controlPoint2: CGPoint(x: 63.33, y: 67.76))
      middleStripePath.addLine(to: CGPoint(x: 26.44, y: 65.08))
      middleStripePath.addCurve(to: CGPoint(x: 33.45, y: 73.33), controlPoint1: CGPoint(x: 28.53, y: 67.96), controlPoint2: CGPoint(x: 30.92, y: 70.75))
      middleStripePath.addLine(to: CGPoint(x: 60.4, y: 73.33))
      middleStripePath.close()
      middleStripePath.miterLimit = 4;
      
      stripeColor.setFill()
      middleStripePath.fill()
      
      
      //// Top Stripe Drawing
      let topStripePath = UIBezierPath()
      topStripePath.move(to: CGPoint(x: 70.14, y: 56.97))
      topStripePath.addCurve(to: CGPoint(x: 74.37, y: 48.72), controlPoint1: CGPoint(x: 71.74, y: 54.29), controlPoint2: CGPoint(x: 73.23, y: 51.55))
      topStripePath.addLine(to: CGPoint(x: 18.49, y: 48.72))
      topStripePath.addCurve(to: CGPoint(x: 21.52, y: 56.97), controlPoint1: CGPoint(x: 19.18, y: 51.55), controlPoint2: CGPoint(x: 20.18, y: 54.29))
      topStripePath.addLine(to: CGPoint(x: 70.14, y: 56.97))
      topStripePath.close()
      topStripePath.miterLimit = 4;
      
      stripeColor.setFill()
      topStripePath.fill()
      
      
      
      
      //// Group
      //// Bezier 8 Drawing
      let bezier8Path = UIBezierPath()
      bezier8Path.move(to: CGPoint(x: 46.05, y: 6.03))
      bezier8Path.addCurve(to: CGPoint(x: 46.05, y: 7.69), controlPoint1: CGPoint(x: 46.69, y: 6.42), controlPoint2: CGPoint(x: 46.69, y: 7.3))
      bezier8Path.addLine(to: CGPoint(x: 41.88, y: 10.13))
      bezier8Path.addLine(to: CGPoint(x: 37.72, y: 12.58))
      bezier8Path.addCurve(to: CGPoint(x: 36.29, y: 11.74), controlPoint1: CGPoint(x: 37.08, y: 12.97), controlPoint2: CGPoint(x: 36.29, y: 12.48))
      bezier8Path.addLine(to: CGPoint(x: 36.29, y: 1.97))
      bezier8Path.addCurve(to: CGPoint(x: 37.72, y: 1.14), controlPoint1: CGPoint(x: 36.29, y: 1.24), controlPoint2: CGPoint(x: 37.08, y: 0.75))
      bezier8Path.addLine(to: CGPoint(x: 41.88, y: 3.58))
      bezier8Path.addLine(to: CGPoint(x: 46.05, y: 6.03))
      bezier8Path.close()
      bowtieColor.setFill()
      bezier8Path.fill()
      
      
      //// Bezier 9 Drawing
      let bezier9Path = UIBezierPath()
      bezier9Path.move(to: CGPoint(x: 49.09, y: 6.03))
      bezier9Path.addCurve(to: CGPoint(x: 49.09, y: 7.69), controlPoint1: CGPoint(x: 48.46, y: 6.42), controlPoint2: CGPoint(x: 48.46, y: 7.3))
      bezier9Path.addLine(to: CGPoint(x: 53.26, y: 10.13))
      bezier9Path.addLine(to: CGPoint(x: 57.43, y: 12.58))
      bezier9Path.addCurve(to: CGPoint(x: 58.85, y: 11.74), controlPoint1: CGPoint(x: 58.07, y: 12.97), controlPoint2: CGPoint(x: 58.85, y: 12.48))
      bezier9Path.addLine(to: CGPoint(x: 58.85, y: 1.97))
      bezier9Path.addCurve(to: CGPoint(x: 57.43, y: 1.14), controlPoint1: CGPoint(x: 58.85, y: 1.24), controlPoint2: CGPoint(x: 58.07, y: 0.75))
      bezier9Path.addLine(to: CGPoint(x: 53.26, y: 3.58))
      bezier9Path.addLine(to: CGPoint(x: 49.09, y: 6.03))
      bezier9Path.close()
      bowtieColor.setFill()
      bezier9Path.fill()
      
      
      //// Rectangle Drawing
      let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 43.6, y: 3.89, width: 7.1, height: 6.1), cornerRadius: 3.05)
      bowtieColor.setFill()
      rectanglePath.fill()
   }
}
