//
//  LocalNotificationsManager.swift
//  Goalie
//
//  Created by Brendan Lau on 2/2/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit
import UserNotifications

//case .asap: return nil
//case .soon: return (60 * 60 * 24 * 1)
//case .later: return (60 * 60 * 24 * 3)
//case .ages: return (60 * 60 * 24 * 5)
//case .unknown: return nil


class LocalNotificationsManager {
   
   
   // Called whenever the user creates a new task, after NSManagedObjectContext
   func createNotification(for task: Task) {
      
      if let taskDurationToASAP = task.priority.durationToASAP {
         
         if #available(iOS 10.0, *) {
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: taskDurationToASAP, repeats: false)
            let content = UNMutableNotificationContent()
            content.title = "Don't Forget!"
            content.body = task.title
            content.sound = UNNotificationSound.default()
            //content.badge =
            let request = UNNotificationRequest(identifier: task.uuid, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
               if error != nil
                  { print("Successfully added a UNNotificationRequest for task: \(task.title)") } })
         } else { print("No iOS 10.0!") }
      }
   }
   
   // Called whenever the user modifies the Task's Priority
   // 1) remove the scheduled UNNotification request
   // 2) createNotification(task)
   func updateNotification(for updateTask: Task) {
      if #available(iOS 10.0, *) {
         
         let curr = UNUserNotificationCenter.current()
         
         curr.getPendingNotificationRequests(completionHandler: { (requests) in
            for r in requests {
               if r.identifier == updateTask.uuid {
                  if let taskDurationToASAP = updateTask.priority.durationToASAP {
                     let newTrigger = UNTimeIntervalNotificationTrigger(timeInterval: taskDurationToASAP, repeats: false)
                     let newRequest = UNNotificationRequest(identifier: r.identifier, content: r.content, trigger: newTrigger)
                     curr.removePendingNotificationRequests(withIdentifiers: [updateTask.uuid])
                     curr.add(newRequest, withCompletionHandler: { (error) in
                        if error != nil { print("Successfully added a UNNotificationRequest for task: \(updateTask.title)")}
                     })
                  }
               }
               else { print("Updated Task has an incorrect priority") }
            }
         })
      } else { print("No iOS 10.0!") }
   }
   
   
   // Remove the Notification associated with the supplied task
//   func deleteNotification(for task: Task) {
//   
//   }
   
}
