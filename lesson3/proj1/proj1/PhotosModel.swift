//
//  PhotosModel.swift
//  proj1
//
//  Created by Nick on 09/12/2023.
//

struct PhotosModel: Decodable {
    var response: PhotoResponse
}

struct PhotoResponse: Decodable {
    var items: [Photo]
}

struct Photo: Decodable {
    var sizes: [Sizes]
}

struct Sizes: Decodable {
    var url: String
}
