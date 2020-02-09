//
//  MovieSearchingAppUITests.swift
//  MovieSearchingAppUITests
//
//  Created by Pyi Theim Kyaw on 10/20/18.
//  Copyright © 2018 Pyi Theim Kyaw. All rights reserved.
//

import XCTest

class MovieSearchingAppUITests: XCTestCase {
    let app = XCUIApplication()
    let testMovieName: String = "Nocturnal Animals"
    var movies :[Movie] = []
    
    override func setUp() {
        super.setUp()
        getInfoAboutFilm(name: testMovieName)
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        app.tabBars.buttons["Favorites"].tap()
        app.buttons["Clear All"].tap()
        app.buttons["Delete"].tap()
        super.tearDown()
    }
    
    func testSearchFilmByName() {
        WelcomeScreen(app).getStartedButton.tap()
        SearchScreen(app).searchMovieByName(testMovieName)
        app.staticTexts[testMovieName].tap()
        let movie: Movie = movies[0]
        XCTAssertEqual(movies[0].title, testMovieName)
        XCTAssertEqual(FilmCardScreen(app).movieName, testMovieName)
        XCTAssertEqual(FilmCardScreen(app).movieDescription, movie.overview)
        FilmCardScreen(app).addButton.tap()
        XCTAssertTrue(app.staticTexts["Added!"].exists)
        app.alerts.buttons["OK"].tap()
        app.tabBars.buttons["Favorites"].tap()
        XCTAssertTrue(app.tables.staticTexts[testMovieName].isEnabled)
    }
    
    func getInfoAboutFilm(name: String) {
        let toArray = name.components(separatedBy: " ")
        let backToString = toArray.joined(separator: "+")
        DispatchQueue.global().async{
            let apiURL = "https://api.themoviedb.org/3/search/movie?api_key=24eeffd4c92654f6ca7d47d410cbfac3&query=" + backToString
            let databaseURL = URL(string: apiURL)
            let tryData = try! Data(contentsOf: databaseURL!)
            let tryResults = try! JSONDecoder().decode(APIResults.self, from: tryData)
            self.movies = tryResults.results
        }
    }
}
