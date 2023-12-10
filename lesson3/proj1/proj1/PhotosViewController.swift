//
//  PhotosViewController.swift
//  proj1
//
//  Created by Nick on 06/12/2023.
//

import UIKit

final class PhotosViewController: UICollectionViewController  {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "Cell")
        title = "Фото"
        
        networkService.getPhotos()
    }
    
    /*override func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }*/
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        guard let cell = cell1 as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    //override func
}

