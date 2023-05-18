//
//  ProfileViewController.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-03-08.
//

import UIKit

class ProfileViewController: UIViewController {

    var userDetails: UserDetails?
        
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let heightLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let weightLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let fitnessGoalLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let ageLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let bmiLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let fitnessPlanLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .white
            title = "Profile"
            
            setupLabels()
            updateLabels()
            
            let userDetails = UserDetails(
                name: "John Doe",
                height: 180,
                weight: 75,
                fitnessGoal: "Lose weight",
                age: 30,
                bmi: 23.15,
                fitnessPlan: "Follow a balanced diet and exercise regularly."
            )

            let profileViewController = ProfileViewController()
            profileViewController.userDetails = userDetails

            
          
        }
        
        private func setupLabels() {
            let stackView = UIStackView(arrangedSubviews: [nameLabel, heightLabel, weightLabel, fitnessGoalLabel, ageLabel, bmiLabel, fitnessPlanLabel])
            stackView.axis = .vertical
            stackView.spacing = 8
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(stackView)
            
            NSLayoutConstraint.activate([
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
        
        private func updateLabels() {
            guard let userDetails = userDetails else { return }
            
            nameLabel.text = userDetails.name
            heightLabel.text = "Height: \(userDetails.height) cm"
            weightLabel.text = "Weight: \(userDetails.weight) kg"
            fitnessGoalLabel.text = "Fitness Goal: \(userDetails.fitnessGoal)"
            ageLabel.text = "Age: \(userDetails.age) years"
            bmiLabel.text = "BMI: \(userDetails.bmi)"
            fitnessPlanLabel.text = "Fitness Plan: \(userDetails.fitnessPlan)"
        }
    
    }

    struct UserDetails {
        let name: String
        let height: Int
        let weight: Int
        let fitnessGoal: String
        let age: Int
        let bmi: Double
        let fitnessPlan: String
    }

