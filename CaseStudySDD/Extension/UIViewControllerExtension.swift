//
//  UIViewControllerExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

extension UIViewController {
  func setupCustomNavbar(
    showBottomHairline: Bool = true,
    backgroundColor color: String = "slate_0",
    titleColor: String = "slate_999"
  ) {
    let image = UIImage(named: "ic_back")
    let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(backTapped))
    self.navigationItem.backBarButtonItem = nil
    self.navigationItem.setLeftBarButtonItems([backButton], animated: true)
    self.navigationController?.navigationBar.showBottomHairline(showBottomHairline)

    setBackgroundNavbar(self.navigationController, backgroundColor: color, titleColor: titleColor)
  }

  func setupCustomNavbar(
    backButton: UIBarButtonItem,
    showBottomHairline: Bool = false,
    backgroundColor color: String = "slate_0",
    titleColor: String = "slate_999"
  ) {
    let backBtn = backButton
    self.navigationItem.backBarButtonItem = nil
    self.navigationItem.setLeftBarButtonItems([backBtn], animated: true)
    self.navigationController?.navigationBar.showBottomHairline(showBottomHairline)

    setBackgroundNavbar(self.navigationController, backgroundColor: color, titleColor: titleColor)
  }

  @objc private func backTapped() {
    navigationController?.popViewController(animated: true)
  }

  func setBackgroundNavbar(
    _ navController: UINavigationController?,
    backgroundColor: String = "slate_0",
    titleColor: String = "slate_999"
  ) {
    self.navigationController?.navigationBar.prefersLargeTitles = false

    let navigationBarAppearace = UINavigationBar.appearance()
    navigationBarAppearace.backgroundColor = UIColor(named: backgroundColor)

    if #available(iOS 13.0, *) {
      let navBarAppearance = UINavigationBarAppearance()
      navBarAppearance.backgroundColor = UIColor(named: backgroundColor)
      navController?.navigationBar.standardAppearance = navBarAppearance
      navController?.navigationBar.scrollEdgeAppearance = navBarAppearance
      navigationController?.navigationBar.standardAppearance.titleTextAttributes = [
        .foregroundColor: UIColor(named: titleColor) ?? .black
      ]
    } else {
      navController?.navigationBar.barTintColor = UIColor(named: backgroundColor)
      navController?.navigationBar.isTranslucent = false
      navController?.view.backgroundColor = UIColor(named: backgroundColor)
      navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: titleColor) ?? .black]
    }

    navController?.setNavigationBarHidden(false, animated: false)
  }
}
