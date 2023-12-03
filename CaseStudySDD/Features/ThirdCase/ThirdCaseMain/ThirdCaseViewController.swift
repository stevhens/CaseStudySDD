//
//  ThirdCaseViewController.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

final class ThirdCaseViewController: UIViewController, ThirdCasePresenterOutput {
  // MARK: - Variables
    var input: ThirdCaseInteractorInput?
    var router: ThirdCaseRoutingDelegate?
    
    // MARK: - Initalizer
    init() {
        super.init(nibName: nil, bundle: nil)
        ThirdCaseConfigurator.configure(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ThirdCaseConfigurator.configure(viewController: self)
    }

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Third Case"
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupCustomNavbar(showBottomHairline: true)
  }
  
    // MARK: - IBActions
    @IBAction func didTapDonutChart(_ sender: UIButton) {
        input?.getDonutChartData()
    }
    
    @IBAction func didTapLineChart(_ sender: UIButton) {
        input?.getLineChartData()
    }

  // MARK: - Presenter Output
  func display(error: String) {
      let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
      
      alert.addAction(UIAlertAction(title: "Back", style: .default) {_ in
          self.navigationController?.popViewController(animated: true)
      })
      
      self.present(alert, animated: true, completion: nil)
  }

    func displayDonutChartData(_ data: [DonutChart.TransactionData]) {
        router?.openDonutChartPage(data)
    }
    
    func displayLineChartData(_ data: [Int: Int]) {
        router?.openLineChartPage(data)
    }

}
