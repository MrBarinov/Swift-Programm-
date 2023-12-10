//
//  NetworkService.swift
//  proj1
//
//  Created by Nick on 09/12/2023.
//

import Foundation

final class NetworkService {
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    
    func getFriends() {
        let url = URL(string: "https://api.vk.com/method/friends.get?v=5.199&access_token=" + NetworkService.token + "&fields=first_name,last_name,photo_50")
        session.dataTask(with: url!) {
            (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let friends = try
                    JSONDecoder().decode(FriendsModel.self, from: data)
                print(friends)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getGroups() {
        let url = URL(string: "https://api.vk.com/method/groups.get?v=5.199&access_token=" + NetworkService.token + "&extended=1&fields=description")
        session.dataTask(with: url!) {
            (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let groups = try
                    JSONDecoder().decode(GroupsModel.self, from: data)
                print(groups)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getPhotos() {
        let url = URL(string: "https://api.vk.com/method/photos.get?v=5.199&access_token=" + NetworkService.token + "&album_id=profile")
        session.dataTask(with: url!) {
            (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let photos = try
                    JSONDecoder().decode(PhotosModel.self, from: data)
                print(photos)
            } catch {
                print(error)
            }
        }.resume()
    }
}
