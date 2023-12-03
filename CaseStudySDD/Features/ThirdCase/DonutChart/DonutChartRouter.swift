//
//  DonutChartRouter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

protocol DonutChartRoutingDelegate: AnyObject {
    func openTransactionHistoryPage(trxTitle: String, list: [DonutChart.TransactionDataDetail])
}

final class DonutChartRouter: NSObject, DonutChartRoutingDelegate {
  private weak var parentController: DonutChartViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: DonutChartViewController) {
    parentController = controller
  }
    
    func openTransactionHistoryPage(trxTitle: String, list: [DonutChart.TransactionDataDetail]) {
        let transactionHistoryVC = TransactionHistoryC3ViewController(
            trxTitle: trxTitle, list: list
        )
        transactionHistoryVC.hidesBottomBarWhenPushed = true
        navController?.pushViewController(transactionHistoryVC, animated: true)
    }
    
}
