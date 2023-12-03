//
//  TransactionHistoryC3ItemCell.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

class TransactionHistoryC3ItemCell: UITableViewCell {
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    static let size = CGSize(width: UIScreen.getWidth(), height: 54)

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
