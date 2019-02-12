//
//  ViewController.swift
//  BucketList
//
//  Created by Erik Hoversten on 2/12/19.
//  Copyright © 2019 Erik Hoversten. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
    
    var items = ["apple", "pear", "bannana", "Burger", "kiwi", "strawberry"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editItemSegue", sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItemSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableTableViewController
            addItemTableViewController.delegate = self
        } else if segue.identifier == "editItemSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableTableViewController
            addItemTableViewController.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableViewController.itemToEdit = item
            addItemTableViewController.indexPath = indexPath
        }
        
    }
    
    func cancelButtonPressed(by controller: AddItemTableTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemTableTableViewController, with text: String, at indexPath: NSIndexPath?) {
        print("Recieved text from AddItemTableViewController as: (\text)")
        if let index = indexPath {
            items[index.row] = text
        } else {
            // Add item to items[] array
            items.append(text)
        }
        
        // Reload the tabelView
        tableView.reloadData()
        // Dismiss the current viewController
        dismiss(animated: true, completion: nil)
    }
    

}

