//
//  TransactionHistoryWorker.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

protocol TransactionHistoryWorkerProtocol: AnyObject {
    func getHistoryList() -> [Transaction]
}

final class TransactionHistoryWorker: TransactionHistoryWorkerProtocol {
    func getHistoryList() -> [Transaction] {
        AppData.transactionHistory.data
    }
}
