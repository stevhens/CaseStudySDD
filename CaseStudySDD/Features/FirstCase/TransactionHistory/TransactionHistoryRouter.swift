//
//  TransactionHistoryRouter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

@objc protocol TransactionHistoryRoutingDelegate: AnyObject {
}

final class TransactionHistoryRouter: NSObject, TransactionHistoryRoutingDelegate {
  private weak var parentController: TransactionHistoryViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: TransactionHistoryViewController) {
    parentController = controller
  }
}
