//
//  TransactionDetailC4ViewController.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

final class TransactionDetailC4ViewController: UIViewController, TransactionDetailC4PresenterOutput {
    // MARK: - IBOutlets
    @IBOutlet weak var transactionIDLabel: UILabel!

    // MARK: - Variables
    var input: TransactionDetailC4InteractorInput?
    var router: TransactionDetailC4RoutingDelegate?
    private var transactionCode: String = ""
    
    // MARK: - Initalizer
    init(transactionCode: String) {
        super.init(nibName: nil, bundle: nil)
        self.transactionCode = transactionCode
        TransactionDetailC4Configurator.configure(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        TransactionDetailC4Configurator.configure(viewController: self)
    }

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Transaction Detail"
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

    // MARK: - Methods
    private func setupView() {
        transactionIDLabel.text = transactionCode
    }
}
