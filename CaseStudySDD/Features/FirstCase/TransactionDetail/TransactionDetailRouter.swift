//
//  TransactionDetailRouter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

@objc protocol TransactionDetailRoutingDelegate: AnyObject {
}

final class TransactionDetailRouter: NSObject, TransactionDetailRoutingDelegate {
  private weak var parentController: TransactionDetailViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: TransactionDetailViewController) {
    parentController = controller
  }
}
