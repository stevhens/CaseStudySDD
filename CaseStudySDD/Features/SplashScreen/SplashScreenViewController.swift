//
//  SplashScreenViewController.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

final class SplashScreenViewController: UIViewController {
  // MARK: - Variables
  var input: SplashScreenInteractorInput?
  var router: SplashScreenRoutingDelegate?

  // MARK: - Initializers
  required init() {
    super.init(nibName: nil, bundle: nil)
    SplashScreenConfigurator.configure(viewController: self)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    SplashScreenConfigurator.configure(viewController: self)
  }

  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
          self.displayMainPage()
      }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNeedsStatusBarAppearanceUpdate()
  }

  override var preferredStatusBarStyle: UIStatusBarStyle {
    .default
  }

  private func openDashboard() {
    let mainVC = MainViewTabBarController()
    let window = UIApplication.shared.delegate?.window
    window??.rootViewController = mainVC
  }
}

extension SplashScreenViewController: SplashScreenPresenterOutput {
  func displayMainPage() {
    /// you can do check app update and check login token here
    self.openDashboard()
  }
}
