//
//  SearchResultsControllerTests.swift
//  ClotheSearch
//
//  Created by Libranner Leonel Santos Espinal on 7/7/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import XCTest
@testable import ClotheSearch

class SearchResultsControllerTests: XCTestCase {
    let viewController = SearchResultTableViewController()
    
    override func setUp() {
        super.setUp()
        viewController.brandResults = ["Gap", "Nautica"]
        viewController.clothingTypeResults = []
        viewController.searchQuery = "Hola"
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testReturnCorrectSection(){
        let section = viewController.tableView(viewController.tableView, titleForHeaderInSection: 0)
        XCTAssertEqual(section, "Brand")
    }
    
    func testReturnCorrectNumberOnRows(){
        let rows = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rows, 2)
    }
    
    func testCorrectNumberOfSections(){
        let sections = viewController.numberOfSectionsInTableView(viewController.tableView)
        XCTAssertEqual(sections, 3)
    }
    
}
