//
//  ThirdCaseEntity.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import Foundation

enum ChartType: String, Decodable {
    case donutChart
    case lineChart
}

final class LineChart: Portofolio {
    let data: MonthData
    private enum CodingKeys: String, CodingKey {
        case data
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(MonthData.self, forKey: .data)
        try super.init(from: decoder)
    }
    override var debugDescription: String {
        return "\(super.debugDescription). data: \(data)"
    }
    
    struct MonthData: Decodable {
        let month: [Int]
    }
}

final class DonutChart: Portofolio {
    let data: [TransactionData]
    private enum CodingKeys: String, CodingKey {
        case data
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([TransactionData].self, forKey: .data)
        try super.init(from: decoder)
    }
    override var debugDescription: String {
        return "\(super.debugDescription). data \(data)"
    }
    
    struct TransactionData: Decodable {
        let label: String
        let percentage: String
        let data: [TransactionDataDetail]
    }
    
    struct TransactionDataDetail: Decodable {
        let trx_date: String
        let nominal: Int
    }
}

class Portofolio: Decodable, CustomDebugStringConvertible {
    let type: String
    private enum CodingKeys: String, CodingKey {
        case type
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
    }
    var debugDescription: String {
        return "Type \(type)"
    }
}

class JSON: Decodable {
    let items: [Portofolio]
    private enum CodingKeys: String, CodingKey {
        case items
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let values = try container.decode([JSONValue].self, forKey: .items)
        items = try values.map { value -> Portofolio in
            guard let data = try value.data()
            else { throw DecodingError.dataCorruptedError(forKey: .items, in: container, debugDescription: "Cannot convert \(value) into Data.") }
            if let lineChart = try? JSONDecoder().decode(LineChart.self, from: data) {
                return lineChart
            } else if let donutChart = try? JSONDecoder().decode(DonutChart.self, from: data) {
                return donutChart
            } else {
                throw DecodingError.dataCorruptedError(forKey: .items, in: container, debugDescription: "Unknown decoder for data: \(String(data: data, encoding: .utf8) ?? "?_?").")
            }
        }
    }
}
