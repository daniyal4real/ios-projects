//
//  AppDelegate.swift
//  chatApp
//
//  Created by Daniyal on 18.02.2021.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
       // let myDB = Database.database().reference()
      //  myDB.setValue("testing firebase realtime db")
        let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
        if accessToken != nil {
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "MainViewController", bundle: Bundle.main)
            let homePage = mainStoryBoard.instantiateViewController(identifier: "ChatViewController") as! ChatViewController
            self.window?.rootViewController = homePage
        }
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

