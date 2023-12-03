//
//  LineChartRouter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

protocol LineChartRoutingDelegate: AnyObject {
}

final class LineChartRouter: NSObject, LineChartRoutingDelegate {
  private weak var parentController: LineChartViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: LineChartViewController) {
    parentController = controller
  }
}
