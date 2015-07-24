//
//  Season.swift
//  MovileUpTest
//
//  Created by Caique Moreira on 23/07/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation

struct Season : JSONDecodable{

    let number: Int
    let ids : Identifiers
    let overview : String?
    
    static func decode(o: AnyObject?) -> Season? {
        if let json = o as? NSDictionary,
        number = json["number"] as? Int,
        ids = Identifiers.decode(json["ids"]),
        overview = json["overview"] as? String? {
            return Season(number: number, ids: ids, overview: overview)
        }
        
        return nil
    }
    
}