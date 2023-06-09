//
//  HomeViewController.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-03-08.
//

import UIKit
import WidgetKit

class HomeViewController: UIViewController {
    
  
    
    let Titles: [String] = ["Exercises","Meals","Routines","personalize","More"]
    
    private let homefeedTable  : UITableView = {
        let table = UITableView(frame: .zero , style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(homefeedTable)
        
        homefeedTable.delegate = self
        homefeedTable.dataSource = self
        
        let headerView = HeaderUIView(frame: CGRect(x:0, y: 0, width: view.bounds.width, height: 450))
        homefeedTable.tableHeaderView = headerView
        
        Navbarappearance()
        
    }
    
    
    private func Navbarappearance() {
        
        var Image = UIImage(named: "Logo")
        Image = Image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: #selector(ProfileButtonTapped)),
            UIBarButtonItem(image: UIImage(systemName: "hourglass"), style: .done, target: self, action:#selector(ButtonTapped) ),
            UIBarButtonItem(image: UIImage(systemName: "figure.mixed.cardio"), style: .done, target: self, action:#selector(BMIButtonTapped) )
        ]
        
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homefeedTable.frame =  view.bounds
    }
    
    @objc private func ButtonTapped() {
            let reminderViewController = ReminderViewController()
                 navigationController?.pushViewController(reminderViewController, animated: true)
        
        
    }
    
    @objc private func ProfileButtonTapped() {
            let profileViewController = ProfileViewController()
                 navigationController?.pushViewController(profileViewController, animated: true)
        
        
    }
    
    @objc private func BMIButtonTapped() {
            let BMIViewController = BMIValueViewController()
                 navigationController?.pushViewController(BMIViewController, animated: true)
        
        
    }
    
    
}
    
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Titles.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultoffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultoffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0 , y: min(0, -offset))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Titles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 19, weight: .semibold)
        header.textLabel?.frame = CGRect(x:header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        
        
        
    }
    
}

