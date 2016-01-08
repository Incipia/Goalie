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
   static func backgroundColorForPriority(priority: TaskPriority) -> UIColor
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
   var tailDirection: BubbleTailDirection = BubbleTailDirection.Left {
      didSet {
         setNeedsDisplay()
      }
   }
   
   private let _textLabel = UILabel()
   private var _currentPriority: TaskPriority = .Unknown
   
   // MARK: - Lifecycle
   override func awakeFromNib()
   {
      super.awakeFromNib()
      backgroundColor = UIColor.clearColor()
      
      let text = "BOOORING"
      let font = UIFont(name: "NotoSans-Bold", size: 10)!
      let attributes = [
         NSForegroundColorAttributeName : UIColor.goalieEmptyTasksColor(),
         NSFontAttributeName : font,
         NSKernAttributeName : 2
      ]
      
      let attributedString = NSAttributedString(string: text, attributes: attributes)
      _textLabel.attributedText = attributedString
      _textLabel.sizeToFit()
      
      addSubview(_textLabel)
      _textLabel.center = CGPoint(x: bounds.midX, y: bounds.midY - 5)
   }
   
   // MARK: - Public
   func updateWithPriority(priority: TaskPriority)
   {
      _currentPriority = priority
      _textLabel.textColor = UIColor.textColorForPriority(priority)
      setNeedsDisplay()
   }
   
   // MARK: - Drawing
   override func drawRect(rect: CGRect)
   {
      let color = UIColor.backgroundColorForPriority(_currentPriority)
      GoalieSpeechBubbleKit.drawBubbleWithColor(color, tailDirection: tailDirection, inFrame: rect)
   }
}
