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
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        title = "Профиль"
        
        networkService.getProfileData { [weak self] profile in
            self?.model = profile
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
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
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.height
    }
}
