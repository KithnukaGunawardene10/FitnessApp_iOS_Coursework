//
//  HeaderUIView.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-03-08.
//

import UIKit

class HeaderUIView: UIView {
    
    private let playbutton: UIButton = {
        let button = UIButton()
        button.setTitle("Enjoy", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()

    private let heroImageview : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Header")
        return imageView
        
    }()
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageview)
        addGradient()
        addSubview(playbutton)
        applyConstraints()
    }
    
    private func applyConstraints(){
        let playbuttonConstraints = [
            playbutton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
            playbutton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playbutton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(playbuttonConstraints)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageview.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
