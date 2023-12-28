//
//  Theme.swift
//  proj1
//
//  Created by Nick on 22/12/2023.
//

import UIKit

protocol AppTheme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

final class Theme {
    static var currentTheme: AppTheme = WhiteTheme()
}

final class WhiteTheme: AppTheme {
    var backgroundColor: UIColor = .white
    var textColor: UIColor = .black
}

final class BlueTheme: AppTheme {
    var backgroundColor: UIColor = UIColor(red: 76/255, green: 117/255, blue: 163/255, alpha: 1)
    var textColor: UIColor = .white
}

final class BlackTheme: AppTheme {
    var backgroundColor: UIColor = UIColor(red: 5/255, green: 5/255, blue:5/255, alpha: 1)
    var textColor: UIColor = .white
}
