//
//  Helper.swift
//  proj3
//
//  Created by Nick on 16/12/2023.
//

import Foundation

final class Helper {
    static func getDate(date: Double) -> String {
        let currentDate = Date(timeIntervalSince1970: date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY"
        
        return dateFormatter.string(from: currentDate)
    }
}
