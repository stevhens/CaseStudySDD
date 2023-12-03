//
//  TransactionDetailViewController.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

final class TransactionDetailViewController: UIViewController, TransactionDetailPresenterOutput {
    // MARK: - IBOutlets
    @IBOutlet weak var merchantNameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var transactionIDLabel: UILabel!

    // MARK: - Variables
    var input: TransactionDetailInteractorInput?
    var router: TransactionDetailRoutingDelegate?
    private weak var delegate: FirstCaseViewControllerDelegate?
    private var result: Transaction? = nil
    
    // MARK: - Initalizer
    init(result: Transaction, delegate: FirstCaseViewControllerDelegate?) {
        super.init(nibName: nil, bundle: nil)
        self.result = result
        self.delegate = delegate
        TransactionDetailConfigurator.configure(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        TransactionDetailConfigurator.configure(viewController: self)
    }

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Transaction Detail"
    setupView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupCustomNavbar(showBottomHairline: true)
  }
    // MARK: - IBActions
    @IBAction func didTapConfirm(_ sender: UIButton) {
        input?.confirmPayment(input: result)
    }

    @IBAction func didTapBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Presenter Output
    func displayPaymentSuccess() {
        let alert = UIAlertController(title: "Success", message: "Payment Success", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) {_ in
            self.navigationController?.popViewController {
                self.delegate?.refreshPage()
            }
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func display(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Back", style: .default) {_ in
            self.navigationController?.popViewController(animated: true)
        })
        
        if self.presentedViewController == nil {
            self.present(alert, animated: true, completion: nil)
        } else{
            self.presentedViewController!.present(alert, animated: true, completion: nil)
        }
    }

    // MARK: - Methods
    private func setupView() {
        merchantNameLabel.text = result?.merchantName ?? ""
        amountLabel.text = result?.amount ?? ""
        transactionIDLabel.text = result?.transactionID ?? ""
    }
}
