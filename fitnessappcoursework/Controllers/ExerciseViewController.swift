//
//  ExerciseViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-17.
//

import UIKit
import AVKit

class ExerciseViewController: UIViewController {

    private var repCountLabel: UILabel!
        private var timeLabel: UILabel!
        private var videoPlayerView: UIView!
        private var bodyPartSegmentedControl: UISegmentedControl!
        
        private var player: AVPlayer?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Configure the rep count label
            repCountLabel = UILabel()
            repCountLabel.textAlignment = .center
            repCountLabel.font = UIFont.systemFont(ofSize: 24)
            repCountLabel.text = "0"
            view.addSubview(repCountLabel)
            
            // Configure the time label
            timeLabel = UILabel()
            timeLabel.textAlignment = .center
            timeLabel.font = UIFont.systemFont(ofSize: 18)
            timeLabel.text = "00:00"
            view.addSubview(timeLabel)
            
            // Configure the video player view
            videoPlayerView = UIView()
            view.addSubview(videoPlayerView)
            
            // Configure the segmented control for body parts
            bodyPartSegmentedControl = UISegmentedControl(items: ["Upper Body", "Lower Body"])
            bodyPartSegmentedControl.selectedSegmentIndex = 0
            bodyPartSegmentedControl.addTarget(self, action: #selector(bodyPartSelected(_:)), for: .valueChanged)
            view.addSubview(bodyPartSegmentedControl)
            
            // Set up autolayout constraints
            setupConstraints()
            
            // Load and play the workout video for the initial selected body part
            playWorkoutVideo(for: bodyPartSegmentedControl.selectedSegmentIndex)
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            // Update the frame of the video player view to match the view's bounds
            videoPlayerView.frame = view.bounds
        }
        
        private func setupConstraints() {
            // Disable autoresizing mask translation
            repCountLabel.translatesAutoresizingMaskIntoConstraints = false
            timeLabel.translatesAutoresizingMaskIntoConstraints = false
            videoPlayerView.translatesAutoresizingMaskIntoConstraints = false
            bodyPartSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
            
            // Add constraints for rep count label
            repCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            repCountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
            
            // Add constraints for time label
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            timeLabel.topAnchor.constraint(equalTo: repCountLabel.bottomAnchor, constant: 8).isActive = true
            
            // Add constraints for video player view
            videoPlayerView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 20).isActive = true
            videoPlayerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            videoPlayerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            videoPlayerView.bottomAnchor.constraint(equalTo: bodyPartSegmentedControl.topAnchor, constant: -20).isActive = true
            
            // Add constraints for body part segmented control
            bodyPartSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
            bodyPartSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
            bodyPartSegmentedControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        }
        
        @objc private func bodyPartSelected(_ sender: UISegmentedControl) {
            let selectedBodyPartIndex = sender.selectedSegmentIndex
            playWorkoutVideo(for: selectedBodyPartIndex)
        }
        
        private func playWorkoutVideo(for bodyPartIndex: Int) {
            let workoutVideoURLString: String
            switch bodyPartIndex {
            case 0: // Upper Body
                workoutVideoURLString = "https://www.youtube.com/watch?v=rrWddYNTwNI"
            case 1: // Lower Body
                workoutVideoURLString = "https://www.youtube.com/watch?v=Cq8xjqDLPKg"
            default:
                return
            }
            
            if let videoURL = URL(string: workoutVideoURLString) {
                player = AVPlayer(url: videoURL)
                
                let playerLayer = AVPlayerLayer(player: player)
                playerLayer.videoGravity = .resizeAspectFill
                videoPlayerView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
                videoPlayerView.layer.addSublayer(playerLayer)
                
                player?.play()
            }
        }
}
