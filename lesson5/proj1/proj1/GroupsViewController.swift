//
//  GroupsViewController.swift
//  proj1
//
//  Created by Nick on 06/12/2023.
//

import UIKit

final class GroupsViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var models: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        title = "Группы"
        
        tableView.register(GroupCell.self, forCellReuseIdentifier: "GroupCell")
        
        networkService.getGroups { [weak self] groups in
            self?.models = groups
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    /*override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
        guard let cell = cell1 as? GroupCell else {
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.setupData(group: model)
        return cell
    }
}
