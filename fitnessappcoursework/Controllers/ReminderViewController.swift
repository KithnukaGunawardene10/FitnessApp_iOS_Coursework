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
    
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "backcover.jpg")
        return imageView
    }()


       override func viewDidLoad() {
           super.viewDidLoad()
           
           view.addSubview(backgroundImageView)
           NSLayoutConstraint.activate([
               backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
               backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
           ])
           setupUI()
       }

       func setupUI() {
           
           let titleLabel = UILabel()
           titleLabel.text = "Set Reminder"
           titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
           titleLabel.textAlignment = .center
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           
           view.addSubview(titleLabel)
            
            
           exerciseNameTextField = UITextField()
           exerciseNameTextField.placeholder = "Exercise Name"
           exerciseNameTextField.translatesAutoresizingMaskIntoConstraints = false
           exerciseNameTextField.setPlaceholderTextColor(.white)
           exerciseNameTextField.layer.borderWidth = 1.0
           exerciseNameTextField.layer.borderColor = UIColor.white.cgColor
           exerciseNameTextField.layer.cornerRadius = 4

           view.addSubview(exerciseNameTextField)
           

           descriptionTextField = UITextField()
           descriptionTextField.placeholder = "Description"
           descriptionTextField.setPlaceholderTextColor(.white)
           descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
           descriptionTextField.layer.borderWidth = 1.0
           descriptionTextField.layer.borderColor = UIColor.white.cgColor
           descriptionTextField.layer.cornerRadius = 4

           view.addSubview(descriptionTextField)

           startTimeTextField = UITextField()
           startTimeTextField.placeholder = "Start Time"
           startTimeTextField.setPlaceholderTextColor(.white)
           startTimeTextField.translatesAutoresizingMaskIntoConstraints = false
           startTimeTextField.layer.borderWidth = 1.0
           startTimeTextField.layer.borderColor = UIColor.white.cgColor
           startTimeTextField.layer.cornerRadius = 4

           view.addSubview(startTimeTextField)

           allocatedTimeTextField = UITextField()
           allocatedTimeTextField.placeholder = "Allocated Time"
           allocatedTimeTextField.setPlaceholderTextColor(.white)
           allocatedTimeTextField.translatesAutoresizingMaskIntoConstraints = false
           allocatedTimeTextField.layer.borderWidth = 1.0
           allocatedTimeTextField.layer.borderColor = UIColor.white.cgColor
           allocatedTimeTextField.layer.cornerRadius = 4

           view.addSubview(allocatedTimeTextField)

           let createReminderButton = UIButton(type: .system)
           createReminderButton.setTitle("Create Reminder", for: .normal)
           createReminderButton.addTarget(self, action: #selector(createReminderButtonTapped), for: .touchUpInside)
           createReminderButton.translatesAutoresizingMaskIntoConstraints = false
           createReminderButton.setTitleColor(.green, for: .normal)
           
           view.addSubview(createReminderButton)

           // Configure constraints for the UI elements
           NSLayoutConstraint.activate([
        
                 
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
               exerciseNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
               exerciseNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
               exerciseNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
               descriptionTextField.topAnchor.constraint(equalTo: exerciseNameTextField.bottomAnchor, constant: 20),
               descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
               descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
               startTimeTextField.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 20),
               startTimeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
               startTimeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
               allocatedTimeTextField.topAnchor.constraint(equalTo: startTimeTextField.bottomAnchor, constant: 20),
               allocatedTimeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
               allocatedTimeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
               createReminderButton.topAnchor.constraint(equalTo: allocatedTimeTextField.bottomAnchor, constant: 20),
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
