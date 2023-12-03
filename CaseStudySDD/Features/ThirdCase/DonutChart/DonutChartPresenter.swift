//
//  DonutChartPresenter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

// MARK: Protocol
protocol DonutChartPresenterOutput: AnyObject {
}

final class DonutChartPresenter: DonutChartInteractorOutput {
  private weak var output: DonutChartPresenterOutput?

  required init(output: DonutChartPresenterOutput) {
    self.output = output
  }
}
