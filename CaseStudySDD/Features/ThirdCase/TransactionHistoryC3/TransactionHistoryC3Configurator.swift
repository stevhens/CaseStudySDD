//
//  TransactionHistoryC3Configurator.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

enum TransactionHistoryC3Configurator {
  static func configure(viewController: TransactionHistoryC3ViewController) {
    let router = TransactionHistoryC3Router(controller: viewController)

    let presenter = TransactionHistoryC3Presenter(output: viewController)

    let worker = TransactionHistoryC3Worker()
    let interactor = TransactionHistoryC3Interactor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
