//
//  TransactionHistoryInteractor.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import Foundation

// MARK: Protocols
protocol TransactionHistoryInteractorInput: AnyObject {
    func getHistoryList()
}

protocol TransactionHistoryInteractorOutput: AnyObject {
    func presentHistoryList(_ list: [Transaction]?)
    func present(error: String)
}

// MARK: Class
final class TransactionHistoryInteractor: TransactionHistoryInteractorInput {
  private var output: TransactionHistoryInteractorOutput?
  private var worker: TransactionHistoryWorkerProtocol?

  required init(output: TransactionHistoryInteractorOutput, worker: TransactionHistoryWorkerProtocol) {
    self.output = output
    self.worker = worker
  }
    
    func getHistoryList() {
        let list = worker?.getHistoryList()
        output?.presentHistoryList(list ?? [])
    }
}
