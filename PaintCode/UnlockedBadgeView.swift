//
//  UnlockedBadgeView.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class UnlockedBadgeView: UIView
{
   override func awakeFromNib()
   {
      super.awakeFromNib()
      backgroundColor = UIColor.clearColor()
   }
   
   override func drawRect(rect: CGRect)
   {
      _drawBadgeWithFrame(rect)
   }
   
   private func _drawBadgeWithFrame(frame: CGRect)
   {
      //// Color Declarations
      let color2 = UIColor(priority: .Later, headComponent: .Background)
      let color3 = UIColor(red: 1.000, green: 0.832, blue: 0.155, alpha: 1.000)
      
      //// Polygon Drawing
      let polygonPath = UIBezierPath()
      polygonPath.moveToPoint(CGPointMake(frame.minX + 0.50000 * frame.width, frame.minY + 0.86667 * frame.height))
      polygonPath.addLineToPoint(CGPointMake(frame.minX + 0.00000 * frame.width, frame.minY + 0.99308 * frame.height))
      polygonPath.addLineToPoint(CGPointMake(frame.minX + 0.00165 * frame.width, frame.minY + 0.00000 * frame.height))
      polygonPath.addLineToPoint(CGPointMake(frame.minX + 0.99835 * frame.width, frame.minY + 0.00000 * frame.height))
      polygonPath.addLineToPoint(CGPointMake(frame.minX + 1.00000 * frame.width, frame.minY + 1.00000 * frame.height))
      polygonPath.addLineToPoint(CGPointMake(frame.minX + 0.50000 * frame.width, frame.minY + 0.86667 * frame.height))
      polygonPath.closePath()
      polygonPath.lineJoinStyle = .Round;
      
      color2.setFill()
      polygonPath.fill()
      
      
      //// Star Drawing
      let starPath = UIBezierPath()
      starPath.moveToPoint(CGPointMake(frame.minX + 14, frame.maxY - 20.25))
      starPath.addLineToPoint(CGPointMake(frame.minX + 15.43, frame.maxY - 17.96))
      starPath.addLineToPoint(CGPointMake(frame.minX + 18.04, frame.maxY - 17.31))
      starPath.addLineToPoint(CGPointMake(frame.minX + 16.31, frame.maxY - 15.25))
      starPath.addLineToPoint(CGPointMake(frame.minX + 16.5, frame.maxY - 12.56))
      starPath.addLineToPoint(CGPointMake(frame.minX + 14, frame.maxY - 13.57))
      starPath.addLineToPoint(CGPointMake(frame.minX + 11.5, frame.maxY - 12.56))
      starPath.addLineToPoint(CGPointMake(frame.minX + 11.69, frame.maxY - 15.25))
      starPath.addLineToPoint(CGPointMake(frame.minX + 9.96, frame.maxY - 17.31))
      starPath.addLineToPoint(CGPointMake(frame.minX + 12.57, frame.maxY - 17.96))
      starPath.closePath()
      color3.setFill()
      starPath.fill()
   }
}
