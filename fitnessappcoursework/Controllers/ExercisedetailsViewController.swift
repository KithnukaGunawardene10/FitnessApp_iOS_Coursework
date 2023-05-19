//
//  ExercisedetailsViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-20.
//

import UIKit

class ExercisedetailsViewController: UIViewController {
    // Exercise data properties
       let exerciseName = "Push-ups"
       let exerciseImage = UIImage(named: "pushup")
       let muscle = "Chest, Shoulders, Triceps"
       let equipment = "None"
       let difficultyLevel = "Intermediate"
       let instructions = "1. Start in a high plank position with your hands slightly wider than shoulder-width apart.\n2. Lower your body until your chest nearly touches the floor, keeping your elbows close to your sides.\n3. Push back up to the starting position and repeat.\n4. Breathe out as you push up and breathe in as you lower back down."
       
       // UI Elements
       private var exerciseImageView: UIImageView!
       private var nameLabel: UILabel!
       private var muscleLabel: UILabel!
       private var equipmentLabel: UILabel!
       private var difficultyLabel: UILabel!
       private var instructionsLabel: UILabel!
       private var nextButton: UIButton!
       
       override func viewDidLoad() {
           super.viewDidLoad()
           let backgroundImageView: UIImageView = {
               let imageView = UIImageView()
               imageView.translatesAutoresizingMaskIntoConstraints = false
               imageView.contentMode = .scaleAspectFill
               imageView.clipsToBounds = true
               imageView.image = UIImage(named: "backcover.jpeg")
               imageView.alpha = 0.3
               return imageView
           }()
           
           view.addSubview(backgroundImageView)
           NSLayoutConstraint.activate([
               backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
               backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
           ])
           setupUI()
           displayExerciseData()
           
           
       }
       
       private func setupUI() {
           // Create and configure UI elements
           exerciseImageView = UIImageView(frame: CGRect(x: 50, y: 100, width: 300, height: 250))
           view.addSubview(exerciseImageView)
           
           nameLabel = UILabel(frame: CGRect(x: 20, y: 370, width: view.frame.width - 40, height: 30))
           nameLabel.textAlignment = .center
           view.addSubview(nameLabel)
           
           muscleLabel = UILabel(frame: CGRect(x: 20, y: 390, width: view.frame.width - 40, height: 30))
           view.addSubview(muscleLabel)
           
           equipmentLabel = UILabel(frame: CGRect(x: 20, y: 410, width: view.frame.width - 40, height: 30))
           view.addSubview(equipmentLabel)
           
           difficultyLabel = UILabel(frame: CGRect(x: 20, y: 430, width: view.frame.width - 40, height: 30))
           view.addSubview(difficultyLabel)
           
           instructionsLabel = UILabel(frame: CGRect(x: 20, y: 450, width: view.frame.width - 40, height: 250))
           instructionsLabel.numberOfLines = 0
           view.addSubview(instructionsLabel)
           
           nextButton = UIButton(type: .system)
           nextButton.frame = CGRect(x: 100, y: 740, width: 200, height: 30)
           nextButton.setTitle("Start Exercises", for: .normal)
           nextButton.setTitleColor(.green, for: .normal)
           nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
           view.addSubview(nextButton)
       }
       
       private func displayExerciseData() {
           // Display exercise data in UI elements
           exerciseImageView.image = exerciseImage
           nameLabel.text = exerciseName
           muscleLabel.text = "Muscle: \(muscle)"
           equipmentLabel.text = "Equipment: \(equipment)"
           difficultyLabel.text = "Difficulty Level: \(difficultyLevel)"
           instructionsLabel.text = "Instructions: \(instructions)"
       }
       
       @objc private func nextButtonTapped() {
           // Perform any actions needed before navigating to the next UI
           
           // Navigate to the next UI (replace with your own view controller class and navigation code)
           let nextViewController = ExerciseViewController()
           navigationController?.pushViewController(nextViewController, animated: true)
           
       }
   }
