//
//  FirstCasePresenter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

// MARK: Protocol
protocol FirstCasePresenterOutput: AnyObject {
    func display(error: String)
    func displayQRScanResult(_ result: Transaction)
}

final class FirstCasePresenter: FirstCaseInteractorOutput {
  private weak var output: FirstCasePresenterOutput?

  required init(output: FirstCasePresenterOutput) {
    self.output = output
  }
    
    func presentSuccess(_ response: String) {
        guard let result = processQRScanStr(response) else {
            output?.display(error: "Error processing QR")
            return
        }
        
        output?.displayQRScanResult(result)
    }
    
    private func processQRScanStr(_ code: String) -> Transaction? {
        let results = code.components(separatedBy: ".")
        guard
            let bankName = results[safe: 0],
            let transactionID = results[safe: 1],
            let merchantName = results[safe: 2],
            let amount = results[safe: 3]
        else {
            return nil
        }
        
        return Transaction(
            bankName: bankName,
            transactionID: transactionID,
            merchantName: merchantName,
            amount: amount,
            date: Date().toString())
    }
    
    func present(error: String) {
        output?.display(error: error)
    }
}
