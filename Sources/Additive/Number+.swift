//
// Number+.swift
// Copyright (c) 2022 Additive
//
// Created by Hamed Hosseini on 12/16/22

import Foundation

public protocol Arritmatic {}
extension Int: Arritmatic {}
extension UInt: Arritmatic {}
extension Float: Arritmatic {}
extension Double: Arritmatic {
    static let unit: [String] = { ["KB", "MB", "GB", "TB", "PB", "EB"] }()
}

public extension Numeric {
    var toSizeString: String? {
        if let number = self as? NSNumber {
            let value = Double(truncating: number)
            if value < 1000 { return "\(value) B" }
            let exp = Int(log2(value) / log2(1024.0))
            let unit = Double.unit[exp - 1]
            let number = value / pow(1024, Double(exp))
            if #available(iOS 15.0, *) {
                return "\(number.formatted(.number.precision(.fractionLength(1)).locale(.init(identifier: "en_us")))) \(unit)"
            } else {
                return "\(String(format: "%.1f", number)) \(unit)"
            }
        } else {
            return nil
        }
    }
}

public extension UInt {
    var date: Date {
        Date(timeIntervalSince1970: TimeInterval(self) / 1000)
    }
}
