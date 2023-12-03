//
//  TransactionDetailC4Configurator.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

enum TransactionDetailC4Configurator {
  static func configure(viewController: TransactionDetailC4ViewController) {
    let router = TransactionDetailC4Router(controller: viewController)

    let presenter = TransactionDetailC4Presenter(output: viewController)

    let worker = TransactionDetailC4Worker()
    let interactor = TransactionDetailC4Interactor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
