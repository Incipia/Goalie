//
//  AppDelegate.swift
//  Goalie
//
//  Created by Gregory Klein on 12/26/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
   var window: UIWindow?

   func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
   {
      IQKeyboardManager.sharedManager().enable = true
      IQKeyboardManager.sharedManager().enableAutoToolbar = false
      IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true
      IQKeyboardManager.sharedManager().shouldRestoreScrollViewContentOffset = true
      
      return true
   }
}

