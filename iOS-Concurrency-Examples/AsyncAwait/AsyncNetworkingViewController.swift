//
//  AsyncNetworkingViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 15/03/2026.
//

import Foundation
import UIKit

final class AsyncNetworkingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Async Networking"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {

        print("Button tapped")

        Task {
            print("Fetch User started")

            await fetchUser()

            print("Fetch User finished")
        }

        print("Button action finished")
    }

    func fetchUser() async {

        print("Preparing request")

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/1") else {
            print("Invalid URL")
            return
        }

        do {

            let request = URLRequest(url: url)

            print("Starting network request")

            let (data, response) = try await URLSession.shared.data(for: request)

            print("Network response received")

            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }

            print("Status Code:", httpResponse.statusCode)

            print("Decoding JSON")

            let user = try JSONDecoder().decode(User.self, from: data)

            print("User name:", user.name)

        } catch {
            print("Network error:", error)
        }
    }
}

struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
