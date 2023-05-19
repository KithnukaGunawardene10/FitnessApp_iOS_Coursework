//
//  ProfileViewController.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-03-08.
//

import UIKit

class ProfileViewController: UIViewController {
    var profileData: UserDetailsViewController.ProfileData?
        
    Data properties
      var name: String?
      var email: String?
      var password: String?

      // UI elements
      private let nameLabel = UILabel()
      private let emailLabel = UILabel()
      private let passwordLabel = UILabel()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupUI()
            displayDetails()

            
            // Create UI elements programmatically
            let nameLabel = UILabel(frame: CGRect(x: 20, y: 100, width: 200, height: 30))
            nameLabel.text = "Name: \(profileData?.name ?? "")"
            view.addSubview(nameLabel)
            
            let heightLabel = UILabel(frame: CGRect(x: 20, y: 150, width: 200, height: 30))
            heightLabel.text = "Height: \(profileData?.height ?? 0)"
            view.addSubview(heightLabel)
            
            let ageLabel = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 30))
            ageLabel.text = "Age: \(profileData?.age ?? 0)"
            view.addSubview(ageLabel)
            
            let bmiLabel = UILabel(frame: CGRect(x: 20, y: 250, width: 200, height: 30))
            bmiLabel.text = "BMI: \(profileData?.bmi ?? 0)"
            view.addSubview(bmiLabel)
            
            let fitnessPlanLabel = UILabel(frame: CGRect(x: 20, y: 300, width: 200, height: 30))
            fitnessPlanLabel.text = "Fitness Plan: \(profileData?.fitnessPlan ?? "")"
            view.addSubview(fitnessPlanLabel)
            
            //

               
              
           }
    private func setupUI() {
        // Add and configure labels
        // Name label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)

        // Email label
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)

        // Password label
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)

        // Add constraints
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),

            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),

            passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20)
        ])
    }

    private func displayDetails() {
        // Update the labels with the user's details
        nameLabel.text = "Name: \(name ?? "")"
        emailLabel.text = "Email: \(email ?? "")"
        passwordLabel.text = "Password: \(password ?? "")"
    }
        }

    

struct ProfileData {
    var name: String
    var height: Double
    var weight: Double
    var age: Int
    var bmi: Double
    var fitnessPlan: String
}
