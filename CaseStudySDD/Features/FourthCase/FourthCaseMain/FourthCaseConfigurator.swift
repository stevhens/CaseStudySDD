//
//  FourthCaseConfigurator.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

enum FourthCaseConfigurator {
  static func configure(viewController: FourthCaseViewController) {
    let router = FourthCaseRouter(controller: viewController)

    let presenter = FourthCasePresenter(output: viewController)

    let worker = FourthCaseWorker()
    let interactor = FourthCaseInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
