//
//  DonutChartInteractor.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import Foundation

// MARK: Protocols
protocol DonutChartInteractorInput: AnyObject {}

protocol DonutChartInteractorOutput: AnyObject {}

// MARK: Class
final class DonutChartInteractor: DonutChartInteractorInput {
  private var output: DonutChartInteractorOutput?
  private var worker: DonutChartWorkerProtocol?

  required init(output: DonutChartInteractorOutput, worker: DonutChartWorkerProtocol) {
    self.output = output
    self.worker = worker
  }
}
