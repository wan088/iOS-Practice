//
//  AppDelegate.swift
//  Chapter06
//
//  Created by Yongwan on 08/04/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == "첫 푸쉬"{
            let userInfo = notification.request.content.userInfo["name"]
            print("Hey! \(userInfo)")
        }
        completionHandler([.alert, .badge, .sound])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "첫 푸쉬"{
            let userInfo = response.notification.request.content.userInfo["name"]
            print(userInfo!)
            
        }
        completionHandler()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 10.0, *){
            let unCenter = UNUserNotificationCenter.current()
            unCenter.requestAuthorization(options: [.sound, .badge, .alert], completionHandler: {(didAllow, e) in})
            unCenter.delegate = self
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        UNUserNotificationCenter.current().getNotificationSettings(){settings in
            if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                let uContent = UNMutableNotificationContent()
                uContent.badge = 1;
                uContent.title = "ㅎㅇㅎㅇ"
                uContent.subtitle = "앱을 다시 열어주세요"
                uContent.body = "얘는 몸통"
                uContent.sound = .default
                uContent.userInfo = ["name" : "김용완"]
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let start = UNNotificationRequest(identifier: "첫 푸쉬", content: uContent, trigger: trigger)
                
                UNUserNotificationCenter.current().add(start)
                
            }else{
                print("사용자가 동의하지 않음")
            }
            
        }
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

