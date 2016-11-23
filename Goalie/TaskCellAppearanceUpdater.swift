//
//  TaskCellAppearanceUpdater.swift
//  Goalie
//
//  Created by Gregory Klein on 12/30/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

enum TaskCellComponent {
   case leftBar, leftButton, textField, disclosureButton
}

enum TaskCellAppearanceProperty {
   case alpha, hidden, color
}

struct TaskCellAppearanceUpdater
{
   fileprivate weak var _task: Task?
   fileprivate var _delegate: TaskCellAppearanceDelegate
   
   // Mark: - Init
   init(delegate: TaskCellAppearanceDelegate)
   {
      _delegate = delegate
   }
   
   // Mark: - Public
   mutating func updateTask(_ task: Task)
   {
      _task = task
   }
   
   func updateProperty(_ property: TaskCellAppearanceProperty, forComponents components: [TaskCellComponent])
   {
      for component in components
      {
         switch property {
         case .alpha:
            _updateAlphaForComponent(component)
            break
         case .hidden:
            _updateHiddenPropertyForComponent(component)
            break
         case .color:
            _updateColorForComponent(component)
            break
         }
      }
   }
   
   // Mark: - Private
   func _updateColorForComponent(_ component: TaskCellComponent)
   {
      switch component {
      case .leftBar:
         if let view = _delegate.viewForComponent(component), let task = _task {
            let color = task.title == "" ? UIColor.goalieGrayColor() : UIColor(priority: task.priority)
            view.backgroundColor = color
         }
         break
      case .leftButton:
         if let button = _delegate.viewForComponent(component) as? UIButton, let task = _task {
            var color = task.completed ? UIColor(priority: task.priority) : UIColor.goalieGrayColor()
            if task.title == "" {
               color = UIColor.lightGoalieGrayColor()
            }
            button.tintColor = color
         }
      default:
         break
      }
   }
   
   func _updateAlphaForComponent(_ component: TaskCellComponent)
   {
      if let control = _delegate.viewForComponent(component), let task = _task {
         control.alpha = task.completed ? 0.4 : 1.0
      }
   }
   
   func _updateHiddenPropertyForComponent(_ component: TaskCellComponent)
   {
      if let view = _delegate.viewForComponent(component),
         let task = _task, component == .disclosureButton {
         view.isHidden = task.title == ""
      }
   }
}

protocol TaskCellAppearanceDelegate
{
   func viewForComponent(_ component: TaskCellComponent) -> UIView?
}
