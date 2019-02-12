//
//  AddItemTableViewControllerDelegate.swift
//  BucketList
//
//  Created by Erik Hoversten on 2/12/19.
//  Copyright © 2019 Erik Hoversten. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AddItemTableTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableTableViewController)
    
}
