//
//  Identifiers.swift
//  MovileUpTest
//
//  Created by Caique Moreira on 22/07/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation

struct Identifiers : JSONDecodable {
    typealias T = Identifiers
    
    let trakt: Int
    let slug: String?
    let tvdb: Int?
    let imdb: String?
    let tmdb: Int?
    let tvrage: Int?
    
    static func decode(o : AnyObject?) -> Identifiers? {
        if let json = o as? NSDictionary,
            trakt = json["trakt"] as? Int,
            slug = json["slug"] as? String?,
            tvdb = json["tvdb"] as? Int?,
            imdb = json["imdb"] as? String?,
            tmdb = json["tmdb"] as? Int?,
            tvrage = json["tvrage"] as? Int? {
                return Identifiers(trakt: trakt, slug: slug, tvdb: tvdb, imdb: imdb, tmdb: tmdb, tvrage: tvrage)
        }
        
        return nil
    }
}