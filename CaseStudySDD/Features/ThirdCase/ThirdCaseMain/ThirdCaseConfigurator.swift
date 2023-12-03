//
//  ThirdCaseConfigurator.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

enum ThirdCaseConfigurator {
  static func configure(viewController: ThirdCaseViewController) {
    let router = ThirdCaseRouter(controller: viewController)

    let presenter = ThirdCasePresenter(output: viewController)

    let worker = ThirdCaseWorker()
    let interactor = ThirdCaseInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
