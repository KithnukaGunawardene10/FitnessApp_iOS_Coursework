//
//  SignupViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-19.
//

import UIKit

class SignupViewController: UIViewController {
    // UI elements
        private let nameTextField = UITextField()
        private let emailTextField = UITextField()
        private let passwordTextField = UITextField()
        private let signupButton = UIButton(type: .system)

        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }

        private func setupUI() {
            // Add and configure text fields
            // Name text field
            nameTextField.placeholder = "Name"
            nameTextField.borderStyle = .roundedRect
            nameTextField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(nameTextField)

            // Email text field
            emailTextField.placeholder = "Email"
            emailTextField.borderStyle = .roundedRect
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(emailTextField)

            // Password text field
            passwordTextField.placeholder = "Password"
            passwordTextField.borderStyle = .roundedRect
            passwordTextField.isSecureTextEntry = true
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(passwordTextField)

            // Add and configure signup button
            signupButton.setTitle("Sign Up", for: .normal)
            signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
            signupButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(signupButton)

            // Add constraints
            NSLayoutConstraint.activate([
                nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
                nameTextField.widthAnchor.constraint(equalToConstant: 200),

                emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                emailTextField.widthAnchor.constraint(equalToConstant: 200),

                passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
                passwordTextField.widthAnchor.constraint(equalToConstant: 200),

                signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                signupButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30)
            ])
        }

        @objc private func signupButtonTapped() {
            // Create an instance of the profile view controller
            let profileViewController = ProfileViewController()

            // Pass the signup details to the profile view controller
            profileViewController.name = nameTextField.text
            profileViewController.email = emailTextField.text
            profileViewController.password = passwordTextField.text

            // Push the profile view controller onto the navigation stack
            navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
