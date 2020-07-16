//
//  AppDelegate.swift
//  Nike Top 100 Albums
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        // Initialize the navigation stack.
        let navigationController = UINavigationController()
        let albumsViewController = AlbumsViewController()
        navigationController.viewControllers = [albumsViewController]
        
        // Initialize the window.
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

