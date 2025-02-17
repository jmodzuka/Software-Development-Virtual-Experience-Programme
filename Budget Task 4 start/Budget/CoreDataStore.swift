//
//  CoreDataStore.swift
//  Budget

import Foundation
import CoreData

enum StorageType {
  case persistent, inMemory
}

class CoreDataStore {
    let persistentContainer: NSPersistentContainer

      init(_ storageType: StorageType = .persistent) {
        self.persistentContainer = NSPersistentContainer(name: "Budget")

        if storageType == .inMemory {
          let description = NSPersistentStoreDescription()
          description.url = URL(fileURLWithPath: "/dev/null")
          self.persistentContainer.persistentStoreDescriptions = [description]
        }

        self.persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
          }
        })
      }
    
    func createSampleTransactions() {
        addTransaction(amount: 10, category: "Shopping")
        addTransaction(amount: 50, category: "Entertainment")
        addTransaction(amount: 20, category: "Food")
        addTransaction(amount: 5, category: "Transportation")
        addTransaction(amount: 75, category: "Utilities")
    }
    
    func addTransaction(amount:Double, category:String) {
        let transaction = Transaction(context: persistentContainer.viewContext)
        transaction.amount = amount
        transaction.category = category
        do {
            try persistentContainer.viewContext.save()
            print("Transaction saved successfully")
        } catch {
            print("Failed to save Transaction \(error)")
        }
    }
    
    func fetchTransactions() -> [Transaction]{
        let fetchRequest: NSFetchRequest<Transaction> = Transaction.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
}
