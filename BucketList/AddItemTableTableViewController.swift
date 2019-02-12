//
//  AddItemTableTableViewController.swift
//  BucketList
//
//  Created by Erik Hoversten on 2/12/19.
//  Copyright © 2019 Erik Hoversten. All rights reserved.
//

import UIKit

class AddItemTableTableViewController: UITableViewController {

    weak var delegate: AddItemTableViewControllerDelegate?
    var itemToEdit: String?
    var indexPath: NSIndexPath?

    @IBOutlet weak var addItemTextField: UITextField!
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
//        print("Cancel")
        delegate?.cancelButtonPressed(by: self)
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
//        print("Save")
        let text = addItemTextField.text!
        delegate?.itemSaved(by: self, with: text, at: indexPath)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addItemTextField.text = itemToEdit
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


}
