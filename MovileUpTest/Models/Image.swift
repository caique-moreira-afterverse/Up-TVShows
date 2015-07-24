//
//  Image.swift
//  MovileUpTest
//
//  Created by Caique Moreira on 23/07/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation

struct Image : JSONDecodable {
    
    var full: NSURL?
    var medium: NSURL?
    var thumb: NSURL?
    
    static func decode(o: AnyObject?) -> Image? {
        if let  json = o as? NSDictionary {
            var full : NSURL?
            var medium: NSURL?
            var thumb: NSURL?
            
            if let fullStr = json["full"] as? String {
                full = NSURL(string: fullStr)
            }
            if let mediumStr = json["medium"] as? String {
                medium = NSURL(string: mediumStr)
            }
            if let thumbStr = json["thumb"] as? String {
                thumb = NSURL(string: thumbStr)
            }
            return Image(full: full, medium: medium, thumb: thumb)
        }
        
        return nil
    }
}