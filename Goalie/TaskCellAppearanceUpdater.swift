//
//  TaskCellAppearanceUpdater.swift
//  Goalie
//
//  Created by Gregory Klein on 12/30/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

enum TaskCellComponent {
   case LeftBar, LeftButton, TextField, DisclosureButton
}

enum TaskCellAppearanceProperty {
   case Alpha, Hidden, Color
}

struct TaskCellAppearanceUpdater
{
   private weak var _task: Task?
   private var _delegate: TaskCellAppearanceDelegate
   
   // Mark: - Init
   init(delegate: TaskCellAppearanceDelegate)
   {
      _delegate = delegate
   }
   
   // Mark: - Public
   mutating func updateTask(task: Task)
   {
      _task = task
   }
   
   func updateProperty(property: TaskCellAppearanceProperty, forComponents components: [TaskCellComponent])
   {
      for component in components
      {
         switch property {
         case .Alpha:
            _updateAlphaForComponent(component)
            break
         case .Hidden:
            _updateHiddenPropertyForComponent(component)
            break
         case .Color:
            _updateColorForComponent(component)
            break
         }
      }
   }
   
   // Mark: - Private
   func _updateColorForComponent(component: TaskCellComponent)
   {
      switch component {
      case .LeftBar:
         if let view = _delegate.viewForComponent(component), let task = _task {
            let color = task.title == "" ? UIColor.goalieGrayColor() : UIColor(priority: task.priority)
            view.backgroundColor = color
         }
         break
      case .LeftButton:
         if let button = _delegate.viewForComponent(component) as? UIButton, let task = _task {
            let color = task.completed ? UIColor(priority: task.priority) : UIColor.goalieGrayColor()
            button.tintColor = color
         }
      default:
         break
      }
   }
   
   func _updateAlphaForComponent(component: TaskCellComponent)
   {
      if let control = _delegate.viewForComponent(component), let task = _task {
         control.alpha = task.completed ? 0.4 : 1.0
      }
   }
   
   func _updateHiddenPropertyForComponent(component: TaskCellComponent)
   {
      if let view = _delegate.viewForComponent(component),
         let task = _task where component == .DisclosureButton {
         view.hidden = task.title == ""
      }
   }
}

protocol TaskCellAppearanceDelegate
{
   func viewForComponent(component: TaskCellComponent) -> UIView?
}
