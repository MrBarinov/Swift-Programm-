//
//  FriendCell.swift
//  proj1
//
//  Created by Nick on 06/12/2023.
//

import UIKit

final class FriendCell: UITableViewCell {
    private var photo: UIImageView = {
        let photo = UIImageView(image: UIImage(systemName: "person"))
        photo.layer.cornerRadius = 25
        photo.layer.borderWidth = 1
        photo.clipsToBounds = true
        return photo
    }()
    
    private var name: UILabel = {
        let name = UILabel()
        name.text = "Name"
        name.textAlignment = .center
        return name
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let customFontSize = UIFont.systemFont(ofSize: 20)
    
    private func setupViews() {
        contentView.addSubview(photo)
        name.font = customFontSize
        contentView.addSubview(name)
        setupConstraints()
    }
    
    private func setupConstraints() {
        photo.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            photo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            photo.widthAnchor.constraint(equalToConstant: 50),
            photo.heightAnchor.constraint(equalTo: photo.widthAnchor),
            
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            //name.centerYAnchor.constraint(equalTo: photo.centerYAnchor),
            name.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
