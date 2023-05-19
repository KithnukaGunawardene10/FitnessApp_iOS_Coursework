//
//  TitleViewController.swift
//  fitnessappcoursework
//
//  Created by K.M.Kithnuka Gunawardene on 2023-05-19.
//

import UIKit

class TitleViewController: UICollectionViewCell {

    static let identifier = "TitleViewController"
    
    private let posterimageview: UIImageView = {
      let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterimageview)
    }

    
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterimageview.frame = contentView.bounds
        
    }
    
    
}
