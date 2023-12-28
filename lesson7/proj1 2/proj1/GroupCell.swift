//
//  GroupCell.swift
//  proj1
//
//  Created by Nick on 06/12/2023.
//

import UIKit

final class GroupCell: UITableViewCell {
    private var photo: UIImageView = {
        let photo = UIImageView(image: UIImage(systemName: "person.2"))
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
        name.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        name.textColor = Theme.currentTheme.textColor
        return name
    }()
    
    private var desc: UILabel = {
        let desc = UILabel()
        desc.text = "Description"
        desc.textAlignment = .center
        desc.font = UIFont.systemFont(ofSize: 16)
        desc.textColor = Theme.currentTheme.textColor
        desc.numberOfLines = 3
        return desc
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Theme.currentTheme.backgroundColor
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(group: Group) {
        name.text = group.name ?? ""
        desc.text = group.description ?? ""
        DispatchQueue.global().async {
            if let url = URL(string: group.photo ?? ""), let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.photo.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func setupViews() {
        contentView.addSubview(photo)
        contentView.addSubview(name)
        contentView.addSubview(desc)
        setupConstraints()
    }
    
    private func setupConstraints() {
        photo.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        desc.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            desc.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            //desc.centerYAnchor.constraint(equalTo: name.centerYAnchor),
            desc.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            desc.trailingAnchor.constraint(equalTo: name.trailingAnchor),
            desc.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
