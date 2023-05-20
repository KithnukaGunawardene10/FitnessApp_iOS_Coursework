//
//  ReminderViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-20.
//

import UIKit

class ReminderViewController: UIViewController {
    var exerciseNameTextField: UITextField!
       var descriptionTextField: UITextField!
       var startTimeTextField: UITextField!
       var allocatedTimeTextField: UITextField!

       override func viewDidLoad() {
           super.viewDidLoad()
           setupUI()
       }

       func setupUI() {
           exerciseNameTextField = UITextField()
           exerciseNameTextField.placeholder = "Exercise Name"
           exerciseNameTextField.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(exerciseNameTextField)

           descriptionTextField = UITextField()
           descriptionTextField.placeholder = "Description"
           descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(descriptionTextField)

           startTimeTextField = UITextField()
           startTimeTextField.placeholder = "Start Time"
           startTimeTextField.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(startTimeTextField)

           allocatedTimeTextField = UITextField()
           allocatedTimeTextField.placeholder = "Allocated Time"
           allocatedTimeTextField.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(allocatedTimeTextField)

           let createReminderButton = UIButton(type: .system)
           createReminderButton.setTitle("Create Reminder", for: .normal)
           createReminderButton.addTarget(self, action: #selector(createReminderButtonTapped), for: .touchUpInside)
           createReminderButton.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(createReminderButton)

           // Configure constraints for the UI elements
           NSLayoutConstraint.activate([
               exerciseNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
               exerciseNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
               exerciseNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
               descriptionTextField.topAnchor.constraint(equalTo: exerciseNameTextField.bottomAnchor, constant: 8),
               descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
               descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
               startTimeTextField.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 8),
               startTimeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
               startTimeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
               allocatedTimeTextField.topAnchor.constraint(equalTo: startTimeTextField.bottomAnchor, constant: 8),
               allocatedTimeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
               allocatedTimeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
               createReminderButton.topAnchor.constraint(equalTo: allocatedTimeTextField.bottomAnchor, constant: 16),
               createReminderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           ])
       }

    @objc func createReminderButtonTapped() {
        guard let exerciseName = exerciseNameTextField.text, !exerciseName.isEmpty,
              let description = descriptionTextField.text, !description.isEmpty,
              let startTime = startTimeTextField.text, !startTime.isEmpty,
              let allocatedTime = allocatedTimeTextField.text, !allocatedTime.isEmpty else {
            // Display an alert or handle the error when any of the fields are empty
            let alertController = UIAlertController(title: "Error", message: "Please fill in all the fields.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }

        // All fields are filled, proceed to create the reminder
        let reminderText = "Exercise Name: \(exerciseName)\nDescription: \(description)\nStart Time: \(startTime)\nAllocated Time: \(allocatedTime)"
        
        let alertController = UIAlertController(title: "Reminder Created", message: reminderText, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
   }
