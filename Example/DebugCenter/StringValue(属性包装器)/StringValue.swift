//
//  StringValue.swift
//  EternalEastBus
//
//  Created by fenghanxu on 2026/7/30.
//

@propertyWrapper
struct StringValue: Codable {

    var wrappedValue: String?

    init(wrappedValue: String?) {
        self.wrappedValue = wrappedValue
    }

    init() {
        self.wrappedValue = nil
    }


    init(from decoder: Decoder) throws {

        let container = try decoder.singleValueContainer()

        if container.decodeNil() {
            wrappedValue = nil
        }
        else if let value = try? container.decode(String.self) {
            wrappedValue = value
        }
        else if let value = try? container.decode(Int.self) {
            wrappedValue = String(value)
        }
        else if let value = try? container.decode(Double.self) {
            wrappedValue = String(value)
        }
        else {
            wrappedValue = nil
        }
    }


    func encode(to encoder: Encoder) throws {

        var container = encoder.singleValueContainer()

        try container.encode(wrappedValue)
    }
}
