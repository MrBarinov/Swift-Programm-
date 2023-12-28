//
//  proj1UITests.swift
//  proj1UITests
//
//  Created by Nick on 26/12/2023.
//

import XCTest

class proj1UITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testOpenProfileAndGoBack() {
        
        let app = XCUIApplication()
        let webViewsQuery = app.webViews.webViews.webViews
        webViewsQuery/*@START_MENU_TOKEN@*/.textFields["Введите номер телефона"]/*[[".otherElements[\"VK ID\"].textFields[\"Введите номер телефона\"]",".textFields[\"Введите номер телефона\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        webViewsQuery/*@START_MENU_TOKEN@*/.textFields["Код из SMS"]/*[[".otherElements[\"VK ID\"].textFields[\"Код из SMS\"]",".textFields[\"Код из SMS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        webViewsQuery/*@START_MENU_TOKEN@*/.secureTextFields["Введите пароль"]/*[[".otherElements[\"VK ID\"].secureTextFields[\"Введите пароль\"]",".secureTextFields[\"Введите пароль\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Марина Литвинова"]/*[[".cells.staticTexts[\"Марина Литвинова\"]",".staticTexts[\"Марина Литвинова\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Профиль"].buttons["Друзья"].tap()
        
    }
}
