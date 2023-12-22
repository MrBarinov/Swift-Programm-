//
//  NetworkService.swift
//  proj1
//
//  Created by Nick on 09/12/2023.
//

import Foundation

final class NetworkService {
    enum NetworkError: Error {
        case dataError
    }
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    
    func getFriends(completion: @escaping (Result<[Friend], Error>) -> Void) {
        let url = URL(string: "https://api.vk.com/method/friends.get?v=5.199&access_token=" + NetworkService.token + "&fields=first_name,last_name,photo_50,online,photo_200")
        session.dataTask(with: url!) {
            (data, _, error) in
            guard let data = data else {
                completion(.failure(NetworkError.dataError))
                return
            }
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let friends = try
                    JSONDecoder().decode(FriendsModel.self, from: data)
                completion(.success(friends.response.items))
                //print(friends)
            } catch {
                completion(.failure(NetworkError.dataError))
            }
        }.resume()
    }
    
    func getGroups(completion: @escaping(Result<[Group], Error>) -> Void) {
        let url = URL(string: "https://api.vk.com/method/groups.get?v=5.199&access_token=" + NetworkService.token + "&extended=1&fields=description")
        session.dataTask(with: url!) {
            (data, _, error) in
            guard let data = data else {
                completion(.failure(NetworkError.dataError))
                return
            }
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let groups = try
                    JSONDecoder().decode(GroupsModel.self, from: data)
                completion(.success(groups.response.items))
                //print(groups)
            } catch {
                completion(.failure(NetworkError.dataError))
            }
        }.resume()
    }
    
    func getPhotos(completion: @escaping([Photo]) -> Void) {
        let url = URL(string: "https://api.vk.com/method/photos.get?v=5.199&access_token=" + NetworkService.token + "&album_id=profile")
        session.dataTask(with: url!) {
            (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let photos = try
                    JSONDecoder().decode(PhotosModel.self, from: data)
                completion(photos.response.items)
                //print(photos)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getProfileData(comletion: @escaping(ProfileModel) -> Void) {
        let url = URL(string: "https://api.vk.com/method/account.getProfileInfo?v=5.199&access_token=" + NetworkService.token)
        session.dataTask(with: url!) {
            (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let profileData = try
                    JSONDecoder().decode(ProfileModel.self, from: data)
                comletion(profileData)
            } catch {
                print(error)
            }
        }.resume()
    }
}
