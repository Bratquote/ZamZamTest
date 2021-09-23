//
//  AppDelegate.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 21.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        showMainScreen()
        return true
    }

    func showMainScreen() {
        window?.rootViewController = ClearNavigationController(rootViewController: MainViewController())
    }
}

