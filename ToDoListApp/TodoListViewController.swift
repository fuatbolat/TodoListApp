//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Fuat Bolat on 24.01.2024.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let myArray = ["Kill the Monster","save the queen","go to america"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //
    }
    //MARK: - Tableview DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = myArray[indexPath.row]
        return cell
    }
    //MARK: - Tableview Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected\(myArray[indexPath.row])")

        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    //MARK: - Add new İtem
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    

}

