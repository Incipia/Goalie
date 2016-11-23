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
   func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
   {
      let container = transitionContext.containerView
      
      let fromController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! OnboardingViewController
      let toController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! MainTasksViewController
      
      container.addSubview(toController.view)
      
      let whiteView = UIView()
      whiteView.frame = toController.view.bounds
      whiteView.backgroundColor = UIColor.white
      
      container.addSubview(whiteView)
      container.addSubview(fromController.view)
      
      let duration = transitionDuration(using: transitionContext)
      UIView.animate(withDuration: duration * 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
         fromController.view.alpha = 0
         fromController.view.transform = CGAffineTransform(scaleX: 5, y: 5)
         }, completion: { finished in
            UIView.animate(withDuration: duration * 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
               whiteView.alpha = 0
               }, completion: { (finished) -> Void in
                  transitionContext.completeTransition(true)
            })
      })
   }
   
   func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
      return 0.6
   }
   
   // MARK: - UIViewControllerTransitioningDelegate protocol methods
   func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      return self
   }
   
   func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      return self
   }
}
