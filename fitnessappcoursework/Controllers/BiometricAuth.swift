//
//  BiometricAuth.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-04-18.
//

import UIKit
import LocalAuthentication

class BiometricAuth: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Authorize", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        
        
    }
    
    @objc func didTapButton(){
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
            
            let reason = "Please authorize with touch ID "
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    
                        guard success, error == nil else {
                            //failed
                            
                            let alert = UIAlertController(title: "Fail to authenticate", message: "Please try again", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler: nil))
                            self?.present(alert,animated: true)
                            return
                        }
                        
                        //other screen
                        //success
                    let vc = UIViewController()
                    vc.title = "Welcome"
                    vc.view.backgroundColor = .systemBlue
                    self?.present(UINavigationController(rootViewController: HomeViewController()),
                    animated: true, completion: nil)
                }
            }
        }
        
        else if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Please authorize with touch ID "
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    
                        guard success, error == nil else {
                            //failed
                            
                            let alert = UIAlertController(title: "Fail to authenticate", message: "Please try again", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler: nil))
                            self?.present(alert,animated: true)
                            return
                        }
                        
                        //other screen
                        //success
                    let vc = UIViewController()
                    vc.title = "Welcome"
                    vc.view.backgroundColor = .systemBlue
                    self?.present(UINavigationController(rootViewController: HomeViewController()),
                    animated: true, completion: nil)
                }
            }

            
        }
        
        else {
            //cannot use
            let alert = UIAlertController(title: "Unavailable", message: "You cannnot use this feature", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler: nil))
            present(alert,animated: true)
        }
    }
    
}
