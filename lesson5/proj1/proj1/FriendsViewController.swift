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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        title = "Друзья"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(tap))
        
        tableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")
        
        networkService.getFriends { [weak self] friends in
            self?.models = friends
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
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        guard let cell = cell1 as? FriendCell else {
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.setupData(friend: model)
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
        animation.duration = 3
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.pushViewController(ProfileViewController(), animated: false)
    }
}
