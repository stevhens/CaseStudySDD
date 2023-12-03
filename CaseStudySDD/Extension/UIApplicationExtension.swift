//
//  UIApplicationExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 18/11/21.
//

import UIKit

extension UIApplication {
  static func appIdentifier() -> String {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String ?? ""
  }

  static func appVersion() -> String {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
  }

  static func buildNumber() -> Int {
    return Int(Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "0") ?? 0
  }

  final class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    if let nav = base as? UINavigationController {
      return topViewController(base: nav.visibleViewController)
    }

    if let tab = base as? UITabBarController {
      if let selected = tab.selectedViewController {
        return topViewController(base: selected)
      }
    }

    if let presented = base?.presentedViewController {
      return topViewController(base: presented)
    }

    return base
  }

  final class func presentedViewController() -> UIViewController? {
    if var topController = UIApplication.shared.keyWindow?.rootViewController {
      while let presentedViewController = topController.presentedViewController {
        topController = presentedViewController
      }
      return topController
    }
    return nil
  }
}
