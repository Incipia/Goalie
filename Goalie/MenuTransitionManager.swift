//
//  MenuTransitionManager.swift
//  Goalie
//
//  Created by Gregory Klein on 1/10/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

extension UIViewControllerContextTransitioning
{
   var toViewController: UIViewController? {
      return viewControllerForKey(UITransitionContextToViewControllerKey)
   }
   
   var fromViewController: UIViewController? {
      return viewControllerForKey(UITransitionContextFromViewControllerKey)
   }
}

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate
{
   var presenting = true
   
   // MARK: - UIViewControllerAnimatedTransitioning protocol methods
   func animateTransition(transitionContext: UIViewControllerContextTransitioning)
   {
      if presenting {
         _presentWithTransitionContext(transitionContext)
      }
      else {
         _dismissWithTransitionContext(transitionContext)
      }
   }
   
   func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
      return 0.25
   }
   
   // MARK: - UIViewControllerTransitioningDelegate protocol methods
   func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      return self
   }
   
   func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      return self
   }
   
   // MARK: - Private
   private func _presentWithTransitionContext(transitionContext: UIViewControllerContextTransitioning)
   {
      // get reference to our fromView, toView and the container view that we should perform the transition in
      let container = transitionContext.containerView()!
      
      guard let toController = transitionContext.toViewController as? MenuController else {
         transitionContext.completeTransition(true)
         return
      }
      
      let scaledTransform = CGAffineTransformMakeScale(0.4, 0.4)
      toController.dialogContainer.transform = scaledTransform
      
      toController.view.alpha = 1
      toController.view.backgroundColor = UIColor.clearColor()
      
      container.addSubview(toController.view)
      
      let duration = transitionDuration(transitionContext)
      UIView.animateWithDuration(duration,
         delay: 0,
         options: UIViewAnimationOptions.CurveEaseIn,
         animations: { () -> Void in
         
         toController.dialogContainer.transform = CGAffineTransformIdentity
         toController.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
         
         }, completion: { finished in
            transitionContext.completeTransition(true)
      })
   }
   
   private func _dismissWithTransitionContext(transitionContext: UIViewControllerContextTransitioning)
   {
      // get reference to our fromView, toView and the container view that we should perform the transition in
      let container = transitionContext.containerView()!
      guard let fromController = transitionContext.fromViewController as? MenuController else {
         transitionContext.completeTransition(true)
         return
      }
   
      container.addSubview(fromController.view)
      
      let duration = transitionDuration(transitionContext)
      UIView.animateWithDuration(duration,
         delay: 0,
         options: UIViewAnimationOptions.CurveEaseOut,
         animations: { () -> Void in
         
         fromController.view.alpha = 0
         fromController.dialogContainer.transform = CGAffineTransformMakeScale(0.4, 0.4)
         
         }, completion: { finished in
            transitionContext.completeTransition(true)
      })
   }
}
