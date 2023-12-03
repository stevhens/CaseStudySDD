//
//  TransactionDetailC4Presenter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

// MARK: Protocol
protocol TransactionDetailC4PresenterOutput: AnyObject {
}

final class TransactionDetailC4Presenter: TransactionDetailC4InteractorOutput {
  private weak var output: TransactionDetailC4PresenterOutput?

  required init(output: TransactionDetailC4PresenterOutput) {
    self.output = output
  }
}
