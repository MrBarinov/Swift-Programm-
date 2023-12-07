//
//  PhotoCell.swift
//  proj1
//
//  Created by Nick on 06/12/2023.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    private var imageView = UIImageView(image: UIImage(systemName: "person"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(imageView)
        setupConstraints()
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: frame.size.width/2),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }}
