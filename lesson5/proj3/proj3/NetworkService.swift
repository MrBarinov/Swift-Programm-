//
//  NetworkService.swift
//  proj3
//
//  Created by Nick on 16/12/2023.
//

import Foundation

final class NetworkService {
    
    private let session = URLSession.shared
    
    func getNews(completion: @escaping([News]) -> Void) {
        let url = URL(string: "https://kudago.com/public-api/v1.2/news/?fields=id,publication_date,title,body_text&text_format=text&actual_only=true")

        session.dataTask(with: url!) {
            (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let news = try
                    JSONDecoder().decode(NewsModel.self, from: data)
                completion(news.results)
                //print(news)
            } catch {
                print(error)
            }
        }.resume()
    }
}
