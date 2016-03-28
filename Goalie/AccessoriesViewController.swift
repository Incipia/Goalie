//
//  AccessoriesViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class AccessoriesViewController: UIViewController
{
   @IBOutlet private var _accessoryPacksViews: [AccessoryPackView]!
   
   @IBOutlet private weak var _gymView: GymView!
   @IBOutlet private weak var _homeView: HomeView!
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
      view.addSubview(_gymView)
      view.addSubview(_homeView)
      
      _gymView.hidden = true
   }
   
   override func viewDidLayoutSubviews()
   {
      super.viewDidLayoutSubviews()
      for view in _accessoryPacksViews {
         view.frame = self.view.bounds
      }
   }
   
   func updateWithPriority(priority: TaskPriority)
   {
      for view in _accessoryPacksViews {
         view.updateWithPriority(priority)
      }
   }
   
   func updateLayoutWithCharacter(c: GoalieCharacter) {
      for view in _accessoryPacksViews {
         view.updateLayoutWithCharacter(c)
      }
   }
}

class AccessoryPackView: UIView
{
   @IBOutlet private var _accessoryViews: [AccessoryView]!
   @IBOutlet weak var characterView: CharacterView!
   
   func updateWithPriority(priority: TaskPriority)
   {
      for view in _accessoryViews {
         view.updateWithPriority(priority)
      }
   }
   
   func updateLayoutWithCharacter(c: GoalieCharacter)
   {
      characterView.updateCharacter(c)
   }
}

class GymView: AccessoryPackView
{
}

class HomeView: AccessoryPackView
{
}
