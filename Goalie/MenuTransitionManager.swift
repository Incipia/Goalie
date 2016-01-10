//
//  MenuTransitionManager.swift
//  Goalie
//
//  Created by Gregory Klein on 1/10/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

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
      return 0.3
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
      
      let toController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! MenuController
      
      let scaledDown = CGAffineTransformMakeScale(0, 0)
      toController.dialogContainer.transform = scaledDown
      toController.view.backgroundColor = UIColor.clearColor()
      
      container.addSubview(toController.view)
      
      let duration = transitionDuration(transitionContext)
      UIView.animateWithDuration(duration, animations: {
         
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
      
      let fromController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! MenuController
      
      container.addSubview(fromController.view)
      
      let duration = transitionDuration(transitionContext)
      UIView.animateWithDuration(duration, animations: {
         
         fromController.dialogContainer.transform = CGAffineTransformMakeScale(0.01, 0.01)
         fromController.view.backgroundColor = UIColor.clearColor()
         
         }, completion: { finished in
            transitionContext.completeTransition(true)
      })
   }
}
