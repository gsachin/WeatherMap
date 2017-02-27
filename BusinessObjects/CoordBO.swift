//
//  CoordBO.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class CoordBO: BaseBO {

    var lon : Double = 0.0
    var lat : Double = 0.0
    
    override func parse(json: NSDictionary) {
        
        if let lonVal = json.value(forKey: "lon") {
         lon = lonVal as! Double
        }
        
        if let latVal = json.value(forKey: "lat") {
            lat = latVal as! Double
        }
    }
}
