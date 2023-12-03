//
//  SplashScreenRouter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 01/07/22.
//

import UIKit

protocol SplashScreenRoutingDelegate: AnyObject {}

final class SplashScreenRouter: NSObject, SplashScreenRoutingDelegate {
  private weak var parentController: SplashScreenViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: SplashScreenViewController) {
    parentController = controller
  }
}
