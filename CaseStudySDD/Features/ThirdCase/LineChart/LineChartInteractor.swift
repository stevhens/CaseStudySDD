//
//  LineChartInteractor.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import Foundation

// MARK: Protocols
protocol LineChartInteractorInput: AnyObject {}

protocol LineChartInteractorOutput: AnyObject {}

// MARK: Class
final class LineChartInteractor: LineChartInteractorInput {
  private var output: LineChartInteractorOutput?
  private var worker: LineChartWorkerProtocol?

  required init(output: LineChartInteractorOutput, worker: LineChartWorkerProtocol) {
    self.output = output
    self.worker = worker
  }
}
