//
//  UITableViewExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 13/12/21.
//

import UIKit

extension UITableView {
  func registerCells(withIdentifiers cellIdentifiers: String...) {
    cellIdentifiers.forEach { identifier in
      self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
  }

  func initializeCell<T>(as cellType: T, at indexPath: IndexPath) -> T {
    guard let cell = cellType as? UITableViewCell,
      let reuseCell = self.dequeueReusableCell(
        withIdentifier: cell.className,
        for: indexPath
      ) as? T else { return cellType }
    return reuseCell
  }


  func setEmptyMessage(_ message: String) {
    let view = UIView(
      frame: CGRect(
        x: 0,
        y: 0,
        width: self.bounds.size.width,
        height: self.bounds.size.height
      )
    )

    let messageLabel = UILabel(
      frame: CGRect(
        x: 0,
        y: 0,
        width: self.bounds.size.width,
        height: 40.0
      )
    )
    messageLabel.text = message
    messageLabel.textColor = .text_ink
    messageLabel.numberOfLines = 0
    messageLabel.textAlignment = .center
    messageLabel.font = UIFont.systemFont(ofSize: 15.0)
    messageLabel.sizeToFit()
    messageLabel.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(messageLabel)

    NSLayoutConstraint.activate([
      messageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24.0),
      messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    ])

    backgroundView = view
    separatorStyle = .none
    backgroundColor = .slate_50
  }

  func restore() {
    backgroundView = nil
    separatorStyle = .singleLine
    backgroundColor = .slate_0
  }
}
