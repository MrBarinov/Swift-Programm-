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
    private let dataProvider = DataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        models = dataProvider.getGroups()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
        navigationController?.navigationBar.barTintColor = Theme.currentTheme.backgroundColor
        title = "Группы"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Theme.currentTheme.textColor]
        
        tableView.register(GroupCell.self, forCellReuseIdentifier: "GroupCell")
        
        getGroups()
    }
    
    func getGroups() {
        networkService.getGroups { [weak self] result in
            switch result {
            case .success(let groups):
                self?.models = groups
                self?.dataProvider.addGroups(groups: groups)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.dataProvider.getGroups() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
        navigationController?.navigationBar.barTintColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Theme.currentTheme.textColor]
        self.tableView.reloadData()
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
        cell.backgroundColor = Theme.currentTheme.backgroundColor
        return cell
    }
}

private extension GroupsViewController {
    func showAlert() {
        let date = DateHelper.getDate(date: dataProvider.getGroupsDate())
        let alert = UIAlertController(title: "Не удалось получить данные", message: "Данные актуальны на \(date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
