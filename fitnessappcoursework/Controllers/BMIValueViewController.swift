//
//  BMIValueViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-16.
//

import UIKit

class BMIValueViewController: UIViewController {


        // UI elements
        let heightTextField = UITextField()
        let weightTextField = UITextField()
        let calculateButton = UIButton(type: .system)
        let resultLabel = UILabel()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set up UI elements
            heightTextField.placeholder = "Height (in cm)"
            heightTextField.keyboardType = .numberPad
            heightTextField.borderStyle = .roundedRect
            heightTextField.translatesAutoresizingMaskIntoConstraints = false
            
            weightTextField.placeholder = "Weight (in kg)"
            weightTextField.keyboardType = .numberPad
            weightTextField.borderStyle = .roundedRect
            weightTextField.translatesAutoresizingMaskIntoConstraints = false
            
            calculateButton.setTitle("Calculate BMI", for: .normal)
            calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
            calculateButton.translatesAutoresizingMaskIntoConstraints = false
            
            resultLabel.textAlignment = .center
            resultLabel.translatesAutoresizingMaskIntoConstraints = false
            
            // Add UI elements to the view
            view.addSubview(heightTextField)
            view.addSubview(weightTextField)
            view.addSubview(calculateButton)
            view.addSubview(resultLabel)
            
            // Set up constraints
            NSLayoutConstraint.activate([
                heightTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                heightTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
                heightTextField.widthAnchor.constraint(equalToConstant: 200),
                
                weightTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                weightTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
                weightTextField.widthAnchor.constraint(equalToConstant: 200),
                
                calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                calculateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
                
                resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
                resultLabel.widthAnchor.constraint(equalToConstant: 200)
            ])
        }
        
        @objc func calculateButtonTapped() {
            // Check if height and weight text fields have valid values
            guard let heightText = heightTextField.text, let height = Double(heightText),
                  let weightText = weightTextField.text, let weight = Double(weightText) else {
                return
            }
            
            // Calculate BMI
            let heightInMeters = height / 100.0
            let bmi = weight / (heightInMeters * heightInMeters)
            
            // Display the result
            resultLabel.text = String(format: "BMI: %.2f", bmi)
        }

}
