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
            
         } else {
            // Non-iOS 10.0 Implementation
         }
      }
      
      
   }
   
   func updateNotification(for task: Task) {
      
   }
   
   func deleteNotification(for task: Task) {
   
   }
   
}
