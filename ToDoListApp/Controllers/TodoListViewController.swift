//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Fuat Bolat on 24.01.2024.
//

import UIKit

class TodoListViewController: UITableViewController {
    
   // var myArray = ["Kill the Monster","save the queen","go to america"]
    
    let defaults = UserDefaults.standard
    
    var itemArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "new item 0"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "new item 1  ?"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "new item 2 ?"
        itemArray.append(newItem2)
        
        if let  items = defaults.array(forKey: "TodoListArray") as? [Item]{
            itemArray = items
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //
    }
    //MARK: - Tableview DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        /*if item.done == true{
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
         */
        
        
        return cell
    }
    //MARK: - Tableview Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        // aşağıdaki if ifadesinin aynısını yapar
       /* if itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
        }else{
            itemArray[indexPath.row].done = false
        }
        */
        print("selected\(itemArray[indexPath.row].title)")
        
        tableView.reloadData()

       
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    //MARK: - Add new İtem
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add a New item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add New Item", style: .default) { [self] (action) in
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert,animated: true,completion: nil)
      
    }

}

