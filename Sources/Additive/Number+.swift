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

    var timerString: String? {
        guard let seconds = self as? NSNumber else { return nil }
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = Int(truncating: seconds) > 60 * 60 ? [.hour, .minute, .second] : [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(Int(truncating: seconds)))
    }
}

public extension UInt {
    var date: Date {
        Date(timeIntervalSince1970: TimeInterval(self) / 1000)
    }
}

@propertyWrapper
struct Constraint<Value: Comparable> {
    private var value: Value
    private var range: ClosedRange<Value>

    public var wrappedValue: Value {
        get {
            max(min(value, range.upperBound), range.lowerBound)
        }
        set {
            value = newValue
        }
    }

    public init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        value = wrappedValue
        self.range = range
    }
}
