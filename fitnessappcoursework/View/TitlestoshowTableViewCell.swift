//
//  TitlestoshowTableViewCell.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-03-09.
//

import UIKit

class TitlestoshowTableViewCell: UITableViewCell {

    static let identify = "TitlestoshowTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
    }
    
   
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
