//
//  TransactionHistoryItemCell.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

class TransactionHistoryItemCell: UITableViewCell {
    @IBOutlet weak var merchantName: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    static let size = CGSize(width: UIScreen.getWidth(), height: 80)

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
