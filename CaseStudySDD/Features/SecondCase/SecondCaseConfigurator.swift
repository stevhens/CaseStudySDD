//
//  SecondCaseConfigurator.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

enum SecondCaseConfigurator {
  static func configure(viewController: SecondCaseViewController) {
    let router = SecondCaseRouter(controller: viewController)

    let presenter = SecondCasePresenter(output: viewController)

    let worker = SecondCaseWorker()
    let interactor = SecondCaseInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
