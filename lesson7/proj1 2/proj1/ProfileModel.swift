//
//  ProfileModel.swift
//  proj1
//
//  Created by Nick on 16/12/2023.
//

import Foundation

struct ProfileModel: Decodable {
    var response: Profile
}

struct Profile: Decodable {
    var photo: String?
    var firstName: String?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case photo = "photo_200"
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
