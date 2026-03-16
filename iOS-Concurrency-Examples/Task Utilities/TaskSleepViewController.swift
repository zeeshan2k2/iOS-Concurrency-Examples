//
//  TaskSleepViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 17/03/2026.
//

import Foundation
import UIKit

final class TaskSleepViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task.sleep"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {

        Task {
            await runSleepExample()
        }

    }

    // MARK: - Task.sleep Example

    func runSleepExample() async {

        print("\n----- TASK SLEEP -----")

        let start = Date()

        await withTaskGroup(of: Void.self) { group in

            for i in 1...3 {

                group.addTask {

                    print("Task \(i) started on:", Thread.current)

                    await Task.sleep(seconds: Double(i))

                    print("Task \(i) woke up after \(i) seconds on:", Thread.current)
                }

            }

        }

        let elapsed = Date().timeIntervalSince(start)

        print("All tasks finished")
        print("Total time:", String(format: "%.2f", elapsed), "seconds")
    }
}
