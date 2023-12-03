//
//  TransactionHistoryPresenter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

// MARK: Protocol
protocol TransactionHistoryPresenterOutput: AnyObject {
  func display(error: String)
  func displayHistory(list: [Transaction])
}

final class TransactionHistoryPresenter: TransactionHistoryInteractorOutput {
  private weak var output: TransactionHistoryPresenterOutput?

  required init(output: TransactionHistoryPresenterOutput) {
    self.output = output
  }

  
    func presentHistoryList(_ list: [Transaction]?) {
        guard
            let list = list,
            !list.isEmpty
        else {
            output?.display(error: "error retrieving history list")
            return
        }
        output?.displayHistory(list: list)
    }
    
  func present(error: String) {
    output?.display(error: error)
  }
}
