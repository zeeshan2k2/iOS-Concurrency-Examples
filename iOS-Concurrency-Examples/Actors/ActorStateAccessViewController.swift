//
//  ActorStateAccessViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 17/03/2026.
//

import Foundation
import UIKit

final class ActorStateAccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Actor State Access"
        view.backgroundColor = .systemBackground
    }

    @IBAction func runExample(_ sender: UIButton) {

        Task {
            await runActorStateAccessExample()
        }

    }

    // MARK: - Actor State Access Example

    func runActorStateAccessExample() async {

        print("\n----- ACTOR STATE ACCESS -----")

        let bankAccount = BankAccountActor()

        await withTaskGroup(of: Void.self) { group in

            for i in 1...3 {

                group.addTask {

                    print("Task \(i) requesting deposit")

                    await bankAccount.deposit(amount: 100)

                    let balance = await bankAccount.getBalance()

                    print("Task \(i) sees balance:", balance)
                }

            }

        }

        let finalBalance = await bankAccount.getBalance()

        print("Final Balance:", finalBalance)
    }
}


// MARK: - Actor

actor BankAccountActor {

    private var balance = 0

    func deposit(amount: Int) {

        print("Depositing \(amount) on:", Thread.current)

        balance += amount

        print("Balance now:", balance)
    }

    func getBalance() -> Int {
        balance
    }
}
