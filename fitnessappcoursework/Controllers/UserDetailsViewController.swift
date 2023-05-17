//
//  UserDetailsViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-16.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    var heightTextField: UITextField!
     var weightTextField: UITextField!
     var fitnessGoalSegmentedControl: UISegmentedControl!
     var ageTextField: UITextField!
     var calculateButton: UIButton!
     var bmiLabel: UILabel!
     var fitnessPlanLabel: UILabel!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         // Set up the height text field
         heightTextField = UITextField()
         heightTextField.placeholder = "Height (in cm)"
         heightTextField.keyboardType = .numberPad
         heightTextField.borderStyle = .roundedRect
         heightTextField.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(heightTextField)
         
         // Set up the weight text field
         weightTextField = UITextField()
         weightTextField.placeholder = "Weight (in kg)"
         weightTextField.keyboardType = .numberPad
         weightTextField.borderStyle = .roundedRect
         weightTextField.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(weightTextField)
         
         // Set up the fitness goal segmented control
         fitnessGoalSegmentedControl = UISegmentedControl(items: ["Lose Weight", "Maintain Weight", "Gain Weight"])
         fitnessGoalSegmentedControl.selectedSegmentIndex = 0
         fitnessGoalSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(fitnessGoalSegmentedControl)
         
         // Set up the age text field
         ageTextField = UITextField()
         ageTextField.placeholder = "Age"
         ageTextField.keyboardType = .numberPad
         ageTextField.borderStyle = .roundedRect
         ageTextField.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(ageTextField)
         
         // Set up the calculate button
         calculateButton = UIButton(type: .system)
         calculateButton.setTitle("Calculate BMI", for: .normal)
         calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
         calculateButton.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(calculateButton)
         
         // Set up the BMI label
         bmiLabel = UILabel()
         bmiLabel.textAlignment = .center
         bmiLabel.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(bmiLabel)
         
         // Set up the fitness plan label
         fitnessPlanLabel = UILabel()
         fitnessPlanLabel.textAlignment = .center
         fitnessPlanLabel.numberOfLines = 0
         fitnessPlanLabel.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(fitnessPlanLabel)
         
         // Set up constraints
         NSLayoutConstraint.activate([
             heightTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             heightTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
             heightTextField.widthAnchor.constraint(equalToConstant: 200),
             
             weightTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             weightTextField.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 20),
             weightTextField.widthAnchor.constraint(equalToConstant: 200),
             
             fitnessGoalSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             fitnessGoalSegmentedControl.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 20),
             
             ageTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             ageTextField.topAnchor.constraint(equalTo: fitnessGoalSegmentedControl.bottomAnchor, constant: 20),
             ageTextField.widthAnchor.constraint(equalToConstant: 200),
             
             calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             calculateButton.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20),
             
             bmiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             bmiLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
             
             fitnessPlanLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             fitnessPlanLabel.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor, constant: 20),
 fitnessPlanLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
 fitnessPlanLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
 ])
 }
 @objc func calculateButtonTapped() {
     // Validate input and calculate BMI
     guard let heightText = heightTextField.text, !heightText.isEmpty,
           let weightText = weightTextField.text, !weightText.isEmpty,
           let height = Double(heightText),
           let weight = Double(weightText) else {
         showAlert(message: "Please enter valid height and weight.")
         return
     }
     
     let bmi = calculateBMI(height: height, weight: weight)
     bmiLabel.text = "Your BMI: \(bmi)"
     
     let fitnessPlan = suggestFitnessPlan(bmi: bmi)
     fitnessPlanLabel.text = "Fitness Plan: \(fitnessPlan)"
 }

 func calculateBMI(height: Double, weight: Double) -> Double {
     // Calculate BMI using the formula: BMI = weight / (height * height)
     let heightInMeters = height / 100 // Convert height from cm to meters
     let bmi = weight / (heightInMeters * heightInMeters)
     return bmi
 }

 func suggestFitnessPlan(bmi: Double) -> String {
     // Suggest fitness plan based on BMI
     if bmi < 18.5 {
         return "You are underweight. Consider gaining weight with a balanced diet and strength training."
     } else if bmi >= 18.5 && bmi < 25 {
         return "You have a healthy weight. Maintain your weight with regular exercise and a balanced diet."
     } else if bmi >= 25 && bmi < 30 {
         return "You are overweight. Focus on losing weight through a combination of cardiovascular exercise and calorie control."
     } else {
         return "You are obese. Consult with a healthcare professional for a personalized weight loss plan."
     }
 }

 func showAlert(message: String) {
     let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
     alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
     present(alert, animated: true, completion: nil)
 }
}
