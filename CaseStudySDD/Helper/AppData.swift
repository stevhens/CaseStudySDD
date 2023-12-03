//
//  AppData.swift
//  CaseStudySDD
//
//  Created by Stevhen on 01/12/23.
//

import Foundation

enum AppData {
    @Storage(key: "deeplink_object", defaultValue: "")
    static var deeplinkObject: String
    
    @Storage(key: "fcmToken", defaultValue: "")
    static var fcmToken: String
    
    @Storage(key: "transaction_history", defaultValue: TransactionHistory())
    static var transactionHistory: TransactionHistory
    
    @Storage(key: "balance", defaultValue: 700000)
    static var balance: BigInt
    
    
}
