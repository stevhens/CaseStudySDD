//
//  DonutChartConfigurator.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

enum DonutChartConfigurator {
  static func configure(viewController: DonutChartViewController) {
    let router = DonutChartRouter(controller: viewController)

    let presenter = DonutChartPresenter(output: viewController)

    let worker = DonutChartWorker()
    let interactor = DonutChartInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
