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
    var firstName: String?
    var lastName: String?
    var photo: String?
    var online: Int?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
        case online
    }
}
