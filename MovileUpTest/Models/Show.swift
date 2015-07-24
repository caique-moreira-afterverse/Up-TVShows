//
//  Show.swift
//  MovileUpTest
//
//  Created by Caique Moreira on 22/07/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation

struct Show : JSONDecodable {
    
    typealias T = Show
    
    let title: String
    let year: Int
    let ids: Identifiers
    let images: Images?
    
    static func decode(o : AnyObject?) -> Show? {
        if let json = o as? NSDictionary {
            if let title = json["title"] as? String,
                year = json["year"] as? Int,
                ids = Identifiers.decode(json["ids"]),
                images = Images.decode(json["images"]){
                    return Show(title: title,year: year, ids: ids, images: images)
            }
        }
        
        return nil
    }
}