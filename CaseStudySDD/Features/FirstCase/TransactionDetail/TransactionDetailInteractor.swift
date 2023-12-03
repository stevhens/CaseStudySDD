//
//  TransactionDetailInteractor.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import Foundation

// MARK: Protocols
protocol TransactionDetailInteractorInput: AnyObject {
    func confirmPayment(input: Transaction?)
}

protocol TransactionDetailInteractorOutput: AnyObject {
    func presentConfirmPayment(_ input: Transaction?)
    func present(error: String)
}

// MARK: Class
final class TransactionDetailInteractor: TransactionDetailInteractorInput {
  private var output: TransactionDetailInteractorOutput?
  private var worker: TransactionDetailWorkerProtocol?

  required init(output: TransactionDetailInteractorOutput, worker: TransactionDetailWorkerProtocol) {
    self.output = output
    self.worker = worker
  }
    
    func confirmPayment(input: Transaction?) {
        output?.presentConfirmPayment(input)
    }
}
