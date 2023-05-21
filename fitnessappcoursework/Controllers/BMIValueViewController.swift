//
//  BMIValueViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-16.
//

import UIKit

class BMIValueViewController: UIViewController {

    var nameTextField: UITextField!
    var titleLabel: UILabel!
    var heightTextField: UITextField!
    var weightTextField: UITextField!
    var fitnessGoalSegmentedControl: UISegmentedControl!
    var ageTextField: UITextField!
    var calculateButton: UIButton!
    var HomeButton: UIButton!
    var bmiLabel: UILabel!
    var fitnessPlanLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "details.jpg")
            return imageView
        }()
        
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            
              
        ])
        
        titleLabel = UILabel()
        titleLabel.text = "Let's Re-Calculate your BMI Value"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        
        
        // Set up the height text field
        heightTextField = UITextField()
        heightTextField.placeholder = "Height (in cm)"
        heightTextField.keyboardType = .numberPad
        heightTextField.borderStyle = .roundedRect
        heightTextField.layer.borderColor = UIColor.white.cgColor
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heightTextField)
        
        // Set up the weight text field
        weightTextField = UITextField()
        weightTextField.placeholder = "Weight (in kg)"
        weightTextField.keyboardType = .numberPad
        weightTextField.borderStyle = .roundedRect
        weightTextField.layer.borderColor = UIColor.white.cgColor
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weightTextField)
        
         
          // Set up the calculate button
        calculateButton = UIButton(type: .system)
        calculateButton.setTitle("Calculate BMI", for: .normal)
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calculateButton)
        
        HomeButton = UIButton(type: .system)
        HomeButton.setTitle("Back to Home", for: .normal)
        HomeButton.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        HomeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(HomeButton)

        
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
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalToConstant: 350),
            
            
              
            heightTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heightTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            heightTextField.widthAnchor.constraint(equalToConstant: 350),
            
            weightTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weightTextField.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 20),
            weightTextField.widthAnchor.constraint(equalToConstant: 350),
            
        
             
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 120),
            
            HomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            HomeButton.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            
            
            bmiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bmiLabel.topAnchor.constraint(equalTo: HomeButton.bottomAnchor, constant: 20),
            
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
          let weight = Double(weightText)
       
    
    
    else {
        showAlert(message: "Please enter valid height and weight.")
        return
    }
    
    let bmi = calculateBMI(height: height, weight: weight)
    bmiLabel.text = "Your BMI: \(bmi)"
    
    let fitnessPlan = suggestFitnessPlan(bmi: bmi)
    fitnessPlanLabel.text = "Fitness Plan: \(fitnessPlan)"
    
     }
    @objc private func ButtonTapped() {
             let TabViewController = MainTabViewController()
                 navigationController?.pushViewController(TabViewController, animated: true)
        
        
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
