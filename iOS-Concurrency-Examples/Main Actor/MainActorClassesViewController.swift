//
//  MainActorClassesViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 16/03/2026.
//

import UIKit

@MainActor
final class MainActorClassesViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MainActor Classes"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {

        Task.detached {

            print("Detached task started on:", Thread.current)

            let result = await self.fetchData()

            await self.updateUI(text: result)

        }

    }

    // This method is nonisolated so it can run on a background executor
    nonisolated func fetchData() async -> String {

        print("Fetching data on:", Thread.current)

        try? await Task.sleep(nanoseconds: 2_000_000_000)

        print("Finished fetching on:", Thread.current)

        return "Data Loaded"
    }

    // This method is isolated to MainActor (because the class is @MainActor)
    func updateUI(text: String) {

        print("Updating UI on:", Thread.current)

        label.text = text
    }
}
