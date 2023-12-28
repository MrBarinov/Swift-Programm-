//
//  DataProvider.swift
//  proj1
//
//  Created by Nick on 22/12/2023.
//

import Foundation
import CoreData

protocol DataProviderProtocol {
    func save()
    func addFriends(friends: [Friend])
    func getFriends() -> [Friend]
    func addFriendsDate()
    func getFriendsDate() -> Date?
    func addGroups(groups: [Group])
    func getGroups() -> [Group]
    func addGroupsDate()
    func getGroupsDate() -> Date?
}

final class DataProvider: DataProviderProtocol {
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores(completionHandler: {(_, error) in
            if let error = error {
                print(error)
            }
        })
        return persistentContainer
    }()
    
    func save() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                print(error)
            }
        }
    }
    
    func addFriends(friends: [Friend]) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendModel")
        for friend in friends {
            fetchRequest.predicate = NSPredicate(format: "id = %@", argumentArray: [friend.id])
            let result = try? persistentContainer.viewContext.fetch(fetchRequest)
            guard result?.first == nil else {
                continue
            }
            let friendModel = FriendModel(context: persistentContainer.viewContext)
            friendModel.id = Int64(friend.id)
            friendModel.firstName = friend.firstName
            friendModel.lastName = friend.lastName
            friendModel.photo = friend.photo
            friendModel.online = Int64(friend.online ?? 0)
        }
        save()
        addFriendsDate()
    }
    
    func getFriends() -> [Friend] {
        let fetchRequest: NSFetchRequest<FriendModel> = FriendModel.fetchRequest()
        guard let friends = try? persistentContainer.viewContext.fetch(fetchRequest) else {
            return []
        }
        var newFriends: [Friend] = []
        for friend in friends {
            newFriends.append(Friend(id: Int(friend.id), firstName: friend.firstName, lastName: friend.lastName, photo: friend.photo, online: Int(friend.online)))
        }
        return newFriends
    }
    
    func addFriendsDate() {
        //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendsDate")
        let date = FriendsDate(context: persistentContainer.viewContext)
        date.date = Date()
        save()
    }
    
    func getFriendsDate() -> Date? {
        let fetchRequest: NSFetchRequest<FriendsDate> = FriendsDate.fetchRequest()
        guard let date = try? persistentContainer.viewContext.fetch(fetchRequest) else {
            return nil
        }
        return date.first?.date
    }
    
    func addGroups(groups: [Group]) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GroupModel")
        for group in groups {
            fetchRequest.predicate = NSPredicate(format: "id = %@", argumentArray: [group.id])
            let result = try? persistentContainer.viewContext.fetch(fetchRequest)
            guard  result?.first == nil else {
                continue
            }
            let groupModel = GroupModel(context: persistentContainer.viewContext)
            groupModel.id = Int64(group.id)
            groupModel.name = group.name
            groupModel.caption = group.description
            groupModel.photo = group.photo
        }
        save()
        addGroupsDate()
    }
    
    func getGroups() -> [Group] {
        let fetchRequest: NSFetchRequest<GroupModel> = GroupModel.fetchRequest()
        guard let groups = try? persistentContainer.viewContext.fetch(fetchRequest) else {
            return []
        }
        var newGroups: [Group] = []
        for group in groups {
            newGroups.append(Group(id: Int(group.id), name: group.name, description: group.caption, photo: group.photo))
        }
        return newGroups
    }
    
    func addGroupsDate() {
        //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GroupsDate")
        let date = GroupsDate(context: persistentContainer.viewContext)
        date.date = Date()
        save()
    }
    
    func getGroupsDate() -> Date? {
        let fetchRequest: NSFetchRequest<GroupsDate> = GroupsDate.fetchRequest()
        guard let date = try? persistentContainer.viewContext.fetch(fetchRequest) else {
            return nil
        }
        return date.first?.date
    }
}
