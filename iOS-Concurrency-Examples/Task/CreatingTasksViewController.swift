//
//  CreatingTasksViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 15/03/2026.
//

import Foundation
import UIKit

final class CreatingTasksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Creating Tasks"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {

        print("Button tapped")

        Task {
            print("Task 1 started")

            await performWork(name: "Task 1")

            print("Task 1 finished")
        }

        Task {
            print("Task 2 started")

            await performWork(name: "Task 2")

            print("Task 2 finished")
        }

        print("Button action finished")
    }

    func performWork(name: String) async {

        print("\(name) performing work")

        await Task.sleep(seconds: 2)

        print("\(name) work complete")
    }
}
