//
//  Episode.swift
//  MovileUpTest
//
//  Created by Caique Moreira on 22/07/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation

struct Episode : JSONDecodable {
    
    let number : Int
    let season : Int
    let title : String
    let ids : Identifiers
    let overview : String?
    let images : Images?
    
    static func decode(o: AnyObject?) -> Episode? {
        if let json = o as? NSDictionary,
        number = json["number"] as? Int,
        season = json["season"] as? Int,
        title = json["title"] as? String,
        ids = Identifiers.decode(json["ids"]),
        overview = json["overview"] as? String?,
        images = Images.decode(json["images"]) {
            return Episode(number: number, season: season, title: title, ids: ids, overview: overview, images: images)
        }
        
        return nil
    }
    
}