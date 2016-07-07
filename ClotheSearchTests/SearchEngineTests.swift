//
//  SearchEngineTests.swift
//  ClotheSearch
//
//  Created by Libranner Leonel Santos Espinal on 7/7/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import XCTest
@testable import ClotheSearch

class SearchEngineTests: XCTestCase {
    
    let engine = SearchEngine()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchReturnsResultsSeparated() {
        let result = engine.search("Gap Floral Pants")
        XCTAssertEqual(result.searchQuery, "Floral")
        XCTAssertEqual(result.brands.count, 1)
        XCTAssertEqual(result.clothingTypes.count, 1)
    }
    
    func testSearchReturnsResultsUsingUppercase() {
        let result = engine.search("Gap FLORAL PAnts")
        XCTAssertEqual(result.brands.count, 1)
        XCTAssertEqual(result.clothingTypes.count, 1)
    }
    
    func testSearchReturnsOnlySearchQuery() {
        let searchQuery = "Not in database"
        
        let result = engine.search(searchQuery)
        XCTAssertEqual(result.searchQuery, searchQuery)
        XCTAssertEqual(result.brands.count, 0)
        XCTAssertEqual(result.clothingTypes.count, 0)
    }
    
}
