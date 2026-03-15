//
//  MainActorUIUpdateViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 16/03/2026.
//

import Foundation
import UIKit

final class MainActorUIUpdateViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Updating UI Safely"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {

        Task.detached {

            print("Task started on:", Thread.current)

            let result = await self.fetchData()

            await MainActor.run {
                print("Updating UI on:", Thread.current)
                self.label.text = result
            }

        }

    }

    func fetchData() async -> String {

        print("Fetching data on:", Thread.current)

        await Task.sleep(seconds: 2)

        print("Finished fetching on:", Thread.current)

        return "Data Loaded"
    }
}
