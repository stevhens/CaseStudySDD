//
//  SecondCaseViewController.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

final class SecondCaseViewController: UIViewController, SecondCasePresenterOutput {
  // MARK: - Variables
    var input: SecondCaseInteractorInput?
    var router: SecondCaseRoutingDelegate?
    
    // MARK: - Initalizer
    init() {
        super.init(nibName: nil, bundle: nil)
        SecondCaseConfigurator.configure(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        SecondCaseConfigurator.configure(viewController: self)
    }

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Second Case"
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupCustomNavbar(showBottomHairline: true)
  }

  // MARK: - Presenter Output
  func displayError(message: String) {
      let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
      
      alert.addAction(UIAlertAction(title: "Back", style: .default) {_ in
          self.navigationController?.popViewController(animated: true)
      })
      
      self.present(alert, animated: true, completion: nil)
  }

  func displaySuccess(message: String) {
      let alert = UIAlertController(title: "Sukses", message: message, preferredStyle: .alert)
    
      alert.addAction(UIAlertAction(title: "OK", style: .default) {_ in
      self.navigationController?.popViewController(animated: true)
      })

      self.present(alert, animated: true, completion: nil)
  }
}
