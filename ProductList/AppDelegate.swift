//
//  AppDelegate.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.startMainFlow()
        return true
    }
}

private extension AppDelegate {
    func startMainFlow() {
        let navigationController = UINavigationController()
        let mainRouter = MainRouter(navigationController: navigationController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        mainRouter.startFlow()
    }
}


