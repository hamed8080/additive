//
// URLSession+.swift
// Copyright (c) 2022 Additive
//
// Created by Hamed Hosseini on 12/16/22

import Foundation
protocol URLSessionProtocol {
    func dataTask(_ request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {
    func dataTask(_ request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTask(with: request, completionHandler: completionHandler)
    }
}
