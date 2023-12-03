//
//  StringExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 22/11/21.
//

import UIKit

// swiftlint:disable file_length
extension String {
    // MARK: - Date
    func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        return DateFormatter(format: format, locale: "id_ID").date(from: self)
    }
    
    func toDate(_ format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "id_ID")
        return dateFormatter.date(from: self)
    }
    
    // MARK: - Currency
    var currency: String {
        guard let formattedString = Formatter.withSeparator.string(for: Int(cleanedCurrency)) else { return self }
        return formattedString
    }
    
    var cleanedCurrency: String {
        self.replacingOccurrences(of: ".", with: "")
    }
    
    func toCurrency() -> String? {
        var text = "Rp"
        
        if let int = Int(self) {
            let formattedString = Formatter.withSeparator.string(for: int) ?? ""
            text = "\(text) \(formattedString)"
        } else if let double = Double(self)?.rounded() {
            let formattedString = Formatter.withSeparator.string(for: double) ?? ""
            text = "\(text) \(formattedString)"
        }
        
        return text
    }
}

extension CaseIterable where Self: RawRepresentable, RawValue == String {
    init?(rawValueIgnoreCase: RawValue) {
        guard
            let caseFound = Self.allCases.first(
                where: { $0.rawValue.caseInsensitiveCompare(rawValueIgnoreCase) == .orderedSame }
            )
        else {
            self.init(rawValue: rawValueIgnoreCase)
            return
        }
        
        self = caseFound
    }
}
