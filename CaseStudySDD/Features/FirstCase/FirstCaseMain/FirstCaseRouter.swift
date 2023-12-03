//
//  FirstCaseRouter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit
import SwiftQRScanner

protocol FirstCaseRoutingDelegate: AnyObject {
    func openQRCamera()
    func openTransactionDetail(_ result: Transaction)
    func openTransactionHistory()
    func openDeepLink()
}

final class FirstCaseRouter: NSObject, FirstCaseRoutingDelegate {
  private weak var parentController: FirstCaseViewController?
  private var navController: UINavigationController? { parentController?.navigationController }
    
    private var qrConfiguration = QRScannerConfiguration()

  required init(controller: FirstCaseViewController) {
    super.init()
    parentController = controller
    setupQRCamera()
  }
    
    func openTransactionDetail(_ result: Transaction) {
        let transactionDetailVC = TransactionDetailViewController(
            result: result,
            delegate: parentController)
        transactionDetailVC.hidesBottomBarWhenPushed = true
        navController?.pushViewController(transactionDetailVC, animated: true)
    }
    
    func openTransactionHistory() {
        let transactionHistoryVC = TransactionHistoryViewController()
        transactionHistoryVC.hidesBottomBarWhenPushed = true
        navController?.pushViewController(transactionHistoryVC, animated: true)
    }
    
    func openQRCamera() {
        let scanner = QRCodeScannerController(qrScannerConfiguration: qrConfiguration)
        scanner.delegate = parentController
        parentController?.present(scanner, animated: true, completion: nil)
    }
    
    private func setupQRCamera() {
        qrConfiguration.cameraImage = UIImage(systemName: "camera.fill")
        qrConfiguration.flashOnImage = UIImage(systemName: "bolt.fill")
        qrConfiguration.galleryImage = UIImage(systemName: "photo.fill")
    }
    
    func openDeepLink() {
        DeepLinkRouterService.shared.openPage()
    }
}
