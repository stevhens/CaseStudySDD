//
//  TransactionDetailConfigurator.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

enum TransactionDetailConfigurator {
  static func configure(viewController: TransactionDetailViewController) {
    let router = TransactionDetailRouter(controller: viewController)

    let presenter = TransactionDetailPresenter(output: viewController)

    let worker = TransactionDetailWorker()
    let interactor = TransactionDetailInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
