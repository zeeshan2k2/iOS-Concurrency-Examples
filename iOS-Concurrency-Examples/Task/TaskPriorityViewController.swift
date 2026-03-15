//
//  TaskPriorityViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 15/03/2026.
//

import Foundation
import UIKit

actor SerialCounter {
    private(set) var total = 0
    func increment() { total += 1 }
}

final class TaskPriorityViewController: UIViewController {

    private let counter = SerialCounter()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Priority Stress Test"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {
        print("Starting stress test — 3 seconds")

        let deadline = Date().addingTimeInterval(3)

        for i in 1...6 {
            Task(priority: .background) {
                await worker(name: "BG \(i)", deadline: deadline)
            }
        }

        for i in 1...3 {
            Task(priority: .userInitiated) {
                await worker(name: "HIGH \(i)", deadline: deadline)
            }
        }
    }

    func worker(name: String, deadline: Date) async {
        var count = 0

        while Date() < deadline {
            await counter.increment()
            count += 1
        }

        let total = await counter.total
        let pct = String(format: "%.1f", Double(count) / Double(total) * 100)
        print("\(name) — \(count) acquisitions (\(pct)% of total)")
    }
}
