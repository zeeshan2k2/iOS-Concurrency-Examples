//
//  MainMenuViewController.swift
//  iOS-Concurrency-Examples
//
//  Created by Zeeshan Waheed on 13/03/2026.
//

import UIKit

class MainMenuViewController: UITableViewController {
    
    let storyboardRef = UIStoryboard(name: "Main", bundle: nil)

    let sections = [
        ("Async / Await", [
            "Basic Async Function",
            "Async Networking"
        ]),
        ("Task", [
            "Creating Tasks",
            "Task Cancellation",
            "Task Priority"
        ]),
        ("MainActor", [
            "Updating UI Safely",
            "MainActor Functions",
            "MainActor Classes"
        ]),
        ("Structured Concurrency", [
            "async let",
            "TaskGroup"
        ]),
        ("Actors", [
            "Actor Isolation",
            "Accessing Actor State"
        ]),
        ("Task Utilities", [
            "Task.sleep",
            "Task.yield"
        ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Concurrency Examples"

        tableView = UITableView(frame: .zero, style: .insetGrouped)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return sections[section].1.count
    }

    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        return sections[section].0
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = sections[indexPath.section].1[indexPath.row]
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            
            let vc = storyboardRef.instantiateViewController(
                withIdentifier: "BasicAsyncViewController"
            ) as! BasicAsyncViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 0 && indexPath.row == 1 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "CallingAsyncFunctionsViewController") as! CallingAsyncFunctionsViewController
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
