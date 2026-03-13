//
//  BasicAsyncViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 13/03/2026.
//

import UIKit

class BasicAsyncViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Basic Async Function"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {

        print("Button tapped")

        Task {

            print("Task started")

            let username = await fetchUsername()

            print("Username received:", username)

        }

        Task {
            print("second task")
        }
        
        print("Button action finished")
    }

    func fetchUsername() async -> String {

        print("Fetching username...")

        await Task.sleep(seconds: 2)

        print("Finished fetching")

        return "Zeeshan"
    }
}
