//
//  TaskCancellationViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 15/03/2026.
//

import Foundation
import UIKit

final class TaskCancellationViewController: UIViewController {

    private var task: Task<Void, Never>?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Task Cancellation"
        view.backgroundColor = .systemBackground
    }

    @IBAction func startTask(_ sender: UIButton) {

        print("Starting task")

        task = Task {

            for i in 1...10 {

                if Task.isCancelled {
                    print("Task was cancelled")
                    return
                }

                print("Working... step \(i)")

                await Task.sleep(seconds: 1)
            }

            print("Task completed")
        }
    }

    @IBAction func cancelTask(_ sender: UIButton) {

        print("Cancelling task")

        task?.cancel()
    }
}
