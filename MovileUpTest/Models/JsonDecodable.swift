//
//  JsonDecodable.swift
//  MovileUpTest
//
//  Created by Caique Moreira on 23/07/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    
    static func decode(o : AnyObject?) -> Self?
}