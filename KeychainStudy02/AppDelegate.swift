//
//  AppDelegate.swift
//  KeychainStudy02
//
//  Created by Dio Brand on 2022/7/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        let mainVC = MainViewController.init()
        let nav = UINavigationController.init(rootViewController: mainVC)
        
        self.window?.rootViewController = nav
        
        return true
    }

}

