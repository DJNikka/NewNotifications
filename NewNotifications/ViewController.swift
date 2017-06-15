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
   
    }
    
    func scheduleNotification(inSeconds: TimeInterval, completion: (_ Success: Bool) -> ()) {
        
    }
    
}

