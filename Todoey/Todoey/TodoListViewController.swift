//
//  ViewController.swift
//  Todoey
//
//  Created by Jasneet Singh on 3/26/19.
//  Copyright © 2019 Jasneet Singh. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        //displays rowns based off number of items in itemArray
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        //setting cell to be reusable with the right identifier
        cell.textLabel?.text = itemArray[indexPath.row]
        //filling the text based off the itemArray for that row: ex: 0, 1, 2
        return cell
        
    }
    
    //MARK: TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            //checks to see if there is a checkmark
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
            //if so, remove it when selected again
        } else {
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            //if not, add it when selected
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    //MARK: Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        //local variable to get and display user input
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        //message that appears when you get the alert
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what happens when user hits Add Item
            self.itemArray.append(textField.text!)
            //adds user input to itemArray
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            //textfield for the item
            textField = alertTextField
            //sets textField = to user input
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    } 
    
}

