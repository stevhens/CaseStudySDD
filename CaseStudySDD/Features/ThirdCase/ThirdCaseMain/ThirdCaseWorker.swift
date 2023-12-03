//
//  ThirdCaseWorker.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

protocol ThirdCaseWorkerProtocol: AnyObject {
    func getDonutChartData() -> [DonutChart.TransactionData]
    func getLineChartData() -> [Int]
}

final class ThirdCaseWorker: ThirdCaseWorkerProtocol {
    func getDonutChartData() -> [DonutChart.TransactionData] {
        var donutChartData: [DonutChart.TransactionData] = []

        if let url = Bundle.main.url(forResource: "charts-data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(JSON.self, from: data)
                
                jsonData.items.forEach { (item) in
                    switch item {
                    case is DonutChart:
                        donutChartData = (item as? DonutChart)?.data ?? []
                    default: print("❓ | \(item)")
                    }
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return donutChartData
    }
    
    func getLineChartData() -> [Int] {
        var lineChartData: [Int] = []
        
        if let url = Bundle.main.url(forResource: "charts-data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(JSON.self, from: data)
                
                jsonData.items.forEach { (item) in
                    switch item {
                    case is LineChart:
                        lineChartData = (item as? LineChart)?.data.month ?? []
                    default: print("❓ | \(item)")
                    }
                }

            } catch {
                print(error.localizedDescription)
            }
        }
        
        return lineChartData
    }
}
