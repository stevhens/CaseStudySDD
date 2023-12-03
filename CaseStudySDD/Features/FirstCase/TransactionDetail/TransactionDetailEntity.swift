//
//  TransactionDetailEntity.swift
//  CaseStudySDD
//
//  Created by Stevhen on 01/12/23.
//

import Foundation

struct Transaction: Codable {
    let bankName: String
    let transactionID: String
    let merchantName: String
    let amount: String
    let date: String
}

struct TransactionHistory: Codable {
    var data: [Transaction] = []
}
