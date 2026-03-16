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
            "Calling Async Function",
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
        } else if indexPath.section == 0 && indexPath.row == 2 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "AsyncNetworkingViewController") as! AsyncNetworkingViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 0 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "CreatingTasksViewController") as! CreatingTasksViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 1 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "TaskCancellationViewController") as! TaskCancellationViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 2 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "TaskPriorityViewController") as! TaskPriorityViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 2 && indexPath.row == 0 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "MainActorUIUpdateViewController") as! MainActorUIUpdateViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 2 && indexPath.row == 1 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "MainActorFunctionsViewController") as! MainActorFunctionsViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 2 && indexPath.row == 2 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "MainActorClassesViewController") as! MainActorClassesViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 3 && indexPath.row == 0 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "AsyncLetViewController") as! AsyncLetViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 3 && indexPath.row == 1 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "TaskGroupViewController") as! TaskGroupViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 4 && indexPath.row == 0 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "ActorIsolationViewController") as! ActorIsolationViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 4 && indexPath.row == 1 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "ActorStateAccessViewController") as! ActorStateAccessViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 5 && indexPath.row == 0 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "TaskSleepViewController") as! TaskSleepViewController
            
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 5 && indexPath.row == 1 {
            let vc = storyboardRef.instantiateViewController(withIdentifier: "TaskYieldViewController") as! TaskYieldViewController
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
