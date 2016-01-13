//
//  OnboardingViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 1/11/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

let phoneFrameAspectRatio: CGFloat = 65.0/74.0
let phoneScreenWidthPercentage: CGFloat = 0.8

class OnboardingViewController: UIViewController
{
   @IBOutlet private weak var _bottomSpacePhoneConstraint: NSLayoutConstraint!
   @IBOutlet private weak var _phoneFrameImageView: UIImageView!
   @IBOutlet private weak var _phoneScreenImageView: UIImageView!
   @IBOutlet private weak var _finalPageContainerView: UIView!
   @IBOutlet private weak var _finalTextLabel: UILabel!
   @IBOutlet private weak var _textLabel: UILabel!
   @IBOutlet private weak var _pageControl: UIPageControl!
   @IBOutlet private weak var _nextButton: GoalieKerningButton!
   
   var onboardingCompletionBlock: (() -> Void)?
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
      
      // calculate phone height
      let phoneWidth = UIScreen.mainScreen().bounds.width * phoneScreenWidthPercentage
      let phoneHeight = phoneWidth / phoneFrameAspectRatio
      
      _textLabel.alpha = 0
      _textLabel.attributedText = NSAttributedString.attributedOnboardingStringForPageNumber(0)
      _finalTextLabel.attributedText = NSAttributedString.attributedOnboardingStringForPageNumber(3)
      _bottomSpacePhoneConstraint.constant = -phoneHeight
   }
   
   override func preferredStatusBarStyle() -> UIStatusBarStyle {
      return .LightContent
   }
   
   override func viewDidAppear(animated: Bool)
   {
      super.viewDidAppear(animated)
      _bottomSpacePhoneConstraint.constant = 0
      UIView.animateWithDuration(0.5, delay: 0.2, options: [], animations: { () -> Void in
         self.view.layoutIfNeeded()
         }, completion: { finished in
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
               self._textLabel.alpha = 1
            })
      })
   }
   
   @IBAction private func _nextButtonPressed()
   {
      if _pageControl.currentPage++ == _pageControl.numberOfPages - 1 {
         self.onboardingCompletionBlock?()
      }
      else {
         _updateUIForCurrentPage(_pageControl.currentPage)
      }
   }
   
   @IBAction private func _closeButtonPressed()
   {
      self.onboardingCompletionBlock?()
   }
   
   private func _updateUIForCurrentPage(pageNumber: Int)
   {
      UIView.transitionWithView(_textLabel, duration: 0.3, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
         
         let attrText = NSAttributedString.attributedOnboardingStringForPageNumber(pageNumber)
         self._textLabel.attributedText = attrText
         }, completion: nil)
      
      if let image = _screenImageForPageNumber(pageNumber) {
         UIView.transitionWithView(_phoneScreenImageView, duration: 0.3, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
            self._phoneScreenImageView.image = image
            }, completion: nil)
      }
      else {
         _finalPageContainerView.alpha = 0
         _finalPageContainerView.center = CGPoint(x: view.center.x, y: view.center.y - 50)
         view.addSubview(_finalPageContainerView)
         
         _bottomSpacePhoneConstraint.constant = -_phoneFrameImageView.bounds.height
         UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self._textLabel.alpha = 0
            self.view.layoutIfNeeded()
            self._nextButton.updateText("LET'S GO", color: UIColor.whiteColor())
            }, completion: { (finished) -> Void in
               
               UIView.animateWithDuration(0.3, animations: { () -> Void in
                  self._finalPageContainerView.alpha = 1
               })
            }
         )
      }
   }
   
   private func _mainTextForPageNumber(number: Int) -> String?
   {
      switch number
      {
      case 0: return "Meet Goalie.\nHe really likes tasks...."
      case 1: return "Add a task to start a list. \rGive them a priority if you want,\ror Goalie can do it for you."
      case 2: return "The longer you wait to finish\ra task, the hotter Goalie gets."
      case 3: return "So get to it.\rWhen you're happy,\rGoalie's happy."
      default: return nil
      }
   }
   
   private func _screenImageForPageNumber(number: Int) -> UIImage?
   {
      switch number
      {
      case 0: return UIImage(named: "onboarding-1")
      case 1: return UIImage(named: "onboarding-2")
      case 2: return UIImage(named: "onboarding-3")
      default: return nil
      }
   }
}
