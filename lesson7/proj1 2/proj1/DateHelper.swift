//
//  DateHelper.swift
//  proj1
//
//  Created by Nick on 22/12/2023.
//

import Foundation

final class DateHelper {
    static func getDate(date: Date?) -> String {
        guard let date = date else {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY hh:mm:ss"
        
        return dateFormatter.string(from: date)
    }
}
