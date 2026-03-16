//
//  TaskYieldViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 17/03/2026.
//

import Foundation
import UIKit

final class TaskYieldViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task.yield"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {

        Task {
            await runYieldExample()
        }

    }

    // MARK: - Task.yield Example

    func runYieldExample() async {

        print("\n----- TASK YIELD -----")

        await withTaskGroup(of: Void.self) { group in

            for taskNumber in 1...2 {

                group.addTask {

                    for i in 1...5 {

                        print("Task \(taskNumber) iteration \(i) on:", Thread.current)

                        await Task.yield()
                    }

                    print("Task \(taskNumber) finished")
                }

            }

        }

        print("All tasks completed")
    }
}
