//
//  ProfileViewController.swift
//  proj1
//
//  Created by Nick on 16/12/2023.
//

import UIKit

final class ProfileViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var model: ProfileModel = ProfileModel(response: Profile(photo: "", firstName: nil, lastName: nil))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
        navigationController?.navigationBar.barTintColor = Theme.currentTheme.backgroundColor
        title = "Профиль"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Theme.currentTheme.textColor]
        
        networkService.getProfileData { [weak self] profile in
            self?.model = profile
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Theme.currentTheme.textColor]
        self.tableView.reloadData()
    }
    
    /*override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProfileCell()
        cell.setupData(profile: model.response)
        cell.changeThemeTapped = { [weak self] in
            self?.navigationController?.pushViewController(ThemeViewController(), animated: true)
        }
        cell.backgroundColor = Theme.currentTheme.backgroundColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.size.height - (navigationController?.navigationBar.frame.size.height ?? 0)*2 - (self.tabBarController?.tabBar.frame.size.height ?? 0)
    }
    

}
