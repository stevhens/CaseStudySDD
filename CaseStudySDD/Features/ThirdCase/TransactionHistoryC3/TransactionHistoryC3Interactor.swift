//
//  TransactionHistoryC3Interactor.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import Foundation

// MARK: Protocols
protocol TransactionHistoryC3InteractorInput: AnyObject {
}

protocol TransactionHistoryC3InteractorOutput: AnyObject {
}

// MARK: Class
final class TransactionHistoryC3Interactor: TransactionHistoryC3InteractorInput {
  private var output: TransactionHistoryC3InteractorOutput?
  private var worker: TransactionHistoryC3WorkerProtocol?

  required init(output: TransactionHistoryC3InteractorOutput, worker: TransactionHistoryC3WorkerProtocol) {
    self.output = output
    self.worker = worker
  }
}
