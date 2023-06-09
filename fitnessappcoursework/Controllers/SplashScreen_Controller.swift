//
//  SplashScreen_Controller.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-04-18.
//

import UIKit

class SplashScreen_Controller: UIViewController {
    
    private let imageView : UIImageView = {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 450, height: 950))
        imageView.image = UIImage(named: "main")
        return imageView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
            
        })
        
    }
    
    private func animate()
    {
        UIView.animate(withDuration: 2, animations: {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size
            )
            
        })
        
        UIView.animate(withDuration: 2, animations: {
            self.imageView.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
                   let viewController = BiometricAuth()
                   viewController.modalTransitionStyle = .crossDissolve
                   viewController.modalPresentationStyle = .fullScreen
                   self.present(viewController, animated: true)
                    
                    
                })
                }
        })
    }
}
