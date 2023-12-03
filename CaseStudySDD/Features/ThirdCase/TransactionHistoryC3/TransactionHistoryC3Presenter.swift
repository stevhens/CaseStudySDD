//
//  TransactionHistoryC3Presenter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

// MARK: Protocol
protocol TransactionHistoryC3PresenterOutput: AnyObject {
}

final class TransactionHistoryC3Presenter: TransactionHistoryC3InteractorOutput {
  private weak var output: TransactionHistoryC3PresenterOutput?

  required init(output: TransactionHistoryC3PresenterOutput) {
    self.output = output
  }
}
