//
//  ViewController.swift
//  NewNotifications
//
//  Created by Konstantine Piterman on 6/14/17.
//  Copyright © 2017 Konstantine Piterman. All rights reserved.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //1. request permission
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {(granted, error) in
            
            if granted {
                print("notification access granted")
            } else {
                print(error?.localizedDescription as Any)
            }
        })
        }
    
    
    
    @IBAction func notifyButtonTapped(sender: UIButton) {
    
        
        scheduleNotification(inSeconds: 5, completion: { success in
            if success {
                print ("Successfully scheduled notification")
                
            } else {
                print("Error scheduling notification")
            }
            })
        
   
    }
    
    func scheduleNotification(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        
        let notif = UNMutableNotificationContent()
        
        notif.title = "New Notification"
        notif.subtitle = "These are great!"
        notif.body = "The new notification options in iOS 10 are what I've always dreamed of!"
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
            print(error ?? "")
            completion(false)
            
            } else {
                completion(true)
            }
            })
        
    }
    
}

