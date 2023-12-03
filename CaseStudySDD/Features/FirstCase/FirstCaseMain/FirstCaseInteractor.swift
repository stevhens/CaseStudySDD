//
//  FirstCaseInteractor.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import Foundation

// MARK: Protocols
protocol FirstCaseInteractorInput: AnyObject {
    func processQRScanResult(_ code: String)
}

protocol FirstCaseInteractorOutput: AnyObject {
    func presentSuccess(_ response: String)
    func present(error: String)
}

// MARK: Class
final class FirstCaseInteractor: FirstCaseInteractorInput {
  private var output: FirstCaseInteractorOutput?
  private var worker: FirstCaseWorkerProtocol?

  required init(output: FirstCaseInteractorOutput, worker: FirstCaseWorkerProtocol) {
    self.output = output
    self.worker = worker
  }
    
    func processQRScanResult(_ code: String) {
        output?.presentSuccess(code)
    }
}
