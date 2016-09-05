//
//  StateTableViewController.swift
//  Rep2.0
//
//  Created by Justin Carver on 9/5/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class StateTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StateController.states.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StateCell", forIndexPath: indexPath)

        cell.textLabel?.text = StateController.states[indexPath.row]

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        guard segue.identifier == "toDetailView", let RepDC = segue.destinationViewController as? RepViewController else { return }
        
        guard let index = tableView.indexPathForSelectedRow else { return }
        
        RepDC.state = StateController.states[index.row]
    }
}
