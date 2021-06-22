//
//  AppDelegate.swift
//  BlackBricksTestTask
//
//  Created by RM on 17.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let controller = VideoLibraryController()
        
        window?.rootViewController = UINavigationController(rootViewController: controller)
        
        return true
    }



}

