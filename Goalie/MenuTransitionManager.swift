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
      return viewController(forKey: UITransitionContextViewControllerKey.to)
   }
   
   var fromViewController: UIViewController? {
      return viewController(forKey: UITransitionContextViewControllerKey.from)
   }
}

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate
{
   var presenting = true
   
   // MARK: - UIViewControllerAnimatedTransitioning protocol methods
   func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
   {
      if presenting {
         _presentWithTransitionContext(transitionContext)
      }
      else {
         _dismissWithTransitionContext(transitionContext)
      }
   }
   
   func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
      return 0.5
   }
   
   // MARK: - UIViewControllerTransitioningDelegate protocol methods
   func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      return self
   }
   
   func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      return self
   }
   
   // MARK: - Private
   fileprivate func _presentWithTransitionContext(_ transitionContext: UIViewControllerContextTransitioning)
   {
      // get reference to our fromView, toView and the container view that we should perform the transition in
      let container = transitionContext.containerView
      
      guard let toController = transitionContext.toViewController as? MenuController else {
         transitionContext.completeTransition(true)
         return
      }
      
      let scaledTransform = CGAffineTransform(scaleX: 0.4, y: 0.4)
      toController.dialogContainer.transform = scaledTransform
      
      toController.view.alpha = 1
      toController.view.backgroundColor = UIColor.clear
      
      container.addSubview(toController.view)
      
      let duration = transitionDuration(using: transitionContext)
      UIView.animate(withDuration: duration * 0.4,
         delay: 0,
         options: UIViewAnimationOptions.curveEaseIn,
         animations: { () -> Void in
         
//         toController.dialogContainer.transform = CGAffineTransformIdentity
         toController.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
         
         }, completion: { finished in
//            transitionContext.completeTransition(true)
      })
      
      UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
         
         toController.dialogContainer.transform = CGAffineTransform.identity
//         toController.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
         }) { (finished) -> Void in
            transitionContext.completeTransition(true)
      }
   }
   
   fileprivate func _dismissWithTransitionContext(_ transitionContext: UIViewControllerContextTransitioning)
   {
      // get reference to our fromView, toView and the container view that we should perform the transition in
      let container = transitionContext.containerView
      guard let fromController = transitionContext.fromViewController as? MenuController else {
         transitionContext.completeTransition(true)
         return
      }
   
      container.addSubview(fromController.view)
      
//      let duration = transitionDuration(transitionContext)
      UIView.animate(withDuration: 0.25,
         delay: 0,
         options: UIViewAnimationOptions.curveEaseOut,
         animations: { () -> Void in
         
         fromController.view.alpha = 0
         fromController.dialogContainer.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
         
         }, completion: { finished in
            transitionContext.completeTransition(true)
      })
   }
}
