//
//  ActorIsolationViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 17/03/2026.
//

import Foundation
import UIKit

final class ActorIsolationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Actor Isolation"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {

        Task {
            await runActorIsolationExample()
        }

    }

    // MARK: - Actor Isolation Example

    func runActorIsolationExample() async {

        print("\n----- ACTOR ISOLATION -----")

        let counter = CounterActor()

        await withTaskGroup(of: Void.self) { group in

            for i in 1...5 {

                group.addTask {

                    print("Task \(i) requesting increment on:", Thread.current)

                    let value = await counter.increment()

                    print("Task \(i) received value:", value)
                }

            }

        }

        let finalValue = await counter.getValue()

        print("Final Counter Value:", finalValue)
    }
}


// MARK: - Actor

actor CounterActor {

    private var value = 0

    func increment() -> Int {

        print("Increment executing on:", Thread.current)

        value += 1

        print("Counter value now:", value)

        return value
    }

    func getValue() -> Int {
        value
    }
}
