//
//  YelpBusinessesSearchResponse.swift
//  Yelp Demo
//
//  Created by Ken Mau on 2019-08-12.
//  Copyright © 2019 Ken. All rights reserved.
//

import Foundation
import ObjectMapper

class YELPBusinessesSearchResponse: Mappable {
    
    var businesses: [YELPBusiness]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        businesses <- map["businesses"]
    }
    
    //    var total: Int?
    //    var region: [YelpRegion]?
}
