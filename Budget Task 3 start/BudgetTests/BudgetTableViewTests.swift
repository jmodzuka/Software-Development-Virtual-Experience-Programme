//
//  BudgetTests.swift
//  BudgetTests

import XCTest
@testable import Budget

class BudgetTableViewTests: XCTestCase {

    func testTableViewShowsOnLoad() {
        // given
        let sut = BudgetTableViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertNotNil(sut.tableView)
    }

    func testTableViewHasCorrectRowCountBeforeData() {
        // given
        let sut = BudgetTableViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        let rowCount = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, 1)
    }
    
    func testZeroBudgetOnLoad() {
        // given
        let sut = BudgetTableViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(sut.budgetAmount, 0.0)
    }
    
    func testTapToSetShowsWhenZeroBudget() {
        // given
        let sut = BudgetTableViewController()
        
        // when
        sut.loadViewIfNeeded()
        sut.budgetAmount = 0.0
        
        // then
            let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(item: 0, section: 0))
        XCTAssertEqual(cell.detailTextLabel?.text, "Tap to set budget")
    }
    
    func testBudgetShowsWhenSet() {
        // given
        let sut = BudgetTableViewController()
        
        // when
        sut.loadViewIfNeeded()
        sut.budgetAmount = 100.0
                
        // then
            let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(item: 0, section: 0))
        XCTAssertEqual(cell.detailTextLabel?.text, "100.0")
    }
    
    func testNavigationBarHasMyBudgetTitle() {
        // given
        let sut = BudgetTableViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(sut.title, "My Budget")
    }
    
    
    
}
