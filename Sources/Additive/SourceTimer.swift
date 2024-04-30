//
// SourceTimer.swift
// Copyright (c) 2022 Additive
//
// Created by Hamed Hosseini on 12/16/22

import Foundation

open class SourceTimer {
    private var timer: DispatchSourceTimer?
    public init(){}
    private let queue = DispatchQueue(label: "SourceTimerSerilaQueue")

    public func start(duration: TimeInterval, completion: @escaping () -> Void) {
        queue.sync {
            startTimer(duration: duration, completion: completion)
        }
    }

    private func startTimer(duration: TimeInterval, completion: @escaping () -> Void) {
        // Create a new DispatchSourceTimer
        timer = DispatchSource.makeTimerSource()

        // Set the timer parameters
        timer?.schedule(deadline: .now() + duration)

        // Set the timer event handler
        timer?.setEventHandler {
            if self.timer?.isCancelled == false {
                completion()
                self.timer?.cancel()
            }
        }

        // Start the timer
        timer?.resume()
    }

    public func cancel() {
        queue.sync {
            // Cancel and release the timer
            timer?.cancel()
            timer = nil
        }
    }
}
