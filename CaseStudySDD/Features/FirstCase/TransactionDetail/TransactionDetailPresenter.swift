//
//  TransactionDetailPresenter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

// MARK: Protocol
protocol TransactionDetailPresenterOutput: AnyObject {
    func displayPaymentSuccess()
    func display(error: String)
}

final class TransactionDetailPresenter: TransactionDetailInteractorOutput {
  private weak var output: TransactionDetailPresenterOutput?

  required init(output: TransactionDetailPresenterOutput) {
    self.output = output
  }
    
    func presentConfirmPayment(_ input: Transaction?) {
        guard let input = input else {
            return
        }
        
        AppData.balance -= BigInt(input.amount) ?? 0
        AppData.transactionHistory.data.append(input)
        
        output?.displayPaymentSuccess()
    }
    
    func present(error: String) {
        output?.display(error: "error on payment confirmation")
    }
}
