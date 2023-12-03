//
//  PrimitiveExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 05/02/22.
//

import Foundation

public typealias BigInt = Int64

extension Int {
    func toRupiahFormat() -> String {
        let formattedString = Formatter.withSeparator.string(for: self) ?? ""
        return "Rp \(formattedString)"
    }
}

extension BigInt {
    func toRupiahFormat() -> String {
        let formattedString = Formatter.withSeparator.string(for: self) ?? ""
        return "Rp \(formattedString)"
    }
    
    func toCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "ind")
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        formatter.currencySymbol = "Rp "
        
        if let formattedTipAmount = formatter.string(from: self as NSNumber) {
            return "Rp \(formattedTipAmount)"
        } else {
            return ""
        }
    }
}

extension Double {
    func toDecimal(trailing: Int = 1) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = trailing
        guard let string = formatter.string(from: NSNumber(value: self)) else { return "\(self)" }
        return string
    }
    
    /// Rounds the double to decimal places value
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Dictionary {
    public init(keys: [Key], values: [Value]) {
        precondition(keys.count == values.count)
        
        self.init()
        
        for (index, key) in keys.enumerated() {
            self[key] = values[index]
        }
    }
}
