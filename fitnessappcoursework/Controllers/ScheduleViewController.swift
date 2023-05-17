//
//  ScheduleViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-16.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ScheduleEditorDelegate {
    var tableView: UITableView!
        var schedules: [String] = [] // Array to store the user's schedules
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set up the table view
            tableView = UITableView(frame: view.bounds, style: .plain)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            tableView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(tableView)
            
            // Set up constraints
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
            
            // Set up the navigation bar
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        }
        
        @objc func addButtonTapped() {
            // Show the schedule editor to create a new schedule
            let scheduleEditorVC = ScheduleEditorViewController()
            scheduleEditorVC.delegate = self
            navigationController?.pushViewController(scheduleEditorVC, animated: true)
        }
        
        // MARK: - Schedule Editor Delegate
        
        func scheduleEditorDidFinishEditing(schedule: String) {
            // Add or update the schedule and reload the table view
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing schedule
                schedules[selectedIndexPath.row] = schedule
            } else {
                // Add a new schedule
                schedules.append(schedule)
            }
            tableView.reloadData()
        }
        
        // MARK: - Table View Data Source
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return schedules.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = schedules[indexPath.row]
            return cell
        }
        
        // MARK: - Table View Delegate
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Show the schedule editor to edit the selected schedule
            let scheduleEditorVC = ScheduleEditorViewController()
            scheduleEditorVC.delegate = self
            scheduleEditorVC.schedule = schedules[indexPath.row]
            navigationController?.pushViewController(scheduleEditorVC, animated: true)
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Delete the selected schedule
                schedules.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }

