//
//  FriendsViewController.swift
//  proj1
//
//  Created by Nick on 06/12/2023.
//

import UIKit

final class FriendsViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var models: [Friend] = []
    private let dataProvider = DataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        models = dataProvider.getFriends()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
        navigationController?.navigationBar.barTintColor = Theme.currentTheme.backgroundColor
        title = "Друзья"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(tap))
        
        tableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
        
        getFriends()
    }
    
    func getFriends() {
        networkService.getFriends { [weak self] result in
            switch result {
            case .success(let friends):
                self?.models = friends
                self?.dataProvider.addFriends(friends: friends)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.dataProvider.getFriends() ?? []
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
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        guard let cell = cell1 as? FriendCell else {
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.setupData(friend: model)
        cell.backgroundColor = Theme.currentTheme.backgroundColor
        cell.textLabel?.textColor = Theme.currentTheme.textColor
        
        //let fullName = (model.firstName ?? "") + " " + (model.lastName ?? "")
        //let photo = model.bigPhoto
        cell.isMultipleTouchEnabled = false
        cell.selectFriend = { [weak self] fullName in
            //let friendProfileViewController = FriendProfileViewController()
            //friendProfileViewController.friendName =
            //friendProfileViewController.friendPhoto = model.bigPhoto
            
            self?.navigationController?.pushViewController(FriendProfileViewController(name: fullName, photo: model.bigPhoto), animated: true)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    
}

private extension FriendsViewController {
    @objc func tap() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.type = .fade
        animation.duration = 1
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.pushViewController(ProfileViewController(), animated: false)
    }
    
    func showAlert() {
        let date = DateHelper.getDate(date: dataProvider.getFriendsDate())
        let alert = UIAlertController(title: "Не удалось получить данные", message: "Данные актуальны на \(date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func update() {
        networkService.getFriends { [weak self] result in
            switch result {
            case .success(let friends):
                self?.models = friends
                self?.dataProvider.addFriends(friends: friends)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.dataProvider.getFriends() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
            DispatchQueue.main.async {
                self?.refreshControl?.endRefreshing()
            }
        }
    }
}
