//
//  LoginViewController.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-03-05.
//

import UIKit

class LoginViewController: UIViewController {
    let topView: UIView = {
            let view = UIView()
            view.backgroundColor = .orange
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    func setupTopView() {
            
            view.addSubview(topView)
            
            topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            topView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        }
    
    let emailTextField: UITextField = {
            let tf = UITextField()
            tf.translatesAutoresizingMaskIntoConstraints = false
            tf.placeholder = "Email"
            tf.borderStyle = .roundedRect
            tf.backgroundColor = UIColor(white: 0, alpha: 0.1)
        tf.addTarget(LoginViewController.self, action: #selector(handleTextChange), for: .editingChanged)
        
            return tf
            
        }()
        
        let usernameTextField: UITextField = {
            let tf = UITextField()
            tf.translatesAutoresizingMaskIntoConstraints = false
            tf.placeholder = "Username"
            tf.borderStyle = .roundedRect
            tf.backgroundColor = UIColor(white: 0, alpha: 0.1)
            tf.addTarget(LoginViewController.self, action: #selector(handleTextChange), for: .editingChanged)
            
            return tf
            
        }()
        
        let passwordTextField: UITextField = {
            let tf = UITextField()
            tf.translatesAutoresizingMaskIntoConstraints = false
            tf.placeholder = "Password"
            tf.isSecureTextEntry = true
            tf.borderStyle = .roundedRect
            tf.backgroundColor = UIColor(white: 0, alpha: 0.1)
            tf.addTarget(LoginViewController.self, action: #selector(handleTextChange), for: .editingChanged)
            
            return tf
            
        }()
        
        let signUpButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Sign Up", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 3
            button.backgroundColor = UIColor.lightGray
            
            button.addTarget(LoginViewController.self, action: #selector(handleSignUp), for: .touchUpInside)
            
            return button
        }()
    
    
    @objc func handleSignUp() {
           validateForm()
       }
       
       func validateForm() {
           guard let emailText = emailTextField.text, !emailText.isEmpty else { return }
           guard let passwordText = passwordTextField.text, !passwordText.isEmpty else { return }
           guard let usernameText = usernameTextField.text, !usernameText.isEmpty else { return }
           
           startSigningUp(email: emailText, password: passwordText, username: usernameText)
       }
       
       func startSigningUp(email: String, password: String, username: String) {
           print("Please call any Sign up api for registration: ", email, password, username)
       }
    
   
    
    @objc func handleTextChange() {
            
            let emailText = emailTextField.text!
            let usernameText = usernameTextField.text!
            let passwordText = passwordTextField.text!
            
            let isFormFilled = !emailText.isEmpty && !usernameText.isEmpty && !passwordText.isEmpty
            
            if isFormFilled {
                signUpButton.backgroundColor = UIColor.orange
                signUpButton.isEnabled = true
            }else {
                signUpButton.backgroundColor = UIColor.lightGray
                signUpButton.isEnabled = false
            }
            
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupTopView()
        
        setupTextFields()

        // Do any additional setup after loading the view.
    }
    
    
    func setupTextFields() {
            
            let stackView = UIStackView(arrangedSubviews: [emailTextField, usernameTextField, passwordTextField, signUpButton])
            stackView.axis = .vertical
            stackView.spacing = 10
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            //add stack view as subview to main view with AutoLayout
            view.addSubview(stackView)
            stackView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 40).isActive = true
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
            stackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
        }
    
    
}
