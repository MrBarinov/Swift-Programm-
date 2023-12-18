//
//  ProfileCell.swift
//  proj1
//
//  Created by Nick on 16/12/2023.
//

import UIKit

final class ProfileCell: UITableViewCell {
    private var photo: UIImageView = {
        let photo = UIImageView(image: UIImage(systemName: "person"))
        photo.layer.cornerRadius = 100
        photo.layer.borderWidth = 1
        photo.layer.borderColor = CGColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
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
    
    func setupData(profile: Profile) {
        name.text = (profile.firstName ?? "") + " " + (profile.lastName ?? "")

        DispatchQueue.global().async {
            if let url = URL(string: profile.photo ?? ""), let data = try? Data(contentsOf: url) {
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
        setupConstraints()
    }
    
    private func setupConstraints() {
        photo.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            photo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photo.widthAnchor.constraint(equalToConstant: 200),
            photo.heightAnchor.constraint(equalTo: photo.widthAnchor),
            
            name.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 20),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
}
