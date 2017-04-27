//
//  Fare.swift
//  Moovel
//
//  Created by Nithin Reddy Gaddam on 4/26/17.
//  Copyright © 2017 Nithin Reddy Gaddam. All rights reserved.
//

import Foundation

struct Fare {
    let description: String
    let price: Float
    
    init(description: String, price: Float) {
        self.description = description
        self.price = price
    }
}
