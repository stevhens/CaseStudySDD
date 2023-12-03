//
//  LineChartPresenter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

// MARK: Protocol
protocol LineChartPresenterOutput: AnyObject {}

final class LineChartPresenter: LineChartInteractorOutput {
  private weak var output: LineChartPresenterOutput?

  required init(output: LineChartPresenterOutput) {
    self.output = output
  }
}
