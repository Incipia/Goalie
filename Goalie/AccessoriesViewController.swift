//
//  AccessoriesViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

enum AccessoryPack: Int
{
   case Gym, Home, Work, None
   
   var next: AccessoryPack {
      switch self {
      case .Gym: return .Home
      case .Home: return .Work
      case .Work: return .None
      case .None: return .Gym
      }
   }
}

class AccessoriesViewController: UIViewController
{
   @IBOutlet private var _accessoryPacksViews: [AccessoryPackView]!
   
   @IBOutlet private weak var _gymView: GymView!
   @IBOutlet private weak var _homeView: HomeView!
   @IBOutlet private weak var _workView: WorkView!
   
   private var _viewTransformer: ViewTransformer!
   
   private(set) var currentAccessoryPack: AccessoryPack = .None
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
      
      view.addSubview(_gymView)
      view.addSubview(_homeView)
      view.addSubview(_workView)
      
      _viewTransformer = ViewTransformer(view: view)
      _viewTransformer.takeItEasy = true
      
      _updateUIWithAccessoryPack(currentAccessoryPack)
   }
   
   override func viewDidLayoutSubviews()
   {
      super.viewDidLayoutSubviews()
      
      for view in _accessoryPacksViews {
         view.frame = self.view.bounds
      }
   }
   
   // MARK: - Public
   func updateAccessoryPack(pack: AccessoryPack)
   {
      currentAccessoryPack = pack
      _updateUIWithAccessoryPack(pack)
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
   
   // MARK: - Private
   private func _updateUIWithAccessoryPack(pack: AccessoryPack)
   {
      for view in _accessoryPacksViews {
         view.hidden = true
      }
      
      switch pack {
      case .Gym: _gymView.hidden = false
      case .Home: _homeView.hidden = false
      case .Work: _workView.hidden = false
      case .None: break
      }
   }
   
   override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
   {
      super.touchesBegan(touches, withEvent: event)
      _viewTransformer.touchesBegan(touches)
   }
   
   override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
   {
      super.touchesMoved(touches, withEvent: event)
      
      guard let point = touches.first?.locationInView(nil) where
         view.bounds.contains(point) else {
            _viewTransformer.resetViewWithDuration(0.5)
            return
      }
      
      _viewTransformer.touchesMoved(touches)
   }
   
   override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)
   {
      super.touchesEnded(touches, withEvent: event)
      _viewTransformer.resetViewWithDuration(0.5)
   }
   
   override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?)
   {
      super.touchesCancelled(touches, withEvent: event)
      _viewTransformer.resetViewWithDuration(0.5)
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

class WorkView: AccessoryPackView
{
}
