//
//  AppDelegate.swift
//  Pastagram
//
//  Created by Noor Ali on 10/26/20.
//

import UIKit
import Parse


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
//    class AppDelegate: UIResponder, UIApplicationDelegate

    var window:  UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let parseConfig = ParseClientConfiguration {
                    $0.applicationId = "fVyNNRzfDJYIZyBi8fU5odzw3KSoyriHsT1WJ0L9" // <- UPDATE
                    $0.clientKey = "zA5w2hz9nW0Zp71UhUDEwO9YXwhUtsfJ1lU1TDnw" // <- UPDATE
                    $0.server = "https://parseapi.back4app.com"
            }
            Parse.initialize(with: parseConfig)
        
        
            
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

