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
      case .Unknown: return UIColor(red: 0.225, green: 0.211, blue: 0.504, alpha: 1.000)
      case .Ages: return UIColor(red: 0.098, green: 0.361, blue: 0.160, alpha: 1.000)
      case .Later: return UIColor(red: 0.090, green: 0.233, blue: 0.352, alpha: 1.000)
      case .Soon: return UIColor(red: 0.611, green: 0.356, blue: 0.044, alpha: 1.000)
      case .ASAP: return UIColor(red: 0.522, green: 0.053, blue: 0.177, alpha: 1.000)
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
   
   private var _labelWidth: CGFloat {
      return _textLabel.bounds.width
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
      
      self.widthConstraint?.constant = self._labelWidth + 25
   }
   
   private func _updateTextLabelPosition()
   {
      _textLabel.center = CGPoint(x: bounds.midX, y: bounds.midY - 5)
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
