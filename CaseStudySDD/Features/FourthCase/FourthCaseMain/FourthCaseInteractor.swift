//
//  FourthCaseInteractor.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import Foundation

// MARK: Protocols
protocol FourthCaseInteractorInput: AnyObject {}

protocol FourthCaseInteractorOutput: AnyObject {}

// MARK: Class
final class FourthCaseInteractor: FourthCaseInteractorInput {
  private var output: FourthCaseInteractorOutput?
  private var worker: FourthCaseWorkerProtocol?

  required init(output: FourthCaseInteractorOutput, worker: FourthCaseWorkerProtocol) {
    self.output = output
    self.worker = worker
  }
}
