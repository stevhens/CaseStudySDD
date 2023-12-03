//
//  TransactionHistoryConfigurator.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

enum TransactionHistoryConfigurator {
  static func configure(viewController: TransactionHistoryViewController) {
    let router = TransactionHistoryRouter(controller: viewController)

    let presenter = TransactionHistoryPresenter(output: viewController)

    let worker = TransactionHistoryWorker()
    let interactor = TransactionHistoryInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
