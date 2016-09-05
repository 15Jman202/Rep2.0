//
//  RepsTableViewController.swift
//  Rep2.0
//
//  Created by Justin Carver on 9/5/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class RepsTableViewController: UITableViewController {
    
    var state: String?
    var Representatives: [Representative] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let state = state {
            
            RepresentativeController.getReps(state, completion: { (reps) in
                if let reps = reps {
                    self.Representatives = reps
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.tableView.reloadData()
                    })
                }
            })
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Representatives.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RepCell", forIndexPath: indexPath) as? RepTableViewCell

        let rep = Representatives[indexPath.row]
        cell?.updateCellWithRep(rep)

        return cell ?? RepTableViewCell()
    }
}
