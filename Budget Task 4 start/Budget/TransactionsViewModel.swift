//
//  TransactionsViewModel.swift
//  Budget

import Foundation
import CoreData

class TransactionsViewModel {
    let storage: CoreDataStore
    var transactions: [Transaction]
    
    init(storage:CoreDataStore) {
        self.storage = storage
        self.transactions = []
    }
    
    func getTransactions() {
        storage.createSampleTransactions()
        transactions = storage.fetchTransactions()
    }
    
    func totalOfAllTransactions() -> Double {
        var total: Double = 0.0
        for transaction in transactions {
            total = total + transaction.amount
        }
        return total
    }
    
}
