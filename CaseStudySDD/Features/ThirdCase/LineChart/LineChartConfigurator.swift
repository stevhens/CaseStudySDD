//
//  LineChartConfigurator.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

enum LineChartConfigurator {
  static func configure(viewController: LineChartViewController) {
    let router = LineChartRouter(controller: viewController)

    let presenter = LineChartPresenter(output: viewController)

    let worker = LineChartWorker()
    let interactor = LineChartInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
