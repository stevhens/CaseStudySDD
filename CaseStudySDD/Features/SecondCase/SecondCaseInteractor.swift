//
//  SecondCaseInteractor.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import Foundation

// MARK: Protocols
protocol SecondCaseInteractorInput: AnyObject {}

protocol SecondCaseInteractorOutput: AnyObject {}

// MARK: Class
final class SecondCaseInteractor: SecondCaseInteractorInput {
  private var output: SecondCaseInteractorOutput?
  private var worker: SecondCaseWorkerProtocol?

  required init(output: SecondCaseInteractorOutput, worker: SecondCaseWorkerProtocol) {
    self.output = output
    self.worker = worker
  }
}
