//
//  LineChartViewController.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit
import SwiftUI

final class LineChartViewController: UIViewController, LineChartPresenterOutput {
  // MARK: - Variables
    var input: LineChartInteractorInput?
    var router: LineChartRoutingDelegate?
    
    private var data: [Int: Int] = [:]
    
    // MARK: - Initalizer
    init(_  data: [Int: Int]) {
        super.init(nibName: nil, bundle: nil)
        self.data = data
        LineChartConfigurator.configure(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        LineChartConfigurator.configure(viewController: self)
    }

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Line Chart"
    setupView()
  }

  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      let image = UIImage(systemName: "chevron.left")
      let backButton = UIBarButtonItem(
        image: image,
        style: .plain,
        target: self,
        action: #selector(didTapBack)
      )
      setupCustomNavbar(backButton: backButton, showBottomHairline: true)
  }
    
    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupView() {
        view.backgroundColor = UIColor(white: 1, alpha: 1)

        let controller = UIHostingController(rootView: LineChartView(data: data))
        guard let lineChartView = controller.view else {
            return
        }
        
        view.addSubview(lineChartView)
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            lineChartView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lineChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            lineChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 4),
            lineChartView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
}
