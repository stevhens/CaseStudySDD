//
//  SplashScreenConfigurator.swift
//  CaseStudySDD
//
//  Created by Stevhen on 01/07/22.
//

enum SplashScreenConfigurator {
  static func configure(viewController: SplashScreenViewController) {
    let router = SplashScreenRouter(controller: viewController)

    let presenter = SplashScreenPresenter(output: viewController)

    let worker = SplashScreenWorker()
    let interactor = SplashScreenInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
