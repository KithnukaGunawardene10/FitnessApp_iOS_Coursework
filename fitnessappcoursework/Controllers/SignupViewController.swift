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
    
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "login.jpg")
        return imageView
    }()
  

          override func viewDidLoad() {
              super.viewDidLoad()
              setupUI()
              
             
          }

          private func setupUI() {
              
              view.addSubview(backgroundImageView)
              NSLayoutConstraint.activate([
                  backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                  backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                  backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                  backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
              ])
              
              let titleLabel = UILabel()
              titleLabel.text = "Sign In"
              titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
              titleLabel.textAlignment = .center
              titleLabel.translatesAutoresizingMaskIntoConstraints = false
              
              view.addSubview(titleLabel)

              // Add and configure text fields
              // Name text field
              nameTextField.placeholder = "Name"
              nameTextField.setPlaceholderTextColor(.white)
              nameTextField.borderStyle = .roundedRect
              nameTextField.translatesAutoresizingMaskIntoConstraints = false
              nameTextField.layer.borderWidth = 1.0
              nameTextField.layer.borderColor = UIColor.white.cgColor
              nameTextField.layer.cornerRadius = 7

              view.addSubview(nameTextField)

              // Email text field
              emailTextField.placeholder = "Email"
              emailTextField.setPlaceholderTextColor(.white)
              emailTextField.borderStyle = .roundedRect
              emailTextField.translatesAutoresizingMaskIntoConstraints = false
              emailTextField.layer.borderWidth = 1.0
              emailTextField.layer.borderColor = UIColor.white.cgColor
              emailTextField.layer.cornerRadius = 7

              view.addSubview(emailTextField)

              // Password text field
              passwordTextField.placeholder = "Password"
              passwordTextField.setPlaceholderTextColor(.white)
              passwordTextField.borderStyle = .roundedRect
              passwordTextField.isSecureTextEntry = true
              passwordTextField.translatesAutoresizingMaskIntoConstraints = false
              passwordTextField.layer.borderWidth = 1.0
              passwordTextField.layer.borderColor = UIColor.white.cgColor
              passwordTextField.layer.cornerRadius = 7

              view.addSubview(passwordTextField)

              // Add and configure signup button
              signupButton.setTitle("Sign In with Us", for: .normal)
              signupButton.setTitleColor(.black, for: .normal)
              signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
              signupButton.translatesAutoresizingMaskIntoConstraints = false
              signupButton.backgroundColor = .green
              signupButton.layer.cornerRadius = 5
              signupButton.layer.borderWidth = 1.0
              signupButton.layer.borderColor = UIColor.white.cgColor
              view.addSubview(signupButton)


              // Add constraints
              NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 420),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                
                  nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
                  nameTextField.widthAnchor.constraint(equalToConstant: 200),

                  emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                  emailTextField.widthAnchor.constraint(equalToConstant: 200),

                  passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
                  passwordTextField.widthAnchor.constraint(equalToConstant: 200),

                  signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  signupButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
                  signupButton.widthAnchor.constraint(equalToConstant: 200)
              ])
          }

          @objc private func signupButtonTapped() {
                  guard let name = nameTextField.text,
                        let email = emailTextField.text,
                        let password = passwordTextField.text else {
                              // Handle empty text fields
                          showAlert(message: "Please fill in all the fields.")
                          return
                      }
                      
                      if name.isEmpty || email.isEmpty || password.isEmpty {
                          // Handle empty text fields
                          showAlert(message: "Please fill in all the fields.")
                          return
                      }
                      
                      // All fields are not empty, navigate to a new UI
                      let DetailViewController = UserDetailsViewController()
                       navigationController?.pushViewController(DetailViewController, animated: true)
              
              
          }
        private func showAlert(message: String) {
            let alertController = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
      }
