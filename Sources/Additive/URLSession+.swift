//
// URLSession+.swift
// Copyright (c) 2022 Additive
//
// Created by Hamed Hosseini on 12/16/22

import Foundation

public protocol URLSessionProtocol {
    typealias CompletionType = (Data?, URLResponse?, Error?) -> Void
    func dataTask(_ request: URLRequest, completionHandler: @escaping CompletionType) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    public func dataTask(_ request: URLRequest, completionHandler: @escaping CompletionType) -> URLSessionDataTaskProtocol {
        dataTask(with: request, completionHandler: completionHandler)
    }
}
