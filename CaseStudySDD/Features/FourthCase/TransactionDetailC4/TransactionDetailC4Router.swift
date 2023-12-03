//
//  TransactionDetailC4Router.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

protocol TransactionDetailC4RoutingDelegate: AnyObject {
}

final class TransactionDetailC4Router: NSObject, TransactionDetailC4RoutingDelegate {
  private weak var parentController: TransactionDetailC4ViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: TransactionDetailC4ViewController) {
    parentController = controller
  }
}
