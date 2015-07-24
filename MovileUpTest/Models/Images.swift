//
//  Images.swift
//  MovileUpTest
//
//  Created by Caique Moreira on 23/07/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation

struct Images : JSONDecodable {
    let fanart : Image?
    let poster: Image?
    let logo: Image?
    let clearart: Image?
    let banner: Image?
    let thumb: Image?
    
    static func decode(o: AnyObject?) -> Images? {
        if let json = o as? NSDictionary,
        fanart = Image.decode(json["fanart"]),
        poster = Image.decode(json["poster"]),
        logo = Image.decode(json["logo"]),
        clearart = Image.decode(json["clearart"]),
        banner = Image.decode(json["banner"]),
        thumb = Image.decode(json["thumb"]) {
            return Images(fanart: fanart, poster: poster, logo: logo, clearart: clearart, banner: banner, thumb: thumb)
        }
        
        return nil
    }
    
}