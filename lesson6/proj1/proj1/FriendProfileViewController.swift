//
//  FriendProfileViewController.swift
//  proj1
//
//  Created by Nick on 22/12/2023.
//

import UIKit

final class FriendProfileViewController: UITableViewController {
    
    private let networkService = NetworkService()
    var friendName: String
    var friendPhoto: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
        navigationController?.navigationBar.barTintColor = Theme.currentTheme.backgroundColor
        title = "Профиль"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Theme.currentTheme.textColor]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Theme.currentTheme.textColor]
        self.tableView.reloadData()
    }
    
    init(name: String, photo: String?) {
        friendName = name
        friendPhoto = photo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FriendProfileCell()
        cell.setupData(name: friendName, photo: friendPhoto)
        cell.backgroundColor = Theme.currentTheme.backgroundColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.size.height - (navigationController?.navigationBar.frame.size.height ?? 0)*2 - (self.tabBarController?.tabBar.frame.size.height ?? 0)
    }
    

}
