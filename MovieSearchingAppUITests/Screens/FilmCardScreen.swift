//
//  FilmCardScreen.swift
//  MovieSearchingAppUITests
//
//  Created by e.goncharenko on 09/02/2020.
//  Copyright © 2020 Pyi Theim Kyaw. All rights reserved.
//

import XCTest

class FilmCardScreen {
    let app: XCUIApplication
    
    var addButton: XCUIElement {
        return app.buttons["Add"]
    }
    
    var movieName: String{
        return app.staticTexts["movieName"].label
    }
    
    var movieDescription: String{
        return app.staticTexts["movieDescription"].value as! String
    }
    
    init (_ app: XCUIApplication) {
        self.app = app
    }
}
