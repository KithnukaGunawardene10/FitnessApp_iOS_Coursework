//
//  JunctionViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-19.
//

import UIKit

class JunctionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
                let backgroundImageView: UIImageView = {
                    let imageView = UIImageView()
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    imageView.contentMode = .scaleAspectFill
                    imageView.clipsToBounds = true
                    imageView.image = UIImage(named: "cover.jpeg")
                    return imageView
                }()
                
                view.addSubview(backgroundImageView)
                NSLayoutConstraint.activate([
                    backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                    backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
                
                
                let labeltopic = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 30))
                labeltopic.text = "Welcome to Fabulous Fitness"
                labeltopic.font = UIFont.boldSystemFont(ofSize: 25)
                labeltopic.textAlignment = .center
                view.addSubview(labeltopic)
        
                let label = UILabel(frame: CGRect(x: 0, y: 170, width: view.frame.width, height: 50))
                label.text = "New memeber ?? "
                label.textColor = .yellow
                label.textAlignment = .center
                view.addSubview(label)
        
                let labelsign = UILabel(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 50))
                labelsign.text = "hit the sign up now"
                labelsign.textAlignment = .center
                view.addSubview(labelsign)
                            
                // Sign-in Button
                let signInButton = UIButton(type: .system)
                signInButton.frame = CGRect(x: 50, y: 250, width: view.frame.width - 100, height: 60)
                signInButton.setTitle("Sign In", for: .normal)
                signInButton.setTitleColor(.yellow, for: .normal)
                signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
                view.addSubview(signInButton)
                
                // Image
                let imageView = UIImageView(frame: CGRect(x: 0, y: 340, width: view.frame.width, height: 200))
                imageView.image = UIImage(named: "Logo")
                imageView.contentMode = .scaleAspectFit
                view.addSubview(imageView)
                
                // Another Label
                let anotherLabel = UILabel(frame: CGRect(x: 0, y: 580, width: view.frame.width, height: 30))
                anotherLabel.text = "Already a memeber ??? "
                anotherLabel.textColor = .yellow
                anotherLabel.textAlignment = .center
                view.addSubview(anotherLabel)
        
                let anotherLabel2 = UILabel(frame: CGRect(x: 0, y: 620, width: view.frame.width, height: 30))
                anotherLabel2.text = " hit the login and continue"
                anotherLabel2.textAlignment = .center
                view.addSubview(anotherLabel2)
                
                // Login Button
                let loginButton = UIButton(type: .system)
                loginButton.frame = CGRect(x: 50, y: 670, width: view.frame.width - 100, height: 40)
                loginButton.setTitle("Login", for: .normal)
                loginButton.setTitleColor(.yellow, for: .normal)
                loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
                view.addSubview(loginButton)
            }
            
            @objc func signInButtonTapped() {
                let destinationViewController = SignupViewController()
                    navigationController?.pushViewController(destinationViewController, animated: true)
            }
            
            @objc func loginButtonTapped() {
                let destinationViewController = LoginViewController()
                    navigationController?.pushViewController(destinationViewController, animated: true)
            }
            
}
