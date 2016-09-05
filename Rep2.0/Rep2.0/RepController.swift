//
//  RepController.swift
//  Rep2.0
//
//  Created by Justin Carver on 9/5/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = NSURL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func getReps(state: String, completion: (reps: [Representative]?) -> Void) {
        
        guard let url = baseURL else { completion(reps: []); return }
        
        let urlParameters = ["state" : "\(state)", "output" : "json"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            if error != nil {
                print(error)
                completion(reps: [])
                return
            }
            
            guard let data = data, JSONDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject], resultsDictionary = JSONDictionary["results"] as? [[String: AnyObject]] else { completion(reps: []); return }
            
            let reps = resultsDictionary.flatMap({ Representative(dictionary: $0) })
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(reps: reps)
            })
        }
    }
}