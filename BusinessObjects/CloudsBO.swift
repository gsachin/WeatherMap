//
//  CloudsBO.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class CloudsBO: BaseBO {
    var all : Int = 0
    override func parse(json: NSDictionary) {
        if let allVal = json.value(forKey: "all") {
        all = allVal as! Int
        }
        
    }
}
