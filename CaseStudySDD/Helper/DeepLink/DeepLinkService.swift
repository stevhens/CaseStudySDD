//
//  DeepLinkService.swift
//  CaseStudySDD
//
//  Created by Stevhen on 25/03/22.
//

import Foundation

final class DeepLinkService: NSObject {
  static let shared = DeepLinkService()

  final func route(to type: DeepLinkRouterObject.RouteType, value: String) {
    let deepLinkObj = DeepLinkRouterObject(type: type, value: value)

    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    do {
      let deeplinkData = try encoder.encode(deepLinkObj)
      if let deeplinkString = String(data: deeplinkData, encoding: .utf8) {
        AppData.deeplinkObject = deeplinkString
        let appInfo = ["deepLink": true]
        NotificationCenter.default.post(name: .deeplink, object: nil, userInfo: appInfo)
      }
    } catch {
      print(error.localizedDescription)
    }
  }
}
