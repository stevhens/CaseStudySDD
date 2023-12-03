//
//  TransactionHistoryViewController.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

final class TransactionHistoryViewController: UIViewController, TransactionHistoryPresenterOutput {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Variables
    var input: TransactionHistoryInteractorInput?
    var router: TransactionHistoryRoutingDelegate?
    
    private var list: [Transaction] = []
    
    // MARK: - Initalizer
    init() {
        super.init(nibName: nil, bundle: nil)
        TransactionHistoryConfigurator.configure(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        TransactionHistoryConfigurator.configure(viewController: self)
    }

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Transaction History"
    tableView.dataSource = self
    tableView.delegate = self
    tableView.registerCells(withIdentifiers: TransactionHistoryItemCell.className)
    input?.getHistoryList()
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
    
    // MARK: - Presenter Output
    func displayHistory(list: [Transaction]) {
        self.list = list
        tableView.reloadData()
    }

    func display(error: String) {
      let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
      
      alert.addAction(UIAlertAction(title: "Back", style: .default) {_ in
          self.navigationController?.popViewController(animated: true)
      })
      
      self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableView Data Source & Delegate
extension TransactionHistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionHistoryItemCell") as! TransactionHistoryItemCell
        
        let item = list[indexPath.row]
        cell.merchantName.text = item.merchantName
        cell.amountLabel.text = item.amount.toCurrency()
        cell.dateLabel.text = item.date.toDate()?.toString(format: "dd MMMM yyyy HH:mm:ss") ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        TransactionHistoryItemCell.size.height
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
