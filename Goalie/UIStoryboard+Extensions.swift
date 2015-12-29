//
//  UIStoryboard+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 12/10/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

extension UIStoryboard
{  
   static func taskDetailsViewController() -> EditTaskViewController
   {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      return storyboard.instantiateViewControllerWithIdentifier("TaskDetailsViewController") as! EditTaskViewController
   }
   
   static func mainTasksViewController() -> MainTasksViewController
   {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      return storyboard.instantiateViewControllerWithIdentifier("MainTasksViewController") as! MainTasksViewController
   }
}
