//
//  PhotoCell.swift
//  proj1
//
//  Created by Nick on 06/12/2023.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    private var imageView = UIImageView(image: UIImage(systemName: "photo"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupPhoto(photo: Photo) {
        DispatchQueue.global().async {
            if let url = URL(string: photo.sizes[0].url ?? ""), let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func setupViews() {
        addSubview(imageView)
        setupConstraints()
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            //imageView.widthAnchor.constraint(equalToConstant: frame.size.width/2),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }}
