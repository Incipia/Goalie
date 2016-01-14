//
//  OnboardingTransitionManager.swift
//  Goalie
//
//  Created by Gregory Klein on 1/13/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class OnboardingTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate
{
   // MARK: - UIViewControllerAnimatedTransitioning protocol methods
   func animateTransition(transitionContext: UIViewControllerContextTransitioning)
   {
      let container = transitionContext.containerView()!
      
      let fromController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! OnboardingViewController
      let toController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! MainTasksViewController
      
      container.addSubview(toController.view)
      
      let whiteView = UIView()
      whiteView.frame = toController.view.bounds
      whiteView.backgroundColor = UIColor.whiteColor()
      
      container.addSubview(whiteView)
      container.addSubview(fromController.view)
      
      let duration = transitionDuration(transitionContext)
      UIView.animateWithDuration(duration * 0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
         fromController.view.alpha = 0
         fromController.view.transform = CGAffineTransformMakeScale(5, 5)
         }, completion: { finished in
            UIView.animateWithDuration(duration * 0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
               whiteView.alpha = 0
               }, completion: { (finished) -> Void in
                  transitionContext.completeTransition(true)
            })
      })
   }
   
   func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
      return 0.6
   }
   
   // MARK: - UIViewControllerTransitioningDelegate protocol methods
   func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      return self
   }
   
   func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      return self
   }
}