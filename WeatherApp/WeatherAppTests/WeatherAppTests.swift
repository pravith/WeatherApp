//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Arun PK on 3/4/19.
//  Copyright © 2019 pravith. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    //button should have title "Submit"
    func test_button_title_is_Submit() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let login = storyboard.instantiateInitialViewController() as! ViewController
        let _ = login.view
        XCTAssertEqual("Submit",login.fetchWeatherDataButton!.titleLabel?.text!)
    }
    
    //Textfield should have placeholder "Latitude"
    func test_latitude_placeholder_is_Latitude() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let login = storyboard.instantiateInitialViewController() as! ViewController
        let _ = login.view
        XCTAssertEqual("Latitude", login.latitudeTxtField!.placeholder!)
        
    }
    
    //Textfield should have placeholder "Longitude"
    func test_logitude_placeholder_is_Longitude() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let login = storyboard.instantiateInitialViewController() as! ViewController
        let _ = login.view
        XCTAssertEqual("Longitude", login.logitudeTxtField!.placeholder!)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

