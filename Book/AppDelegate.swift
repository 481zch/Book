//
//  AppDelegate.swift
//  Book
//
//  Created by zangconghui on 2025/8/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = Ch11VC()
        window?.makeKeyAndVisible()
        return true
    }

}
