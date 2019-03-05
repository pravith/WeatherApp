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
    
    var sessionUnderTest: URLSession!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }
    override func tearDown() {
        sessionUnderTest = nil
        super.tearDown()
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
    
    // Fuctional Test:Asynchronous test for API reachable or not
    func testValidCallToiTunesGetsHTTPStatusCode200() {
        let url = URL(string: "https://darksky.net/forecast/40.7127,-74.0059/us12/en")
        let promise = expectation(description: "Status code: 200")
        
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
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

