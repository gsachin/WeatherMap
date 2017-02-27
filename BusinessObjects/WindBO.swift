//
//  WindBO.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class WindBO: BaseBO {
    
   var speed : Double = 0.0
   var deg : Double = 0.0
    var gust : Double = 0.0
    override func parse(json: NSDictionary) {
        
        if let speedVal = json.value(forKey: "speed")
        {
            speed = speedVal as! Double
        }
        if let degVal = json.value(forKey: "deg") {
          deg = degVal  as! Double
        }
        if let gustVal = json.value(forKey: "gust") {
        gust = gustVal as! Double
        }
        
    }

}
