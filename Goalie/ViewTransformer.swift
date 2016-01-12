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

protocol ViewTransformerDelegate
{
   var centerY: CGFloat {get}
}

protocol ViewTransformerProtocol
{
   func touchesBegan(touches: Set<NSObject>)
   func touchesMoved(touches: Set<NSObject>)
   func resetViewWithDuration(duraiton: NSTimeInterval, completion: ((finished: Bool) -> ())?)
}

class ViewTransformer: ViewTransformerProtocol
{
   var view: UIView
   var delegate: ViewTransformerDelegate?
   
   private var _initialDistanceFromCenterY: CGFloat = 0
   private var initialViewCenter = CGPoint.zero
   private var firstTouchLocation = CGPoint.zero
   
   private var _lastTransformationPoints: [CGPoint] = []
   
   var maxY: CGFloat?
   
   var takeItEasy = false
   
   init(view: UIView)
   {
      self.view = view
   }
   
   func touchesBegan(touches: Set<NSObject>)
   {
      if let touch = touches.first as? UITouch where self.firstTouchLocation == CGPoint.zero
      {
         _beginTransformationWithPoint(touch.locationInView(nil))
      }
   }
   
   func touchesMoved(touches: Set<NSObject>)
   {
      if let touch = touches.first as? UITouch
      {
         let currentTouchLocation = touch.locationInView(nil)
         _adjustTransformationWithPoint(currentTouchLocation)
      }
   }
   
   func startWithPoint(point: CGPoint)
   {
      _beginTransformationWithPoint(point)
   }
   
   func advanceWithPoint(point: CGPoint)
   {
      _adjustTransformationWithPoint(point)
   }
   
   private func _beginTransformationWithPoint(point: CGPoint)
   {
      self.initialViewCenter = self.view.center
      self.firstTouchLocation = point
      _initialDistanceFromCenterY = delegate!.centerY - initialViewCenter.y
      
//      _lastTransformationPoints = []
//      _lastTransformationPoints.append(point)
   }
   
   private func _adjustTransformationWithPoint(point: CGPoint)
   {
      var point = point
      let dx = self.firstTouchLocation.x - point.x
      
      let currentTouchY = point.y
      if let maxY = maxY {
         point.y = min(maxY, currentTouchY)
      }
      
//      _lastTransformationPoints.append(point)
      let dy = self.firstTouchLocation.y - point.y
      
      let deltaVector = CGVector(dx: dx, dy: dy)
      
      var updatedTransform = CATransform3D.perspectiveTransform
      self.rotateTransform(&updatedTransform, withDeltaVector: deltaVector)
      self.scaleTransform(&updatedTransform, withDeltaVector: deltaVector)
      
      self.view.layer.transform = updatedTransform
      
      let newCenterX = self.initialViewCenter.x - deltaVector.dx / 5
      
      var newCenterY = self.view.superview!.center.y - _initialDistanceFromCenterY
      newCenterY = newCenterY - deltaVector.dy / 5
      self.view.center = CGPoint(x: newCenterX, y: newCenterY)
   }
   
   func resetViewWithDuration(duration: NSTimeInterval, completion: ((finished: Bool) -> ())?)
   {
      UIView.animateWithDuration(duration / 1.5, animations: { () -> Void in
         self.view.center = self.initialViewCenter
      })
      
      UIView.animateWithDuration(duration / 1.5, delay: duration / 3, options: [], animations: { () -> Void in
         self.view.layer.transform = CATransform3DIdentity
         }, completion: completion)
      
      self.firstTouchLocation = CGPoint.zero
      
//      var pointString = "["
//      for point in _lastTransformationPoints
//      {
//         pointString += "CGPoint(x: \(point.x), y: \(point.y)),"
//      }
//      pointString += "]"
//      print("")
//      print("")
//      print(pointString)
//      print("")
//      print("")
   }
   
   // MARK: - Private
   private func rotateTransform(inout transform: CATransform3D, withDeltaVector deltaVector: CGVector)
   {
      let scale: CGFloat = takeItEasy ? 750 : 500
      transform = CATransform3DRotate(transform, -deltaVector.dx / scale, 0, 1, 0)
      transform = CATransform3DRotate(transform, deltaVector.dy / scale, 1, 0, 0)
   }
   
   private func scaleTransform(inout transform: CATransform3D, withDeltaVector deltaVector: CGVector)
   {
      let xScale = self.scaleFromDeltaValue(deltaVector.dy)
      let yScale = self.scaleFromDeltaValue(deltaVector.dx)
      let zScale = (xScale * yScale) / 2
      
      transform = CATransform3DScale(transform, xScale, yScale, zScale)
   }
   
   private func scaleFromDeltaValue(value: CGFloat) -> CGFloat
   {
      return max(log(abs(value * 0.012) + 1) * 0.8, 1.0)
   }
}