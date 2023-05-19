//
//  TimerViewController.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-03-23.
//

import UIKit

class TimerViewController: UIViewController{
    
    var timer: Timer!
    var Seconds = 10.00
    
    
    let TimeLabel = UILabel()
    let startButton = UIButton()
    
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "time.jpg")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        TimeLabel.text = "10.00"
        TimeLabel.textAlignment = .center
        TimeLabel.textColor = .white
        TimeLabel.font = UIFont(name: "HelveticalNueue-Bold", size: 50)
        TimeLabel.frame = CGRect(x: view.frame.midX - 75, y: view.frame.midY - 150, width: 150, height: 40)
        self.view.addSubview(TimeLabel)

        
        
        startButton.frame = CGRect(x: view.frame.midX - 175, y: view.frame.midY - 50, width: 100, height: 100)
        
        viewSetUp()
    }
    
    
    
    private func viewSetUp()
    {
        let stopButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let restartButton = UIButton(frame: CGRect(x: self.view.frame.midX + 75, y: self.view.frame.midY - 50, width: 100, height: 100))
        
        startButton.backgroundColor = UIColor.white
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.titleLabel?.font = UIFont(name: "HelveticalNueue-Bold", size: 20)
        startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        startButton.layer.cornerRadius = 20
        
        stopButton.backgroundColor = UIColor.white
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(.black, for: .normal)
        stopButton.titleLabel?.font = UIFont(name: "HelveticalNueue-Bold", size: 20)
        stopButton.addTarget(self, action: #selector(stopAction), for: .touchUpInside)
        stopButton.center = self.view.center
        stopButton.layer.cornerRadius = 20
        
        restartButton.backgroundColor = UIColor.white
        restartButton.setTitle("Restart", for: .normal)
        restartButton.setTitleColor(.black, for: .normal)
        restartButton.titleLabel?.font = UIFont(name: "HelveticalNueue-Bold", size: 20)
        restartButton.addTarget(self, action: #selector(restartAction), for: .touchUpInside)
        restartButton.layer.cornerRadius = 20
        
        
        self.view.addSubview(startButton)
        self.view.addSubview(stopButton)
        self.view.addSubview(restartButton)
    }
    
    @objc func startAction(sender: UIButton)
    {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        startButton.isEnabled = false
    }
    
    @objc func stopAction(sender: UIButton)
    {
        timer.invalidate()
    }
    
    @objc func restartAction(sender: UIButton)
    {
        Seconds = 10.00
        TimeLabel.text = "10.00"
        timer.invalidate()
        
        
        
        startButton.isEnabled = true

    }
    
    
    @objc func updateTimer()
    {
        let myTimeFloat = String(format: "%.2f", Seconds)
        Seconds -= 0.01
        TimeLabel.text = myTimeFloat
        
        if Seconds <= 0.01{
            timer?.invalidate()
            Seconds = 10.00
            TimeLabel.text = "10.00"
            
            
            startButton.isEnabled = true

        }
        
    }
    
}
