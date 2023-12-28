//
//  FriendCell.swift
//  proj1
//
//  Created by Nick on 06/12/2023.
//

import UIKit

final class FriendCell: UITableViewCell {
    var selectFriend: ((String) -> Void)?
    
    private var photo: UIImageView = {
        let photo = UIImageView(image: UIImage(systemName: "person"))
        photo.layer.cornerRadius = 25
        photo.layer.borderWidth = 1
        photo.layer.borderColor = CGColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        photo.clipsToBounds = true
        return photo
    }()
    
    private var name: UILabel = {
        let name = UILabel()
        name.text = "Name"
        name.textAlignment = .center
        name.textColor = Theme.currentTheme.textColor
        return name
    }()
    
    private var onlineCircle: UIView = {
        let onlineCircle = UIView()
        onlineCircle.backgroundColor = .gray
        onlineCircle.layer.cornerRadius = 5
        return onlineCircle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Theme.currentTheme.backgroundColor
        setupViews()
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellTap))
        addGestureRecognizer(recognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(friend: Friend) {
        name.textColor = Theme.currentTheme.textColor
        name.text = (friend.firstName ?? "") + " " + (friend.lastName ?? "")
        if let online = friend.online {
            let isOnline = online == 1
            if isOnline {
                onlineCircle.backgroundColor = .green
            } else {
                onlineCircle.backgroundColor = .red
            }
        }
        DispatchQueue.global().async {
            if let url = URL(string: friend.photo ?? ""), let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.photo.image = UIImage(data: data)
                }
            }
        }
    }
    
    private let customFontSize = UIFont.systemFont(ofSize: 20)
    
    private func setupViews() {
        contentView.addSubview(photo)
        name.font = customFontSize
        contentView.addSubview(name)
        contentView.addSubview(onlineCircle)
        setupConstraints()
    }
    
    private func setupConstraints() {
        photo.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        onlineCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            photo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            photo.widthAnchor.constraint(equalToConstant: 50),
            photo.heightAnchor.constraint(equalTo: photo.widthAnchor),
            
            onlineCircle.centerYAnchor.constraint(equalTo: photo.centerYAnchor),
            onlineCircle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            onlineCircle.widthAnchor.constraint(equalToConstant: 10),
            onlineCircle.heightAnchor.constraint(equalTo: onlineCircle.widthAnchor),
            
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            //name.centerYAnchor.constraint(equalTo: photo.centerYAnchor),
            name.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: onlineCircle.trailingAnchor, constant: -10),
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    @objc func cellTap() {
        selectFriend?(name.text ?? "")
    }
}
