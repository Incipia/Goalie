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
   case Left, Right
}

private extension UIColor
{
   static func speechBubbleBackgroundColorForPriority(priority: TaskPriority) -> UIColor
   {
      switch priority
      {
      case .Unknown: return UIColor(rgbValues: (74, 74, 147))
      case .Ages: return UIColor(rgbValues: (29, 100, 79))
      case .Later: return UIColor(rgbValues: (28, 77, 109))
      case .Soon: return UIColor(rgbValues: (173, 110, 9))
      case .ASAP: return UIColor(rgbValues: (153, 29, 59))
      }
   }
   
   
   static func textColorForPriority(priority: TaskPriority) -> UIColor
   {
      switch priority
      {
      case .Unknown: return UIColor.goalieEmptyTasksColor()
      default: return UIColor(priority: priority)
      }
   }
}

class GoalieSpeechBubble: UIView
{
   @IBOutlet private weak var widthConstraint: NSLayoutConstraint?
   
   var tailDirection: BubbleTailDirection = BubbleTailDirection.Left {
      didSet {
         setNeedsDisplay()
      }
   }
   
   private let _textLabel = UILabel()
   private var _currentPriority: TaskPriority = .Unknown
   
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
      backgroundColor = UIColor.clearColor()
      
      addSubview(_textLabel)
   }
   
   // MARK: - Public
   func updateWithText(text: String, priority: TaskPriority)
   {
      _currentPriority = priority
      _updateTextLabelWithText(text, priority: priority)
      setNeedsDisplay()
   }
   
   // MARK: - Private
   private func _updateTextLabelWithText(text: String, priority: TaskPriority)
   {
      _textLabel.attributedText = NSAttributedString.speechBubbleString(text)
      _textLabel.textColor = UIColor.textColorForPriority(priority)
      _textLabel.sizeToFit()
      
      self.widthConstraint?.constant = self.labelWidth + 45
   }
   
   private func _updateTextLabelPosition()
   {
      _textLabel.center = CGPoint(x: bounds.midX, y: bounds.midY - 10)
   }
   
   override func layoutSubviews()
   {
      super.layoutSubviews()
      _updateTextLabelPosition()
   }
   
   // MARK: - Drawing
   override func drawRect(rect: CGRect)
   {
      let color = UIColor.speechBubbleBackgroundColorForPriority(_currentPriority)
      GoalieSpeechBubbleKit.drawBubbleWithColor(color, tailDirection: tailDirection, inFrame: rect)
   }
}
