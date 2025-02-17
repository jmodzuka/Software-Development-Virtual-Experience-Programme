//
//  UrlSessionTests.swift
//  BudgetTests

import XCTest
import Cuckoo

class UrlSessionTests: XCTestCase {
    
    func testSingleTransactionReturnedFromApi () {
        let mock = MockUrlSession()
        let urlStr  = "https://bankapi.com"
        let url  = URL(string:urlStr)!
        
        stub(mock) { mock in
          mock.callApi(url: equal(to:url, equalWhen: { $0 == $1 })).thenReturn(validSingleTransactionJSON)
        }
        XCTAssertEqual(mock.callApi(url: url),"""
                       [{"amount": 50, "category": "Shopping"}]
                       """)
    }
    
    func testMultipleTransactionsReturnedFromApi () {
        let mock = MockUrlSession()
        let urlStr  = "https://bankapi.com"
        let url  = URL(string:urlStr)!
        
        stub(mock) { mock in
          mock.callApi(url: equal(to:url, equalWhen: { $0 == $1 })).thenReturn(validMultipleTransactionsJSON)
        }
        XCTAssertEqual(mock.callApi(url: url),"""
                       [{"amount": 50, "category": "Shopping"}, {"amount": 10, "category": "Transportation"}, {"amount": 30, "category": "Entertainment"}]
                       """)
    }
    
    func testNothingReturnedFromApi () {
        let mock = MockUrlSession()
        let urlStr  = "https://bankapi.com"
        let url  = URL(string:urlStr)!
        
        stub(mock) { mock in
          mock.callApi(url: equal(to:url, equalWhen: { $0 == $1 })).thenReturn("")
        }
        XCTAssertEqual(mock.callApi(url: url), "")
    }
    
}

extension UrlSessionTests {
    var validSingleTransactionJSON: String {
        """
        [{"amount": 50, "category": "Shopping"}]
        """
    }
    
    var validMultipleTransactionsJSON: String {
        """
        [{"amount": 50, "category": "Shopping"}, {"amount": 10, "category": "Transportation"}, {"amount": 30, "category": "Entertainment"}]
        """
    }
}
