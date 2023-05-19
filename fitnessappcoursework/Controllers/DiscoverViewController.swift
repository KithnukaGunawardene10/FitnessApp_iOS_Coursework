//
//  DiscoverViewController.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-03-08.
//

import UIKit

class DiscoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.addSubview(discoverTabele)
        
        
        view.addSubview(discoverTabele)

        discoverTabele.delegate = self
        discoverTabele.dataSource = self
        
        
        navigationItem.searchController = searchcontroller
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTabele.frame = view.bounds
        
    
    }
    
    
    private let discoverTabele : UITableView = {
        let Table = UITableView()
        Table.register(TitlestoshowTableViewCell.self, forCellReuseIdentifier: TitlestoshowTableViewCell.identify)
        return Table
    }()

    private let searchcontroller : UISearchController = {
        let controllerforsearch = UISearchController(searchResultsController: ResultsbySearchViewController())
        controllerforsearch.searchBar.placeholder = "Search for a Exercise,diet plans etc...."
        controllerforsearch.searchBar.searchBarStyle = .minimal
        return controllerforsearch
    }()

    
    
    

}

extension DiscoverViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = "test"
        
        return cell;
    }
}
