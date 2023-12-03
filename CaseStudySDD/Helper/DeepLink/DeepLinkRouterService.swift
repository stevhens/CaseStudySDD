//
//  DeepLinkRouterService.swift
//  CaseStudySDD
//
//  Created by Stevhen on 25/03/22.
//

import UIKit

protocol DeepLinkRouterServiceProtocol: AnyObject {
  /// UIApplication top most view controller.
  var rootViewController: UIViewController? { get }

  /// The navigation controller (if exists) from the UIApplication keyWindow root view controller.
  var rootNavigationController: UINavigationController? { get }

  /// Open page according to deeplink data
  func openPage()
}

final class DeepLinkRouterService: DeepLinkRouterServiceProtocol {
  static let shared = DeepLinkRouterService()

  // MARK: - Variables
  var rootViewController: UIViewController? { return UIApplication.topViewController() }
  var rootNavigationController: UINavigationController? { return rootViewController?.navigationController }

  // MARK: - Methods
  func openPage() {
    guard let deepLinkRouterObject = getDeeplinkObject() else { return }

    /// If the deepLinkRouterObject type is unknown and there's no controller when we build the destination controller, then do nothing
    guard let controller = buildDestinationController(fromObject: deepLinkRouterObject)
    else { return }

    rootViewController?.navigationController?.pushViewController(controller, animated: true)
  }

  private func getDeeplinkObject() -> DeepLinkRouterObject? {
    guard let jsonData = AppData.deeplinkObject.data(using: .utf8) else { return nil }

    AppData.deeplinkObject = ""

    let decoder = JSONDecoder()
    do {
      let deeplinkObj = try decoder.decode(DeepLinkRouterObject.self, from: jsonData)
      return deeplinkObj
    } catch {
      print(error.localizedDescription)
      return nil
    }
  }

  /// Build the destination controller, according to the object's type.
  private func buildDestinationController(fromObject object: DeepLinkRouterObject) -> UIViewController? {
    var controller: UIViewController?
    switch object.type {
    case .fourthcase:
      let value = getTransactionCodeFromDeeplink(object.value)
        if let tabBarController = UIApplication.topViewController()?.tabBarController as? MainViewTabBarController {
            tabBarController.selectedIndex = 3
        }
    
      let transactionDetailVC = TransactionDetailC4ViewController(
        transactionCode: value
      )
      controller = transactionDetailVC

    default: break
    }

    controller?.hidesBottomBarWhenPushed = true
    return controller
  }
    
    private func getTransactionCodeFromDeeplink(_ value: String) -> String {
        var dict = [String: String]()
        let components = URLComponents(url: .init(string: value)!, resolvingAgainstBaseURL: false)!
        if let queryItems = components.queryItems {
            for item in queryItems {
                dict[item.name] = item.value ?? ""
            }
        }
        return dict["transactionCode"] ?? ""
    }
}
