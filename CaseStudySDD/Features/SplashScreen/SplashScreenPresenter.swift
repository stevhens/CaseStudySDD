//
//  SplashScreenPresenter.swift
//  CaseStudySDD
//
//  Created by Stevhen on 01/07/22.
//

// MARK: Protocol
protocol SplashScreenPresenterOutput: AnyObject {
  func displayMainPage()
}

// MARK: Class
final class SplashScreenPresenter: SplashScreenInteractorOutput {
  private weak var output: SplashScreenPresenterOutput?

  required init(output: SplashScreenPresenterOutput) {
    self.output = output
  }

  func present(error: String) {
      output?.displayMainPage()
  }
}
