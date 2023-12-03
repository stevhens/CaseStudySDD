//
//  PushNotificationManager.swift
//  CaseStudySDD
//
//  Created by Stevhen on 03/12/23.
//

import Firebase
import FirebaseMessaging
import UIKit
import UserNotifications

final class PushNotificationManager: NSObject, MessagingDelegate, UNUserNotificationCenterDelegate {
    let userID: String
    init(userID: String) {
        self.userID = userID
        super.init()
    }
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
        Messaging.messaging().delegate = self
        
        UIApplication.shared.registerForRemoteNotifications()
        updateFirestorePushTokenIfNeeded()
    }
    
    func updateFirestorePushTokenIfNeeded() {
        if let token = Messaging.messaging().fcmToken {
            AppData.fcmToken = token
        }
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        updateFirestorePushTokenIfNeeded()
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        guard let userInfo = response.notification.request.content.userInfo as? [String: Any] else { return }
        let deepLink: String = userInfo["deepLink"] as? String ?? ""
        
        let rawResponse = PushNotificationBodyResponse(
            deepLink: deepLink,
            type: "fourthcase"
        )
        
        let deeplinkObj = transformToDeepLinkRouterObject(fromResponse: rawResponse)
        DeepLinkService.shared.route(to: deeplinkObj.type, value: deeplinkObj.value)
    }
    
    private func transformToDeepLinkRouterObject(fromResponse response: PushNotificationBodyResponse) -> DeepLinkRouterObject {
        let type = DeepLinkRouterObject.RouteType(rawValueIgnoreCase: response.type ?? "")
        var value = ""
        switch type {
        case .fourthcase:
            value = response.deepLink ?? ""
        default: value = ""
        }
        
        return DeepLinkRouterObject(
            type: type ?? DeepLinkRouterObject.RouteType.unknown,
            value: value
        )
    }
}

