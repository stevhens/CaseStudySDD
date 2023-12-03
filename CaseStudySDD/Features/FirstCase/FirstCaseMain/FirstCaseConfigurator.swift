//
//  FirstCaseConfigurator.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

enum FirstCaseConfigurator {
  static func configure(viewController: FirstCaseViewController) {
    let router = FirstCaseRouter(controller: viewController)

    let presenter = FirstCasePresenter(output: viewController)

    let worker = FirstCaseWorker()
    let interactor = FirstCaseInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
