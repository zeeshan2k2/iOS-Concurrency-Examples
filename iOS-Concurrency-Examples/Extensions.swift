//
//  Extensions.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 13/03/2026.
//

import UIKit
import Foundation

extension Task where Success == Never, Failure == Never {

    static func sleep(seconds: Double) async {
        let duration = UInt64(seconds * 1_000_000_000)
        try? await Task.sleep(nanoseconds: duration)
    }

}
