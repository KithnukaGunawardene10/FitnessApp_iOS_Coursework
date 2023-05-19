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
        let vc2 = UINavigationController(rootViewController: ExerciseViewController())
        let vc3 = UINavigationController(rootViewController: DiscoverViewController())
        let vc4 = UINavigationController(rootViewController: ScheduleViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house" )
        vc2.tabBarItem.image = UIImage(systemName: "Dumbell" )
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass" )
        vc4.tabBarItem.image = UIImage(systemName: "play.rectangle" )
        
        vc1.title = "Home"
        vc2.title = "Exercise"
        vc3.title = "Search"
        vc4.title = "Schedule"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
        
        
        
        
        
        
        
        
    }
    

   

}
