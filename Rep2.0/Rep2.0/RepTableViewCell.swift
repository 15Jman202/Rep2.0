//
//  RepTableViewCell.swift
//  Rep2.0
//
//  Created by Justin Carver on 9/5/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class RepTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PartyLabel: UILabel!
    @IBOutlet weak var DistrictLabel: UILabel!

    func updateCellWithRep(rep: Representative) {
        
        self.NameLabel.text = rep.name
        self.PartyLabel.text = rep.party
        self.DistrictLabel.text = "District \(rep.district)"
    }
}

