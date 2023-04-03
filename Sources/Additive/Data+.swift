//
// Data+.swift
// Copyright (c) 2022 Additive
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation

public extension Data {
    /// A converter extension that converts data to string with UTF-8.
    var utf8String: String? {
        String(data: self, encoding: .utf8)
    }
}
