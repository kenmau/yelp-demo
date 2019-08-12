//
//  YelpBusiness.swift
//  Yelp Demo
//
//  Created by Ken Mau on 2019-08-12.
//  Copyright © 2019 Ken. All rights reserved.
//

import Foundation

import Foundation
import ObjectMapper

class YELPBusiness: Mappable {
    var name: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}
