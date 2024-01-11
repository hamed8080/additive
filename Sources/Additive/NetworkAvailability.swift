//
// NetworkAvailability.swift
// Copyright (c) 2022 Additive
//
// Created by Hamed Hosseini on 12/16/22

import Foundation
import Network

@available(macOS 10.14, iOS 12.0, watchOS 5.0, tvOS 12.0, *)
open class NetworkAvailability {
    private var lastStatus: NWPath.Status?
    public var onNetworkChange: ((Bool) -> Void)?
    private let path = NWPathMonitor()
    private let queue: DispatchQueueProtocol = DispatchQueue(label: "NetworkObserverQueue")

    public init() {
        path.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            if lastStatus == .unsatisfied && path.status == .satisfied {
                onNetworkChange?(true)
            } else if lastStatus == .satisfied && path.status == .unsatisfied  {
                onNetworkChange?(false)
            }
            lastStatus = path.status
        }
        path.start(queue: queue as! DispatchQueue)
    }
}
