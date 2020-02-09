//
//  WelcomeScreen.swift
//  MovieSearchingAppUITests
//
//  Created by e.goncharenko on 09/02/2020.
//  Copyright © 2020 Pyi Theim Kyaw. All rights reserved.
//

import XCTest

class WelcomeScreen {
    let app: XCUIApplication
    
    var getStartedButton: XCUIElement {
        return app.buttons["Get Started"]
    }
    
    var aboutButton: XCUIElement {
        return app.buttons["About"]
    }
    
    init (_ app: XCUIApplication) {
        self.app = app
    }
}

