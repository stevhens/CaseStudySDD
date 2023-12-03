//
//  TransactionHistoryC3ViewController.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

final class TransactionHistoryC3ViewController: UIViewController, TransactionHistoryC3PresenterOutput {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Variables
    var input: TransactionHistoryC3InteractorInput?
    var router: TransactionHistoryC3RoutingDelegate?
    
    private var trxTitle = ""
    private var list: [DonutChart.TransactionDataDetail] = []
    
    // MARK: - Initalizer
    init(trxTitle: String, list: [DonutChart.TransactionDataDetail]) {
        super.init(nibName: nil, bundle: nil)
        self.trxTitle = trxTitle
        self.list = list
        TransactionHistoryC3Configurator.configure(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        TransactionHistoryC3Configurator.configure(viewController: self)
    }

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Transaction History"
    tableView.dataSource = self
    tableView.delegate = self
    tableView.registerCells(withIdentifiers: TransactionHistoryC3ItemCell.className)
    tableView.reloadData()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
      let image = UIImage(systemName: "chevron.left")
      let backButton = UIBarButtonItem(
        image: image,
        style: .plain,
        target: self,
        action: #selector(didTapBack)
      )
      setupCustomNavbar(backButton: backButton, showBottomHairline: true)
  }
    
    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableView Data Source & Delegate
extension TransactionHistoryC3ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionHistoryC3ItemCell") as! TransactionHistoryC3ItemCell
        
        let item = list[indexPath.row]
        cell.amountLabel.text = trxTitle + " - " + item.nominal.toRupiahFormat()
        cell.dateLabel.text = item.trx_date.toDate(format: "dd/mm/yyyy")?.toString(format: "dd MMMM yyyy") ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        TransactionHistoryC3ItemCell.size.height
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
