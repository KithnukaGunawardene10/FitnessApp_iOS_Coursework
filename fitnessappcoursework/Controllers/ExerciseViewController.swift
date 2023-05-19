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
       let titleLabel = UILabel()
       
       var countdownTime: TimeInterval = 0
       var countdownTimer: Timer?
    
       let playVideoButton = UIButton(type: .system)
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "camo.jpg")
        return imageView
    }()
    
    
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .black
           view.addSubview(backgroundImageView)
           // Configure and add UI components to the view
           
        
           
           
             titleLabel.text = "Let's Exercise"
             titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
             titleLabel.textAlignment = .center
             titleLabel.translatesAutoresizingMaskIntoConstraints = false
             
             view.addSubview(titleLabel)

           
           // Rep Count Label
           repCountLabel.translatesAutoresizingMaskIntoConstraints = false
           repCountLabel.text = "Number of Reps to be done : 10"
           view.addSubview(repCountLabel)
           
           // Time Scheduled Label
           timeScheduledLabel.translatesAutoresizingMaskIntoConstraints = false
           timeScheduledLabel.text = "Time Scheduled: 10 minutes"
           view.addSubview(timeScheduledLabel)
           
           // Countdown Label
           countdownLabel.translatesAutoresizingMaskIntoConstraints = false
           countdownLabel.text = "below are the effecting areas"
           view.addSubview(countdownLabel)
           
           // Body Part Image View
           bodyPartImageView.translatesAutoresizingMaskIntoConstraints = false
           bodyPartImageView.image = UIImage(named: "cms")
           view.addSubview(bodyPartImageView)
           
           // Start Button
           startButton.translatesAutoresizingMaskIntoConstraints = false
           startButton.setTitle("Move to Countdown", for: .normal)
           startButton.setTitleColor(.green, for: .normal)
           startButton.addTarget(self, action: #selector(startCountdown), for: .touchUpInside)
           view.addSubview(startButton)
           
           playVideoButton.translatesAutoresizingMaskIntoConstraints = false
           playVideoButton.setTitle("Play Workout Video", for: .normal)
           playVideoButton.setTitleColor(.green, for: .normal)
           playVideoButton.addTarget(self, action: #selector(playWorkoutVideo), for: .touchUpInside)
           view.addSubview(playVideoButton)

           
           
           // Set up constraints
           
           NSLayoutConstraint.activate([
            
            
                backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           
            repCountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            repCountLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
               
               timeScheduledLabel.topAnchor.constraint(equalTo: repCountLabel.bottomAnchor, constant: 28),
               timeScheduledLabel.leadingAnchor.constraint(equalTo: repCountLabel.leadingAnchor),
               
               countdownLabel.topAnchor.constraint(equalTo: timeScheduledLabel.bottomAnchor, constant: 28),
               countdownLabel.leadingAnchor.constraint(equalTo: repCountLabel.leadingAnchor),
               
               bodyPartImageView.topAnchor.constraint(equalTo: countdownLabel.bottomAnchor, constant: 36),
               bodyPartImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               bodyPartImageView.widthAnchor.constraint(equalToConstant: 400),
               bodyPartImageView.heightAnchor.constraint(equalToConstant: 250),
               
               startButton.topAnchor.constraint(equalTo: bodyPartImageView.bottomAnchor, constant: 36),
               startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               
               playVideoButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 36),
                  playVideoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           ])
       }
       
    @objc func startCountdown() {
        let TimerViewController = TimerViewController()
        navigationController?.pushViewController(TimerViewController, animated: true)
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
           guard let videoURL = URL(string: "https://www.youtube.com/watch?v=e9KM8ns3aXk") else {
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
