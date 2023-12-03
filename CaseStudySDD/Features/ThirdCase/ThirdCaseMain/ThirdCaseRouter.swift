//
//  ThirdCaseRouter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

protocol ThirdCaseRoutingDelegate: AnyObject {
    func openDonutChartPage(_ data: [DonutChart.TransactionData])
    func openLineChartPage(_ data: [Int: Int])
}

final class ThirdCaseRouter: NSObject, ThirdCaseRoutingDelegate {
  private weak var parentController: ThirdCaseViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: ThirdCaseViewController) {
    parentController = controller
  }
    
    func openDonutChartPage(_ data: [DonutChart.TransactionData]) {
        let donutChartVC = DonutChartViewController(data)
        donutChartVC.hidesBottomBarWhenPushed = true
        navController?.pushViewController(donutChartVC, animated: true)
    }
    
    func openLineChartPage(_ data: [Int: Int]) {
        let lineChartVC = LineChartViewController(data)
        lineChartVC.hidesBottomBarWhenPushed = true
        navController?.pushViewController(lineChartVC, animated: true)
    }
}
