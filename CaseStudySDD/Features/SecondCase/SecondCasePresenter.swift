//
//  SecondCasePresenter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

// MARK: Protocol
protocol SecondCasePresenterOutput: AnyObject {
  func displayError(message: String)
  func displaySuccess(message: String)
}

final class SecondCasePresenter: SecondCaseInteractorOutput {
  private weak var output: SecondCasePresenterOutput?

  required init(output: SecondCasePresenterOutput) {
    self.output = output
  }

  // MARK: Presentation logic
  func presentError(message: String) {
    output?.displayError(message: message)
  }
}
