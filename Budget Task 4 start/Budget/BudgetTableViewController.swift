//
//  BudgetTableViewController.swift
//  Budget

import UIKit

class BudgetTableViewController: UITableViewController {
    
    var budgetAmount: Double = 0.0
    lazy var coreDataStore: CoreDataStore = CoreDataStore(.inMemory)
    lazy var viewModel: TransactionsViewModel = TransactionsViewModel(storage: coreDataStore)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        title = "My Budget"
        self.viewModel.getTransactions()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return self.viewModel.transactions.count
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Budget"
        case 1:
            return "Spent this month"
        case 2:
            return "Transactions"
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "Monthly budget"
            if budgetAmount == 0.0 {
                cell.detailTextLabel?.text = "Tap to set budget"
            }
            else {
                cell.detailTextLabel?.text = String(budgetAmount)
            }
        case 1:
            let total = self.viewModel.totalOfAllTransactions()
            if total > self.budgetAmount {
                cell.textLabel?.text = "Over budget"
            }
            else {
                cell.textLabel?.text = "Under budget"
            }
            if self.budgetAmount == 0.0 {
                cell.textLabel?.text = ""
            }
            cell.detailTextLabel?.text = String(total)
        case 2:
            let transaction: Transaction = self.viewModel.transactions[indexPath.row]
            cell.textLabel?.text = transaction.category
            cell.detailTextLabel?.text = String(transaction.amount)
        default:
            cell.textLabel?.text = ""
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
        // show alert with text field
        let alert = UIAlertController(title: "Set Budget",
                                      message: "Enter your monthly budget",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) {_ in
            // add code for saving the value from the text field
            guard let textField = alert.textFields?.first,
                  let enteredBudget = textField.text else {
                      return
                  }
            
            self.budgetAmount = Double(enteredBudget) ?? 0.0
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if indexPath == IndexPath(item: 0, section: 0) {
            return true
        }
        return false
    }
}

