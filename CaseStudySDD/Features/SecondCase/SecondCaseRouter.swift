//
//  SecondCaseRouter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

@objc protocol SecondCaseRoutingDelegate: AnyObject {
}

final class SecondCaseRouter: NSObject, SecondCaseRoutingDelegate {
  private weak var parentController: SecondCaseViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: SecondCaseViewController) {
    parentController = controller
  }
}
