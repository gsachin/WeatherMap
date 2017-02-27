//
//  RainBO.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class RainBO: BaseBO {
    var threeH : Double = 0.0
    override func parse(json: NSDictionary) {
        if let threeHVal = json.value(forKey: "3h") {
         threeH  = threeHVal as! Double
        }
    }
}
