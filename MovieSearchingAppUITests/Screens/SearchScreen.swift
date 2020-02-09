//
//  SearchScreen.swift
//  MovieSearchingAppUITests
//
//  Created by e.goncharenko on 09/02/2020.
//  Copyright © 2020 Pyi Theim Kyaw. All rights reserved.
//

import XCTest

class SearchScreen {
    let app: XCUIApplication
    
    var searchField: XCUIElement {
        return app.textFields.firstMatch
    }
    
    var searchButton: XCUIElement {
        return app.buttons["search"]
    }
    
    func searchMovieByName(_ name: String){
        searchField.tap()
        app.typeText(name)
        searchButton.tap()
        _ = app.staticTexts[name].waitForExistence(timeout: 5)
    }
    
    init (_ app: XCUIApplication) {
        self.app = app
    }
}

