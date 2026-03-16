//
//  AsyncLetViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 16/03/2026.
//

import Foundation
import UIKit

final class AsyncLetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Async Let"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {

        Task {
            await runSerialExample()
            await runAsyncLetExample()
            await runImplicitAwaitExample()
        }

    }

    // MARK: - Serial Example (No Concurrency)

    func runSerialExample() async {

        print("\n----- SERIAL EXECUTION -----")

        let start = Date()

        let a = await fetchA()
        let b = await fetchB()

        let elapsed = Date().timeIntervalSince(start)

        print("Results:", a, b)
        print("Total time:", String(format: "%.2f", elapsed), "seconds")
    }

    // MARK: - Async Let Example (Parallel Child Tasks)

    func runAsyncLetExample() async {

        print("\n----- ASYNC LET PARALLEL -----")

        let start = Date()

        async let a = fetchA()
        async let b = fetchB()

        let resultA = await a
        let resultB = await b

        let elapsed = Date().timeIntervalSince(start)

        print("Results:", resultA, resultB)
        print("Total time:", String(format: "%.2f", elapsed), "seconds")
    }

    // MARK: - Implicit Await Example

    func runImplicitAwaitExample() async {

        print("\n----- IMPLICIT AWAIT -----")

        let start = Date()

        async let a = fetchA()
        async let b = fetchB()

        let sum = await (a + b)

        let elapsed = Date().timeIntervalSince(start)

        print("Sum:", sum)
        print("Total time:", String(format: "%.2f", elapsed), "seconds")
    }

    // MARK: - Simulated Async Work

    func fetchA() async -> Int {

        print("A started on:", Thread.current)

        await Task.sleep(seconds: 2)

        print("A finished")

        return 10
    }

    func fetchB() async -> Int {

        print("B started on:", Thread.current)

        await Task.sleep(seconds: 2)

        print("B finished")

        return 20
    }
}
