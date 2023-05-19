//
//  LoginViewController.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-03-05.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
      let backgroundImageView: UIImageView = {
          let imageView = UIImageView()
          imageView.translatesAutoresizingMaskIntoConstraints = false
          imageView.contentMode = .scaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = UIImage(named: "login.jpg")
          return imageView
      }()
      
      let emailTextField: UITextField = {
          let textField = UITextField()
          textField.translatesAutoresizingMaskIntoConstraints = false
          textField.placeholder = "Enter your Email"
          textField.textColor = .black
          textField.setPlaceholderTextColor(.gray)
          textField.borderStyle = .roundedRect
          textField.backgroundColor = .white
          return textField
      }()
      
      let passwordTextField: UITextField = {
          let textField = UITextField()
          textField.translatesAutoresizingMaskIntoConstraints = false
          textField.placeholder = "Enter your Password"
          textField.textColor = .black
          textField.setPlaceholderTextColor(.gray)
          textField.borderStyle = .roundedRect
          textField.backgroundColor = .white
          textField.isSecureTextEntry = true
          return textField
      }()
      
      let loginButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle("Login", for: .normal)
          button.backgroundColor = .green
          button.setTitleColor(.black, for: .normal)
          button.layer.cornerRadius = 5
          button.addTarget(self, action: #selector(loginButtonTapped), for:.touchUpInside)
          return button
      }()
      
      let signupButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle("Sign Up", for: .normal)
          button.setTitleColor(.white, for: .normal)
          button.addTarget(self, action: #selector(signupButtonTapped), for:.touchUpInside)
          return button
      }()
      
      
    
      // MARK: - View Lifecycle
      override func viewDidLoad() {
          super.viewDidLoad()
          setupUI()
          
      }
      
      // MARK: - UI Setup
      private func setupUI() {
          // Background Image View
          view.addSubview(backgroundImageView)
          NSLayoutConstraint.activate([
              backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
              backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
          ])
          
          // Stack View
          let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, signupButton])
          stackView.translatesAutoresizingMaskIntoConstraints = false
          stackView.axis = .vertical
          stackView.spacing = 10
          view.addSubview(stackView)
          
          NSLayoutConstraint.activate([
              stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
              stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
          ])
      }
    
      @objc func loginButtonTapped() {
            guard let email = emailTextField.text, !email.isEmpty else {
                showAlert(message: "Please enter your email.")
                return
            }
            
        guard let password = passwordTextField.text, !password.isEmpty else{
                showAlert(message: "Please enter your password.")
                return
            }
            
            // Perform email and password validation here
            if isValidEmail(email) && isValidPassword(password) {
                let userDetailsVC = UserDetailsViewController()
                navigationController?.pushViewController(userDetailsVC, animated: true)
            } else {
                showAlert(message: "Invalid email or password.")
            }
        }
        
        // MARK: - Helper Methods
        func isValidEmail(_ email: String) -> Bool {
            // Perform email validation logic here
            // Return true if the email is valid, otherwise return false
            // You can use regular expressions, third-party libraries, or any other method to validate the email
            // Example email validation:
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
        
        func isValidPassword(_ password: String) -> Bool {
            // Perform password validation logic here
            // Return true if the password is valid, otherwise return false
            // You can implement your own password validation rules
            // Example password validation:
            return password.count >= 6
        }
        
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    
     
      
      // MARK: - Button Actions
     @objc private func signupButtonTapped() {
          // Perform sign up logic here
      }
      
      
      // MARK: - Navigation
      private func navigateToNextScreen() {
          // Example code for navigating to the next screen view controller
          let nextViewController = UserDetailsViewController()
          navigationController?.pushViewController(nextViewController, animated: true)
      }
      
      // MARK: - Helper
      private func showAlert(with title: String, message: String) {
          let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          present(alert, animated: true, completion: nil)
      }
    

  }
extension UITextField {
    func setPlaceholderTextColor(_ color: UIColor) {
        guard let placeholder = self.placeholder else {
            return
        }
        
        let attributes = [NSAttributedString.Key.foregroundColor: color]
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
}

  // MARK: - Usage
  
