//
// URLRequest+.swift
// Copyright (c) 2022 Additive
//
// Created by Hamed Hosseini on 11/2/22

import Foundation

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case trace = "TRACE"
    case connect = "CONNECT"
}


public extension URLRequest {
    var method: HTTPMethod {
        get {
            return HTTPMethod(rawValue: httpMethod ?? "GET") ?? .get
        }
        set {
            httpMethod = newValue.rawValue
        }
    }
}
