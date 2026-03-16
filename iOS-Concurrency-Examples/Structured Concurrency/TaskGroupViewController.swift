//
//  TaskGroupViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 16/03/2026.
//

import Foundation
import UIKit

final class TaskGroupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task Group"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {

        Task {
            await runTaskGroupExample()
        }

    }

    // MARK: - TaskGroup Example

    func runTaskGroupExample() async {

        print("\n----- TASK GROUP -----")

        let start = Date()

        let result = await withTaskGroup(of: Int.self) { group -> Int in

            for i in 1...3 {

                group.addTask {

                    print("Task \(i) started on:", Thread.current)

                    await Task.sleep(seconds: Double(i))

                    print("Task \(i) finished")

                    return i * 10
                }

            }

            var total = 0

            for await value in group {
                print("Received result:", value)
                total += value
            }

            return total
        }

        let elapsed = Date().timeIntervalSince(start)

        print("Total result:", result)
        print("Total time:", String(format: "%.2f", elapsed), "seconds")
    }
}
