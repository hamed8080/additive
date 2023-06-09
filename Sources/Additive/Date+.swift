//
// Date+.swift
// Copyright (c) 2022 Additive
//
// Created by Hamed Hosseini on 11/2/22

import Foundation

public extension Date {
    func getTime(localIdentifire: String = "en_US") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: localIdentifire)
        formatter.timeZone = .init(abbreviation: "GMT")
        return formatter.string(from: self)
    }

    func getDate(localIdentifire: String = "en_US") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: localIdentifire)
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = .init(abbreviation: "GMT")
        return formatter.string(from: self)
    }

    func isBetweeen(date date1: Date, andDate date2: Date) -> Bool {
        date1.compare(self) == compare(date2)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) var timeAgoSinceDateCondense: String? {
        var formatter: Date.FormatStyle.FormatOutput
        if Calendar.current.isDateInToday(self) {
            formatter = formatted(.dateTime.hour().minute())
        } else if Calendar.current.isDate(self, equalTo: .now, toGranularity: .weekOfMonth) {
            formatter = formatted(.dateTime.weekday().hour(.twoDigits(amPM: .omitted)).minute())
        } else if Calendar.current.isDate(self, equalTo: .now, toGranularity: .year) {
            formatter = formatted(.dateTime.month().day().hour(.twoDigits(amPM: .omitted)).minute(.twoDigits))
        } else {
            formatter = formatted(.dateTime.year(.twoDigits).month(.abbreviated).day(.twoDigits))
        }
        return formatter.string?.replacingOccurrences(of: "\"", with: "")
    }

    var millisecondsSince1970: Int64 {
        Int64((timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }

    /// It will make a timer output for a start point in time. `Date().timerString => 00:00:01`
    var timerString: String? {
        let interval = Date().timeIntervalSince1970 - timeIntervalSince1970
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        formatter.unitsStyle = .positional
        return formatter.string(from: interval)
    }
}
