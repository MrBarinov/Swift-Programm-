//
//  DataProvider.swift
//  proj1Tests
//
//  Created by Nick on 26/12/2023.
//

import XCTest
@testable import proj1

final class DataProviderTests: XCTestCase {
    
    private var dataProvider: DataProviderProtocol!
    
    override func setUp() {
        super.setUp()
        dataProvider = DataProvider()
    }

    override func tearDown() {
        dataProvider = nil
        super.tearDown()
    }

    func testAddFriends() {
        let friend = [Friend(id: 1, firstName: "Nick", lastName: "Barinov", photo: "https://", online: 0, bigPhoto: "https://")]
        dataProvider.addFriends(friends: friend)
        
        let len = dataProvider.getFriends().count
        
        XCTAssertEqual(dataProvider.getFriends()[len-1].id, 1)
    }

    func testAddGroups() {
        let group = [Group(id: 1, name: nil, description: nil, photo: nil)]
        dataProvider.addGroups(groups: group)
        
        let len = dataProvider.getGroups().count
        
        XCTAssertEqual(dataProvider.getGroups()[len-1].id, 1)
    }

}
