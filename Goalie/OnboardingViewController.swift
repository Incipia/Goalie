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
let finalPageNumber = 3

extension UIScreen {
   
   enum SizeType: CGFloat {
      case Unknown = 0.0
      case iPhone4 = 960.0
      case iPhone5 = 1136.0
      case iPhone6 = 1334.0
      case iPhone6Plus = 1920.0
   }
   
   var sizeType: SizeType {
      let height = nativeBounds.height
      guard let sizeType = SizeType(rawValue: height) else { return .Unknown }
      return sizeType
   }
}

class OnboardingViewController: UIViewController
{
   @IBOutlet private weak var _bottomSpacePhoneConstraint: NSLayoutConstraint!
   @IBOutlet private weak var _phoneFrameImageView: UIImageView!
   @IBOutlet private weak var _phoneScreenImageView: UIImageView!
   @IBOutlet private weak var _finalPageContainerView: UIView!
   @IBOutlet private weak var _finalTextLabel: UILabel!
   @IBOutlet private weak var _textLabel: UILabel!
   
   private let _swipeRightRecognizer = UISwipeGestureRecognizer()
   private let _swipeLeftRecognizer = UISwipeGestureRecognizer()
   
   @IBOutlet private weak var _pageControlLayoutConstraint: NSLayoutConstraint! {
      didSet {
         if UIScreen.mainScreen().sizeType == .iPhone5 {
            _pageControlLayoutConstraint.constant = 0
         }
      }
   }
   
   @IBOutlet private weak var _pageControl: UIPageControl! {
      didSet {
         if UIScreen.mainScreen().sizeType != .iPhone5 {
            _pageControl.transform = CGAffineTransformMakeScale(2, 2)
         }
      }
   }
   @IBOutlet private weak var _nextButton: GoalieKerningButton!
   
   var onboardingCompletionBlock: (() -> Void)?
   
   // MARK: - Lifecycle
   override func viewDidLoad()
   {
      super.viewDidLoad()
      
      _swipeRightRecognizer.addTarget(self, action: "_goBackwards")
      view.addGestureRecognizer(_swipeRightRecognizer)
      
      _swipeLeftRecognizer.addTarget(self, action: "_goForwards")
      _swipeLeftRecognizer.direction = .Left
      view.addGestureRecognizer(_swipeLeftRecognizer)
      
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
   
   // MARK: - Swipe Recognition Methods
   internal func _goForwards()
   {
      let previousPage = _pageControl.currentPage
      if _pageControl.currentPage++ == finalPageNumber {
         self.onboardingCompletionBlock?()
      }
      else {
         _updateUIFromPageNumber(previousPage, toPageNumber: _pageControl.currentPage)
      }
   }
   
   internal func _goBackwards()
   {
      let previousPage = _pageControl.currentPage
      let currentPage = --_pageControl.currentPage
      _updateUIFromPageNumber(previousPage, toPageNumber: currentPage)
   }
   
   // MARK: - IBActions
   @IBAction private func _nextButtonPressed()
   {
      _goForwards()
   }
   
   @IBAction private func _closeButtonPressed()
   {
      self.onboardingCompletionBlock?()
   }
   
   // MARK: - Private
   private func _updateUIFromPageNumber(previousPageNumber: Int, toPageNumber currentPageNumber: Int)
   {
      guard currentPageNumber >= 0 && previousPageNumber != currentPageNumber else { return }
      
      if previousPageNumber == finalPageNumber && currentPageNumber < previousPageNumber
      {
         _animateFinalPageOutWithDuration(0.3, completion: { (finished) -> () in
            
            guard let image = self._screenImageForPageNumber(currentPageNumber) else { return }
            let attrText = NSAttributedString.attributedOnboardingStringForPageNumber(currentPageNumber)
            self._updateIPhoneScreenImage(image, duration: 0.3)
            self._updateMainTextLabelWithAttributedText(attrText, duration: 0.3)
            
            self._bottomSpacePhoneConstraint.constant = 0
            UIView.animateWithDuration(0.3, animations: { () -> Void in
               
               self._textLabel.alpha = 1
               self.view.layoutIfNeeded()
            })
         })
      }
      
      let attrText = NSAttributedString.attributedOnboardingStringForPageNumber(currentPageNumber)
      if currentPageNumber < finalPageNumber
      {
         guard let image = _screenImageForPageNumber(currentPageNumber) else { return }
         _updateIPhoneScreenImage(image, duration: 0.3)
         _updateMainTextLabelWithAttributedText(attrText, duration: 0.3)
      }
      else
      {
         _setupFinalPageContainerView()
         _animateFinalPageInWithDuration(0.6)
      }
   }
   
   private func _updateIPhoneScreenImage(image: UIImage, duration: NSTimeInterval)
   {
      UIView.transitionWithView(_phoneScreenImageView, duration: duration, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
         self._phoneScreenImageView.image = image
         }, completion: nil)
   }
   
   private func _updateMainTextLabelWithAttributedText(text: NSAttributedString, duration: NSTimeInterval)
   {
      UIView.transitionWithView(_textLabel, duration: duration, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
         self._textLabel.attributedText = text
         }, completion: nil)
   }
   
   private func _setupFinalPageContainerView()
   {
      _finalPageContainerView.alpha = 0
      _finalPageContainerView.center = CGPoint(x: view.center.x, y: view.center.y - 20)
      view.addSubview(_finalPageContainerView)
   }
   
   private func _removeFinalPageContainerView()
   {
      _finalPageContainerView.removeFromSuperview()
   }
   
   private func _animateFinalPageInWithDuration(duration: NSTimeInterval)
   {
      _bottomSpacePhoneConstraint.constant = -_phoneFrameImageView.bounds.height
      UIView.animateWithDuration(duration * 0.5, animations: { () -> Void in
         
         self._textLabel.alpha = 0
         self.view.layoutIfNeeded()
         self._nextButton.updateText("LET'S GO", color: UIColor.whiteColor())
         }, completion: { (finished) -> Void in
            
            UIView.animateWithDuration(duration * 0.5, animations: { () -> Void in
               self._finalPageContainerView.alpha = 1
            })
         }
      )
   }
   
   private func _animateFinalPageOutWithDuration(duration: NSTimeInterval, completion: ((finished: Bool) -> ())?)
   {
      UIView.animateWithDuration(duration, animations: { () -> Void in
         self._finalPageContainerView.alpha = 0
         }) { (finished) -> Void in
            self._removeFinalPageContainerView()
            completion?(finished: finished)
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
