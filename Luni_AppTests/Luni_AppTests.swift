//
//  Luni_AppTests.swift
//  Luni_AppTests
//
//  Created by Boubakar Traore on 20/06/2022.
//

import XCTest
@testable import Luni_App

class Luni_AppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_home() throws {
        let homeViewModel = HomeViewModel()
        
        XCTAssertEqual(homeViewModel.favoriteTitle, "Favorite meditations")
        XCTAssertEqual(homeViewModel.favoriteCourse, "10 Courses")
    }
    
    func test_favorite() throws {
        
        let meditation = FavoriteMeditations.init()
        
        XCTAssertEqual(meditation.title, "Favorite meditations")
        XCTAssertEqual(meditation.courseNumber, 7)
        XCTAssertEqual(meditation.meditationsList[0].title, "Brief beginner meditation")
        XCTAssertEqual(meditation.meditationsList[0].level, Level.BEGINNER)
        XCTAssertEqual(meditation.meditationsList[1].title, "Inner breath and mindfullness")
        XCTAssertEqual(meditation.meditationsList[1].level, Level.ADVANCED)
        
    }

}
