//
//  Rep.swift
//  Rep2.0
//
//  Created by Justin Carver on 9/5/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import Foundation

class Representative {
    
    private let kName = "name"
    private let kState = "state"
    private let kParty = "party"
    private let kDistrict = "district"
    
    let name: String
    let state: String
    let party: String
    let district: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kName] as? String,
            state = dictionary[kState] as? String,
            party = dictionary[kParty] as? String,
            district = dictionary[kDistrict] as? String
            
            else { return nil }
        
        self.name = name
        self.district = district
        self.party = party
        self.state = state
    }
}