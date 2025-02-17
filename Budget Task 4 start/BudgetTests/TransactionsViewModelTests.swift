//
//  TransactionsViewModelTests.swift
//  BudgetTests

import XCTest
@testable import Budget

class TransactionsViewModelTests: XCTestCase {

    func testInitCreatesStorage() {
        let sut = TransactionsViewModel(storage: CoreDataStore(.inMemory))
        XCTAssertNotNil(sut.storage)
    }

    func testNoTransactionsOnStart() {
        let sut = TransactionsViewModel(storage: CoreDataStore(.inMemory))
        XCTAssertEqual(sut.transactions.count, 0)
    }
    
    func testFakeTransactionsAddUpCorrectly() {
        let sut = TransactionsViewModel(storage: CoreDataStore(.inMemory))
        sut.getTransactions() // uses the fake transactions from CoreDataStore
        XCTAssertEqual(sut.totalOfAllTransactions(), 160.0)
    }

}
