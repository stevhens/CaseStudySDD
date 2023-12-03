//
//  TransactionHistoryC3Router.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

protocol TransactionHistoryC3RoutingDelegate: AnyObject {
}

final class TransactionHistoryC3Router: NSObject, TransactionHistoryC3RoutingDelegate {
  private weak var parentController: TransactionHistoryC3ViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: TransactionHistoryC3ViewController) {
    parentController = controller
  }
}
