//
//  GroupsModel.swift
//  proj1
//
//  Created by Nick on 09/12/2023.
//

struct GroupsModel: Decodable {
    var response: GroupsResponse
}

struct GroupsResponse: Decodable {
    var items: [Group]
}

struct Group: Decodable {
    var name: String?
    var description: String?
    var photo: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case photo = "photo_50"
    }
}
