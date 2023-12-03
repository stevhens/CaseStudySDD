//
//  FirstCaseViewController.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit
import SwiftQRScanner

protocol FirstCaseViewControllerDelegate: AnyObject {
    func refreshPage()
}

final class FirstCaseViewController: UIViewController, FirstCasePresenterOutput {
    // MARK: - IBOutlets
    @IBOutlet weak var balanceTextField: UILabel!
    
  // MARK: - Variables
    var input: FirstCaseInteractorInput?
    var router: FirstCaseRoutingDelegate?
    
    // MARK: - Initalizer
    init() {
        super.init(nibName: nil, bundle: nil)
        FirstCaseConfigurator.configure(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        FirstCaseConfigurator.configure(viewController: self)
    }

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "First Case"
    refreshPage()
      
    NotificationCenter.default.addObserver(self, selector: #selector(openDeepLink), name: .deeplink, object: nil)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupCustomNavbar(showBottomHairline: true)
  }
    
    // MARK: - IBActions
    @IBAction func didTapScanQR(_ sender: UIButton) {
        router?.openQRCamera()
    }
    
    @IBAction func didTapSeeHistory(_ sender: UIButton) {
        router?.openTransactionHistory()
    }
    
    // MARK: - Presenter Output
    func displayQRScanResult(_ result: Transaction) {
        router?.openTransactionDetail(result)
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
    @objc private func openDeepLink(_ notification: NSNotification) {
        if let deepLink = notification.userInfo?["deepLink"] as? Bool, deepLink {
            router?.openDeepLink()
        }
    }
}

extension FirstCaseViewController: QRScannerCodeDelegate {
    func qrScannerDidFail(_ controller: UIViewController, error: QRCodeError) {
        print("error:\(error.localizedDescription)")
    }
    
    func qrScanner(_ controller: UIViewController, scanDidComplete result: String) {
        controller.dismiss(animated: true)
        input?.processQRScanResult(result)
    }
    
    func qrScannerDidCancel(_ controller: UIViewController) {
        print("SwiftQRScanner did cancel")
    }
}

extension FirstCaseViewController: FirstCaseViewControllerDelegate {
    func refreshPage() {
        balanceTextField.text = "Saldo: " + AppData.balance.toRupiahFormat()
    }
}
