//
//  ExerciseViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-17.
//

import UIKit
import AVKit

class ExerciseViewController: UIViewController {

    // UI components
       let repCountLabel = UILabel()
       let timeScheduledLabel = UILabel()
       let countdownLabel = UILabel()
       let bodyPartImageView = UIImageView()
       let startButton = UIButton(type: .system)
       
       var countdownTime: TimeInterval = 0
       var countdownTimer: Timer?
    
       let playVideoButton = UIButton(type: .system)
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .black
           
           // Configure and add UI components to the view
           
           // Rep Count Label
           repCountLabel.translatesAutoresizingMaskIntoConstraints = false
           repCountLabel.text = "Reps: 10"
           view.addSubview(repCountLabel)
           
           // Time Scheduled Label
           timeScheduledLabel.translatesAutoresizingMaskIntoConstraints = false
           timeScheduledLabel.text = "Time Scheduled: 10 minutes"
           view.addSubview(timeScheduledLabel)
           
           // Countdown Label
           countdownLabel.translatesAutoresizingMaskIntoConstraints = false
           countdownLabel.text = "Countdown: 0"
           view.addSubview(countdownLabel)
           
           // Body Part Image View
           bodyPartImageView.translatesAutoresizingMaskIntoConstraints = false
           bodyPartImageView.image = UIImage(named: "bodypart_image")
           view.addSubview(bodyPartImageView)
           
           // Start Button
           startButton.translatesAutoresizingMaskIntoConstraints = false
           startButton.setTitle("Start Countdown", for: .normal)
           startButton.addTarget(self, action: #selector(startCountdown), for: .touchUpInside)
           view.addSubview(startButton)
           
           playVideoButton.translatesAutoresizingMaskIntoConstraints = false
           playVideoButton.setTitle("Play Workout Video", for: .normal)
           playVideoButton.addTarget(self, action: #selector(playWorkoutVideo), for: .touchUpInside)
           view.addSubview(playVideoButton)

           
           
           // Set up constraints
           
           NSLayoutConstraint.activate([
               repCountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
               repCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
               
               timeScheduledLabel.topAnchor.constraint(equalTo: repCountLabel.bottomAnchor, constant: 8),
               timeScheduledLabel.leadingAnchor.constraint(equalTo: repCountLabel.leadingAnchor),
               
               countdownLabel.topAnchor.constraint(equalTo: timeScheduledLabel.bottomAnchor, constant: 8),
               countdownLabel.leadingAnchor.constraint(equalTo: repCountLabel.leadingAnchor),
               
               bodyPartImageView.topAnchor.constraint(equalTo: countdownLabel.bottomAnchor, constant: 16),
               bodyPartImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               bodyPartImageView.widthAnchor.constraint(equalToConstant: 200),
               bodyPartImageView.heightAnchor.constraint(equalToConstant: 200),
               
               startButton.topAnchor.constraint(equalTo: bodyPartImageView.bottomAnchor, constant: 16),
               startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               
               playVideoButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 16),
                  playVideoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           ])
       }
       
       @objc func startCountdown() {
           guard let timeScheduledText = timeScheduledLabel.text else {
               return
           }
           
           let timeComponents = timeScheduledText.components(separatedBy: " ")
           guard timeComponents.count == 3, let timeValue = Int(timeComponents[2]) else {
               return
           }
           
           countdownTime = TimeInterval(timeValue * 60)
           updateCountdownLabel()
           
           countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
       }
       
       @objc func updateCountdown() {
           countdownTime -= 1
           
           if countdownTime <= 0 {
               countdownTimer?.invalidate()
               countdownTimer = nil
               // Handle countdown completion
           }
           
           updateCountdownLabel()
       }
       
       func updateCountdownLabel() {
           let minutes = Int(countdownTime) / 60
           let seconds = Int(countdownTime) % 60
           countdownLabel.text = String(format: "Countdown: %02d:%02d", minutes, seconds)
       }
       
       @objc func playWorkoutVideo() {
           guard let videoURL = URL(string: "https://www.example.com/workoutvideo.mp4") else {
               return
           }
           
           let player = AVPlayer(url: videoURL)
           let playerViewController = AVPlayerViewController()
           playerViewController.player = player
           present(playerViewController, animated: true) {
               player.play()
           }
       }
   }
