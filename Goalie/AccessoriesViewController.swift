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
   case gym, home, work, none
   
   var next: AccessoryPack {
      switch self {
      case .gym: return .home
      case .home: return .work
      case .work: return .none
      case .none: return .gym
      }
   }
}

class AccessoriesViewController: UIViewController
{
   @IBOutlet fileprivate var _accessoryPacksViews: [AccessoryPackView]!
   
   @IBOutlet fileprivate weak var _gymView: GymView!
   @IBOutlet fileprivate weak var _homeView: HomeView!
   @IBOutlet fileprivate weak var _workView: WorkView!
   
   fileprivate var _viewTransformer: ViewTransformer!
   
   fileprivate(set) var currentAccessoryPack: AccessoryPack = .none
   
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
   func updateAccessoryPack(_ pack: AccessoryPack)
   {
      currentAccessoryPack = pack
      _updateUIWithAccessoryPack(pack)
   }
   
   func updateWithPriority(_ priority: TaskPriority)
   {
      for view in _accessoryPacksViews {
         view.updateWithPriority(priority)
      }
   }
   
   func updateLayoutWithCharacter(_ c: GoalieCharacter) {
      for view in _accessoryPacksViews {
         view.updateLayoutWithCharacter(c)
      }
   }
   
   // MARK: - Private
   fileprivate func _updateUIWithAccessoryPack(_ pack: AccessoryPack)
   {
      for view in _accessoryPacksViews {
         view.isHidden = true
      }
      
      switch pack {
      case .gym: _gymView.isHidden = false
      case .home: _homeView.isHidden = false
      case .work: _workView.isHidden = false
      case .none: break
      }
   }
   
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
   {
      super.touchesBegan(touches, with: event)
      _viewTransformer.touchesBegan(touches)
   }
   
   override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
   {
      super.touchesMoved(touches, with: event)
      
      guard let point = touches.first?.location(in: nil),
         view.bounds.contains(point) else {
            _viewTransformer.resetViewWithDuration(0.5)
            return
      }
      
      _viewTransformer.touchesMoved(touches)
   }
   
   override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
   {
      super.touchesEnded(touches, with: event)
      _viewTransformer.resetViewWithDuration(0.5)
   }
   
   override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?)
   {
      super.touchesCancelled(touches!, with: event)
      _viewTransformer.resetViewWithDuration(0.5)
   }
}

class AccessoryPackView: UIView
{
   @IBOutlet fileprivate var _accessoryViews: [AccessoryView]!
   @IBOutlet weak var characterView: CharacterView!
   
   func updateWithPriority(_ priority: TaskPriority)
   {
      for view in _accessoryViews {
         view.updateWithPriority(priority)
      }
   }
   
   func updateLayoutWithCharacter(_ c: GoalieCharacter)
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
