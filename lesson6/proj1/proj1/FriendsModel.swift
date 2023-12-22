//
//  FriendsModel.swift
//  proj1
//
//  Created by Nick on 09/12/2023.
//

struct FriendsModel: Decodable {
    var response: FriendsResponse
}

struct FriendsResponse: Decodable {
    var items: [Friend]
}

struct Friend: Decodable {
    var id: Int
    var firstName: String?
    var lastName: String?
    var photo: String?
    var online: Int?
    var bigPhoto: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
        case online
        case bigPhoto = "photo_200"
    }
}
