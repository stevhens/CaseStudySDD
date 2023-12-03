//
//  ThirdCaseInteractor.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import Foundation

// MARK: Protocols
protocol ThirdCaseInteractorInput: AnyObject {
    func getDonutChartData()
    func getLineChartData()
}

protocol ThirdCaseInteractorOutput: AnyObject {
    func presentDonutChartData(_ response: [DonutChart.TransactionData]?)
    func presentLineChartData(_ response: [Int]?)
}

// MARK: Class
final class ThirdCaseInteractor: ThirdCaseInteractorInput {
  private var output: ThirdCaseInteractorOutput?
  private var worker: ThirdCaseWorkerProtocol?

  required init(output: ThirdCaseInteractorOutput, worker: ThirdCaseWorkerProtocol) {
    self.output = output
    self.worker = worker
  }
    
    func getDonutChartData() {
        let data = worker?.getDonutChartData()
        output?.presentDonutChartData(data)
    }
    
    func getLineChartData() {
        let data = worker?.getLineChartData()
        output?.presentLineChartData(data)
    }
}
