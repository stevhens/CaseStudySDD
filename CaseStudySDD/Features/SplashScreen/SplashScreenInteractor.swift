//
//  SplashScreenInteractor.swift
//  CaseStudySDD
//
//  Created by Stevhen on 01/07/22.
//

// MARK: Protocols
protocol SplashScreenInteractorInput: AnyObject {}

protocol SplashScreenInteractorOutput: AnyObject {}

// MARK: Class
final class SplashScreenInteractor: SplashScreenInteractorInput {
  private var output: SplashScreenInteractorOutput?
  private var worker: SplashScreenWorkerProtocol?

  required init(output: SplashScreenInteractorOutput, worker: SplashScreenWorkerProtocol) {
    self.output = output
    self.worker = worker
  }
}
