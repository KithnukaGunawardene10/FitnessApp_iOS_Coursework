//
//  ProfileViewController.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-03-08.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
   
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "details") // Set default image
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.bounds.width / 2 // Make the image view circular
        
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your name"
        textField.isEnabled = false // Set text field to be non-editable by default
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your email"
        textField.isEnabled = false // Set text field to be non-editable by default
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Age:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your age"
        textField.isEnabled = false // Set text field to be non-editable by default
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weight:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let weightTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your weight"
        textField.isEnabled = false // Set text field to be non-editable by default
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let bmiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BMI:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let bmiTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your BMI"
        textField.isEnabled = false // Set text field to be non-editable by default
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let editButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Edit", for: .normal)
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "cover.jpg")
        return imageView
    }()
    
    let titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Profile"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
  
    
    
    
    var isEditModeEnabled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        setupUI()
        setDefaultData()
        view.backgroundColor = .black
        
       
    }
    @objc func editButtonTapped() {
            isEditModeEnabled.toggle()
            nameTextField.isEnabled = isEditModeEnabled
            // Enable other text fields for editing
            
            if isEditModeEnabled {
                editButton.setTitle("Save", for: .normal)
            } else {
                editButton.setTitle("Edit", for: .normal)
                saveData()
            }
        }
    
        func saveData() {
              }
        
    @objc func profileImageTapped() {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            present(imagePickerController, animated: true, completion: nil)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                profileImageView.image = selectedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Add and position UI elements using Auto Layout
        view.addSubview(titleLabel)
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(weightLabel)
        view.addSubview(weightTextField)
        view.addSubview(bmiLabel)
        view.addSubview(bmiTextField)
        view.addSubview(editButton)
        
        let margin: CGFloat = 16
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    
            profileImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 150),
            profileImageView.widthAnchor.constraint(equalToConstant: 150),
            
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: margin),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: margin),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            ageLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: margin),
            ageLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            
            ageTextField.topAnchor.constraint(equalTo: ageLabel.topAnchor),
            ageTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            weightLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: margin),
            weightLabel.leadingAnchor.constraint(equalTo: ageLabel.leadingAnchor),
            
            weightTextField.topAnchor.constraint(equalTo: weightLabel.topAnchor),
            weightTextField.leadingAnchor.constraint(equalTo: ageTextField.leadingAnchor),
            weightTextField.trailingAnchor.constraint(equalTo: ageTextField.trailingAnchor),
            
            bmiLabel.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: margin),
            bmiLabel.leadingAnchor.constraint(equalTo: weightLabel.leadingAnchor),
            
            bmiTextField.topAnchor.constraint(equalTo: bmiLabel.topAnchor),
            bmiTextField.leadingAnchor.constraint(equalTo: weightTextField.leadingAnchor),
            bmiTextField.trailingAnchor.constraint(equalTo: weightTextField.trailingAnchor),
            
            editButton.topAnchor.constraint(equalTo: bmiTextField.bottomAnchor, constant: margin),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
        ])
    }
    
    private func setDefaultData() {
        // Set hardcoded data for the text fields
        
        nameTextField.text = "Kithnuka Gunawardene"
        emailTextField.text = "kithnuka@gmail.com"
        ageTextField.text = "25"
        weightTextField.text = "50"
        bmiTextField.text = "22.3"
    }
}
