//
//  GoalieSpeechBubble.swift
//  Goalie
//
//  Created by Gregory Klein on 1/7/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

enum BubbleTailDirection
{
   case left, right
}

private extension UIColor
{
   static func speechBubbleBackgroundColorForPriority(_ priority: TaskPriority) -> UIColor
   {
      switch priority
      {
      case .unknown: return UIColor(rgbValues: (74, 74, 147))
      case .ages: return UIColor(rgbValues: (29, 100, 79))
      case .later: return UIColor(rgbValues: (28, 77, 109))
      case .soon: return UIColor(rgbValues: (173, 110, 9))
      case .asap: return UIColor(rgbValues: (153, 29, 59))
      }
   }
   
   static func textColorForPriority(_ priority: TaskPriority) -> UIColor
   {
      switch priority
      {
      case .unknown: return UIColor.goalieEmptyTasksColor()
      default: return UIColor(priority: priority)
      }
   }
}

class GoalieSpeechBubble: UIView
{
   @IBOutlet fileprivate weak var widthConstraint: NSLayoutConstraint!
   @IBOutlet fileprivate weak var baselineConstraint: NSLayoutConstraint!
   
   var tailDirection: BubbleTailDirection = BubbleTailDirection.left {
      didSet {
         setNeedsDisplay()
      }
   }
   
   fileprivate let _textLabel = UILabel()
   fileprivate var _currentPriority: TaskPriority = .unknown
   
   var labelWidth: CGFloat {
      return _textLabel.bounds.width
   }
   
   var actualWidth: CGFloat {
      return widthConstraint?.constant ?? bounds.width
   }
   
   // MARK: - Lifecycle
   override func awakeFromNib()
   {
      super.awakeFromNib()
      
      layer.masksToBounds = true
      backgroundColor = UIColor.clear
      
      addSubview(_textLabel)
   }
   
   // MARK: - Public
   func adjustAnchorPoint(_ point: CGPoint)
   {
      let oldOrigin = frame.origin
      layer.anchorPoint = point
      let newOrigin = frame.origin
      
      let transition = CGPoint (x: newOrigin.x - oldOrigin.x, y: newOrigin.y - oldOrigin.y)
      baselineConstraint.constant += transition.y
   }
   
   func updateWithText(_ text: String, priority: TaskPriority)
   {
      _currentPriority = priority
      _updateTextLabelWithText(text.uppercased(), priority: priority)
      setNeedsDisplay()
   }
   
   // MARK: - Private
   fileprivate func _updateTextLabelWithText(_ text: String, priority: TaskPriority)
   {
      _textLabel.attributedText = NSAttributedString.speechBubbleString(text)
      _textLabel.textColor = UIColor.textColorForPriority(priority)
      _textLabel.sizeToFit()
      
      self.widthConstraint.constant = self.labelWidth + 45
   }
   
   fileprivate func _updateTextLabelPosition()
   {
      _textLabel.center = CGPoint(x: bounds.midX, y: bounds.midY - 10)
   }
   
   override func layoutSubviews()
   {
      super.layoutSubviews()
      _updateTextLabelPosition()
   }
   
   // MARK: - Drawing
   override func draw(_ rect: CGRect)
   {
      let color = UIColor.speechBubbleBackgroundColorForPriority(_currentPriority)
      GoalieSpeechBubbleKit.drawBubbleWithColor(color, tailDirection: tailDirection, inFrame: rect)
   }
}
