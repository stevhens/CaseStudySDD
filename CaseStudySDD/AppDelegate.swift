//
//  AppDelegate.swift
//  CaseStudySDD
//
//  Created by Stevhen on 01/12/23.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupView()
        setupNotification()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = SplashScreenViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
    
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    // MARK: - UIKit Configurations
    private func setupNotification() {
        let pushManager = PushNotificationManager(userID: "guest")
        pushManager.registerForPushNotifications()
        FirebaseApp.configure()
    }
    
    private func setupView() {
        if #available(iOS 15.0, *) {
            window?.overrideUserInterfaceStyle = .light
            UITableView.appearance().sectionHeaderTopPadding = 0.0
        }
    }
}
