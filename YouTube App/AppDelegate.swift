//
//  AppDelegate.swift
//  YouTube App
//
//  Created by Алексей Пархоменко on 22/12/2018.
//  Copyright © 2018 Алексей Пархоменко. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let collectionVC = YouTubeCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: collectionVC)
        window?.rootViewController = navigationController
        
        CustomizingTheAppearanceOfaNavigationBar(application)
        HighlightStatusBar()
        return true
    }

    fileprivate func CustomizingTheAppearanceOfaNavigationBar(_ application: UIApplication) {
        // Customizing the appearance of a Navigation Bar
        UINavigationBar.appearance().barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default) // useless
        application.statusBarStyle = .lightContent
    }
    
    fileprivate func HighlightStatusBar() {
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31)
        statusBarBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        window?.addSubview(statusBarBackgroundView)
        
        statusBarBackgroundView.leadingAnchor.constraint(equalTo: (window?.leadingAnchor)!).isActive = true
        statusBarBackgroundView.trailingAnchor.constraint(equalTo: (window?.trailingAnchor)!).isActive = true
        statusBarBackgroundView.topAnchor.constraint(equalTo: (window?.topAnchor)!).isActive = true
        // (equalToConstant: 20) don't work at iPhone 10 +
        statusBarBackgroundView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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

