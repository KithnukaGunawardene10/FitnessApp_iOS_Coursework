//
//  ScheduleEditorViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-16.
//

import UIKit
protocol ScheduleEditorDelegate: AnyObject {
    func scheduleEditorDidFinishEditing(schedule: String)
}

class ScheduleEditorViewController: UIViewController {

    var scheduleTextView: UITextView!
        var schedule: String?
        weak var delegate: ScheduleEditorDelegate?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set up the schedule text view
            scheduleTextView = UITextView()
            scheduleTextView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(scheduleTextView)
            
            // Set up constraints
            NSLayoutConstraint.activate([
                scheduleTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scheduleTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                scheduleTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                scheduleTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
            
            // Set up the navigation bar
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
            
            // Set the initial schedule text if editing an existing schedule
            scheduleTextView.text = schedule
        }
        
        @objc func doneButtonTapped() {
            // Notify the delegate that editing is finished and pass the updated schedule
            let updatedSchedule = scheduleTextView.text.trimmingCharacters(in: .whitespacesAndNewlines)
            delegate?.scheduleEditorDidFinishEditing(schedule: updatedSchedule)
            
            navigationController?.popViewController(animated: true)
        }

}
