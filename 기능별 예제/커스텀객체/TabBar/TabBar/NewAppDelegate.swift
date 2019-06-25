//
//  NewAppDelegate.swift
//  TabBar
//
//  Created by Yongwan on 05/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit


@UIApplicationMain
class NewAppDelegate: UIResponder, UIApplicationDelegate{
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        var tbc = UITabBarController()
        tbc.view.backgroundColor = UIColor.white
        window?.rootViewController = tbc
        
        var vc1 = ViewController()
        var vc2 = SecondViewController()
        var vc3 = ThirdViewController()
        
        tbc.setViewControllers([vc1, vc2, vc3], animated: true)
        
        vc1.tabBarItem = UITabBarItem(title: "캘린더", image: UIImage(named: "calendar.png"), selectedImage: nil)
        vc2.tabBarItem = UITabBarItem(title: "페이스북", image: UIImage(named: "photo.png"), selectedImage: nil)
        vc3.tabBarItem = UITabBarItem(title: "구글", image: UIImage(named: "file-tree.png"), selectedImage: nil)
        
        
        
        return true;
        
    }
    
}
