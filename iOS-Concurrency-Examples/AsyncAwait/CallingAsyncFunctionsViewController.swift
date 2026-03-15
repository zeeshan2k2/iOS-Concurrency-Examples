//
//  CallingAsyncFunctionsViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 13/03/2026.
//

import Foundation
import UIKit

final class CallingAsyncFunctionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Calling Async Functions"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {

        print("Button tapped")

        Task {

            print("Task started")

            await loadUser()

            print("Task finished")

        }

        print("Button action finished")
    }

    func loadUser() async {

        print("Loading user...")

        let username = await fetchUsername()

        print("Username received:", username)
    }

    func fetchUsername() async -> String {

        print("Fetching username...")

        await Task.sleep(seconds: 2)

        print("Finished fetching")

        return "Zeeshan"
    }
}
