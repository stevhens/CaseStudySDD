//
//  JSONValue.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import Foundation

public enum JSONValue: Decodable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case object([String: JSONValue])
    case array([JSONValue])
    case `nil`
    
    var value: Any? {
        switch self {
        case .string(let value):      return value
        case .int(let value):         return value
        case .double(let value):      return value
        case .bool(let value):        return value
        case .object(let value):      return value.mapValues { $0.value }
        case .array(let value):       return value.map { $0.value }
        case .nil:                    return nil
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(Int.self) {
            self = .int(value)
        } else if let value = try? container.decode(Double.self) {
            self = .double(value)
        } else if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? container.decode([String: JSONValue].self) {
            self = .object(value)
        } else if let value = try? container.decode([JSONValue].self) {
            self = .array(value)
        } else if container.decodeNil() {
            self = .nil
        } else {
            throw DecodingError.typeMismatch(JSONValue.self, DecodingError.Context(codingPath: container.codingPath, debugDescription: "Not a JSON."))
        }
    }
    
    func data() throws -> Data? {
        guard let value = value else { return nil }
        return try JSONSerialization.data(withJSONObject: value, options: [])
    }
}
