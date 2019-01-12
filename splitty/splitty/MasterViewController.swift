//
//  MasterViewController.swift
//  splitty
//
//  Created by Denis Nefedov on 12/01/2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.image = imageArray[indexPath.row]
                // resize image
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.backgroundColor = colorsArray[indexPath.row]
        cell.textLabel!.text = nameArray[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // resize cells for the whole screen - topBar
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let topBar = navigationController?.navigationBar.frame.height else {
            return (tableView.frame.height - 50) / CGFloat(imageArray.count)
        }
        return (tableView.frame.height - topBar) / CGFloat(imageArray.count)
    }
}

