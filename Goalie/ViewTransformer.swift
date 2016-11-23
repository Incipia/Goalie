//
//  ViewTransformer.swift
//  DYR
//
//  Created by Klein, Greg on 8/14/15.
//  Copyright (c) 2015 Sparkhouse. All rights reserved.
//

import UIKit

extension CATransform3D
{
   static var perspectiveTransform: CATransform3D {
      var transform = CATransform3DIdentity
      transform.m34 = 1 / -900.0
      return transform
   }
}

protocol ViewTransformerProtocol
{
   func touchesBegan(_ touches: Set<NSObject>)
   func touchesMoved(_ touches: Set<NSObject>)
   func resetViewWithDuration(_ duraiton: TimeInterval)
}

class ViewTransformer: ViewTransformerProtocol
{
   var view: UIView
   fileprivate var initialViewCenter = CGPoint.zero
   fileprivate var firstTouchLocation = CGPoint.zero
   
   var maxY: CGFloat?
   
   var takeItEasy = false
   
   init(view: UIView)
   {
      self.view = view
   }
   
   func touchesBegan(_ touches: Set<NSObject>)
   {
      if let touch = touches.first as? UITouch, self.firstTouchLocation == CGPoint.zero
      {
         self.initialViewCenter = self.view.center
         self.firstTouchLocation = touch.location(in: nil)
      }
   }
   
   func touchesMoved(_ touches: Set<NSObject>)
   {
      if let touch = touches.first as? UITouch
      {
         var currentTouchLocation = touch.location(in: nil)
         let dx = self.firstTouchLocation.x - currentTouchLocation.x
         
         let currentTouchY = currentTouchLocation.y
         if let maxY = maxY {
            currentTouchLocation.y = min(maxY, currentTouchY)
         }
         
         let dy = self.firstTouchLocation.y - currentTouchLocation.y
         
         let deltaVector = CGVector(dx: dx, dy: dy)
         
         var updatedTransform = CATransform3D.perspectiveTransform
         rotateTransform(&updatedTransform, withDeltaVector: deltaVector)
         scaleTransform(&updatedTransform, withDeltaVector: deltaVector)
         
         self.view.layer.transform = updatedTransform
         
         let newCenterX = self.initialViewCenter.x - deltaVector.dx / 5
         let newCenterY = self.initialViewCenter.y - deltaVector.dy / 5
         self.view.center = CGPoint(x: newCenterX, y: newCenterY)
      }
   }
   
   func resetViewWithDuration(_ duration: TimeInterval)
   {
      UIView.animate(withDuration: duration / 1.5, animations: { () -> Void in
         self.view.center = self.initialViewCenter
      })
      
      UIView.animate(withDuration: duration / 1.5, delay: duration / 3, options: [], animations: { () -> Void in
         self.view.layer.transform = CATransform3DIdentity
         }, completion: nil)
      
      self.firstTouchLocation = CGPoint.zero
   }
   
   // MARK: - Private
   fileprivate func rotateTransform(_ transform: inout CATransform3D, withDeltaVector deltaVector: CGVector)
   {
      let scale: CGFloat = takeItEasy ? 750 : 500
      transform = CATransform3DRotate(transform, -deltaVector.dx / scale, 0, 1, 0)
      transform = CATransform3DRotate(transform, deltaVector.dy / scale, 1, 0, 0)
   }
   
   fileprivate func scaleTransform(_ transform: inout CATransform3D, withDeltaVector deltaVector: CGVector)
   {
      let xScale = scaleForDeltaValue(deltaVector.dy)
      let yScale = scaleForDeltaValue(deltaVector.dx)
      let zScale = (xScale * yScale) / 2
      
      transform = CATransform3DScale(transform, xScale, yScale, zScale)
   }
   
   fileprivate func scaleForDeltaValue(_ value: CGFloat) -> CGFloat
   {
      return max(log(abs(value * 0.012) + 1) * 0.8, 1.0)
   }
}
