//
//  ThirdCasePresenter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

// MARK: Protocol
protocol ThirdCasePresenterOutput: AnyObject {
  func display(error: String)
    func displayDonutChartData(_ data: [DonutChart.TransactionData])
    func displayLineChartData(_ data: [Int: Int])
}

final class ThirdCasePresenter: ThirdCaseInteractorOutput {
  private weak var output: ThirdCasePresenterOutput?

  required init(output: ThirdCasePresenterOutput) {
    self.output = output
  }

  // MARK: Presentation logic
  func present(error: String) {
    output?.display(error: error)
  }
    
    func presentDonutChartData(_ response: [DonutChart.TransactionData]?) {
        guard let data = response, !data.isEmpty else {
            output?.display(error: "error retrieving donut chart data")
            return
        }
        
        output?.displayDonutChartData(data)
    }
    
    func presentLineChartData(_ response: [Int]?) {
        guard let data = response, !data.isEmpty else {
            output?.display(error: "error retrieving line chart data")
            return
        }
        
        let months = Array(1...12)
        let monthValue = data
        let dict = Dictionary(keys: months, values: monthValue)
        output?.displayLineChartData(dict)
    }
}
