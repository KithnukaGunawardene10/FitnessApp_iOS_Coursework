//
//  MainTabViewController.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-03-08.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: DiscoverViewController())
        let vc3 = UINavigationController(rootViewController: InsightViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "Home" )
        vc2.tabBarItem.image = UIImage(systemName: "Diet" )
        vc3.tabBarItem.image = UIImage(systemName: "play" )
        vc4.tabBarItem.image = UIImage(systemName: "Notify" )
        
        vc1.title = "Home"
        vc2.title = "Diet"
        vc3.title = "play"
        vc4.title = "notify"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
        
        
        
        
        
        
        
        
    }
    

   

}
