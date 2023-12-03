//
//  TransactionDetailC4Interactor.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import Foundation

// MARK: Protocols
protocol TransactionDetailC4InteractorInput: AnyObject {
}

protocol TransactionDetailC4InteractorOutput: AnyObject {
}

// MARK: Class
final class TransactionDetailC4Interactor: TransactionDetailC4InteractorInput {
  private var output: TransactionDetailC4InteractorOutput?
  private var worker: TransactionDetailC4WorkerProtocol?

  required init(output: TransactionDetailC4InteractorOutput, worker: TransactionDetailC4WorkerProtocol) {
    self.output = output
    self.worker = worker
  }
}
