//
//  NewsModel.swift
//  proj3
//
//  Created by Nick on 16/12/2023.
//

struct NewsModel: Decodable {
    var results: [News]
}

struct News: Decodable, Identifiable {
    var id: Int
    var date: Double
    var title: String
    var text: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case date = "publication_date"
        case title
        case text = "body_text"
    }
}
