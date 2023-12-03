//
//  FourthCaseRouter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

@objc protocol FourthCaseRoutingDelegate: AnyObject {
}

final class FourthCaseRouter: NSObject, FourthCaseRoutingDelegate {
  private weak var parentController: FourthCaseViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: FourthCaseViewController) {
    parentController = controller
  }
}
