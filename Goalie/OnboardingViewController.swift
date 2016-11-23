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
      case unknown = 0.0
      case iPhone4 = 960.0
      case iPhone5 = 1136.0
      case iPhone6 = 1334.0
      case iPhone6Plus = 1920.0
   }
   
   var sizeType: SizeType {
      let height = nativeBounds.height
      guard let sizeType = SizeType(rawValue: height) else { return .unknown }
      return sizeType
   }
}

class OnboardingViewController: UIViewController
{
   @IBOutlet fileprivate weak var _bottomSpacePhoneConstraint: NSLayoutConstraint!
   @IBOutlet fileprivate weak var _phoneFrameImageView: UIImageView!
   @IBOutlet fileprivate weak var _phoneScreenImageView: UIImageView!
   @IBOutlet fileprivate weak var _finalPageContainerView: UIView!
   @IBOutlet fileprivate weak var _finalTextLabel: UILabel!
   @IBOutlet fileprivate weak var _textLabel: UILabel!
   
   fileprivate let _swipeRightRecognizer = UISwipeGestureRecognizer()
   fileprivate let _swipeLeftRecognizer = UISwipeGestureRecognizer()
   
   @IBOutlet fileprivate weak var _pageControlLayoutConstraint: NSLayoutConstraint! {
      didSet {
         if UIScreen.main.sizeType == .iPhone5 {
            _pageControlLayoutConstraint.constant = 0
         }
      }
   }
   
   @IBOutlet fileprivate weak var _pageControl: UIPageControl! {
      didSet {
         if UIScreen.main.sizeType != .iPhone5 {
            _pageControl.transform = CGAffineTransform(scaleX: 2, y: 2)
         }
      }
   }
   @IBOutlet fileprivate weak var _nextButton: GoalieKerningButton!
   
   var onboardingCompletionBlock: (() -> Void)?
   
   // MARK: - Lifecycle
   override func viewDidLoad()
   {
      super.viewDidLoad()
      
      _swipeRightRecognizer.addTarget(self, action: #selector(OnboardingViewController._goBackwards))
      view.addGestureRecognizer(_swipeRightRecognizer)
      
      _swipeLeftRecognizer.addTarget(self, action: #selector(OnboardingViewController._goForwards))
      _swipeLeftRecognizer.direction = .left
      view.addGestureRecognizer(_swipeLeftRecognizer)
      
      // calculate phone height
      let phoneWidth = UIScreen.main.bounds.width * phoneScreenWidthPercentage
      let phoneHeight = phoneWidth / phoneFrameAspectRatio
      
      _textLabel.alpha = 0
      _textLabel.attributedText = NSAttributedString.attributedOnboardingStringForPageNumber(0)
      _finalTextLabel.attributedText = NSAttributedString.attributedOnboardingStringForPageNumber(3)
      _bottomSpacePhoneConstraint.constant = -phoneHeight
   }
   
   override var preferredStatusBarStyle : UIStatusBarStyle {
      return .lightContent
   }
   
   override func viewDidAppear(_ animated: Bool)
   {
      super.viewDidAppear(animated)
      _bottomSpacePhoneConstraint.constant = 0
      UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: { () -> Void in
         self.view.layoutIfNeeded()
         }, completion: { finished in
            
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
               self._textLabel.alpha = 1
            })
      })
   }
   
   // MARK: - Swipe Recognition Methods
   internal func _goForwards()
   {
      let previousPage = _pageControl.currentPage
      let current = _pageControl.currentPage
      _pageControl.currentPage = _pageControl.currentPage + 1
      if current == finalPageNumber {
         self.onboardingCompletionBlock?()
      }
      else {
         _updateUIFromPageNumber(previousPage, toPageNumber: _pageControl.currentPage)
      }
   }
   
   internal func _goBackwards()
   {
      let previousPage = _pageControl.currentPage
      let currentPage = _pageControl.currentPage - 1
      _pageControl.currentPage = currentPage
      _updateUIFromPageNumber(previousPage, toPageNumber: currentPage)
   }
   
   // MARK: - IBActions
   @IBAction fileprivate func _nextButtonPressed()
   {
      _goForwards()
   }
   
   @IBAction fileprivate func _closeButtonPressed()
   {
      self.onboardingCompletionBlock?()
   }
   
   // MARK: - Private
   fileprivate func _updateUIFromPageNumber(_ previousPageNumber: Int, toPageNumber currentPageNumber: Int)
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
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
               
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
   
   fileprivate func _updateIPhoneScreenImage(_ image: UIImage, duration: TimeInterval)
   {
      UIView.transition(with: _phoneScreenImageView, duration: duration, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { () -> Void in
         self._phoneScreenImageView.image = image
         }, completion: nil)
   }
   
   fileprivate func _updateMainTextLabelWithAttributedText(_ text: NSAttributedString, duration: TimeInterval)
   {
      UIView.transition(with: _textLabel, duration: duration, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { () -> Void in
         self._textLabel.attributedText = text
         }, completion: nil)
   }
   
   fileprivate func _setupFinalPageContainerView()
   {
      _finalPageContainerView.alpha = 0
      _finalPageContainerView.center = CGPoint(x: view.center.x, y: view.center.y - 20)
      view.addSubview(_finalPageContainerView)
   }
   
   fileprivate func _removeFinalPageContainerView()
   {
      _finalPageContainerView.removeFromSuperview()
   }
   
   fileprivate func _animateFinalPageInWithDuration(_ duration: TimeInterval)
   {
      _bottomSpacePhoneConstraint.constant = -_phoneFrameImageView.bounds.height
      UIView.animate(withDuration: duration * 0.5, animations: { () -> Void in
         
         self._textLabel.alpha = 0
         self.view.layoutIfNeeded()
         self._nextButton.updateText("LET'S GO", color: UIColor.white)
         }, completion: { (finished) -> Void in
            
            UIView.animate(withDuration: duration * 0.5, animations: { () -> Void in
               self._finalPageContainerView.alpha = 1
            })
         }
      )
   }
   
   fileprivate func _animateFinalPageOutWithDuration(_ duration: TimeInterval, completion: ((_ finished: Bool) -> ())?)
   {
      UIView.animate(withDuration: duration, animations: { () -> Void in
         self._finalPageContainerView.alpha = 0
         }, completion: { (finished) -> Void in
            self._removeFinalPageContainerView()
            completion?(finished)
      }) 
   }

   fileprivate func _mainTextForPageNumber(_ number: Int) -> String?
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
   
   fileprivate func _screenImageForPageNumber(_ number: Int) -> UIImage?
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
