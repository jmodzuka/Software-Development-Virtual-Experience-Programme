//
//  BudgetTableViewController.swift
//  Budget

import UIKit

class BudgetTableViewController: UITableViewController {

    var budgetAmount: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        title = "My Budget"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Monthly budget"
        if budgetAmount == 0.0 {
            cell.detailTextLabel?.text = "Tap to set budget"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // show alert with text field
        let alert = UIAlertController(title: "Set Budget",
                                        message: "Enter your monthly budget",
                                        preferredStyle: .alert)
          
          let saveAction = UIAlertAction(title: "Save",
                                         style: .default) {_ in
              // add code for saving the value from the text field
              
          }
          
          let cancelAction = UIAlertAction(title: "Cancel",
                                           style: .cancel)
          
          alert.addTextField()
          
          alert.addAction(saveAction)
          alert.addAction(cancelAction)
          
          present(alert, animated: true)
    }
    
}

