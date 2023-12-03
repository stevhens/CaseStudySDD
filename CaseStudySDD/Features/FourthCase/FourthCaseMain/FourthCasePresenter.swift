//
//  FourthCasePresenter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

// MARK: Protocol
protocol FourthCasePresenterOutput: AnyObject {
}

final class FourthCasePresenter: FourthCaseInteractorOutput {
  private weak var output: FourthCasePresenterOutput?

  required init(output: FourthCasePresenterOutput) {
    self.output = output
  }
}
