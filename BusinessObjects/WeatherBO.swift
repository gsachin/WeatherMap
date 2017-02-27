//
//  WeatherBO.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class WeatherBO: BaseBO {
    var weatherId : Int = 0
    var main : String = ""
    var weatherDescription : String = ""
    var icon : String = ""
    override func parse(json: NSDictionary) {
        if let weatherIdVal = json.value(forKey: "id") {
            weatherId =  weatherIdVal as! Int
        }
        if let weatherDescriptionVal = json.value(forKey: "description") {
            weatherDescription =  weatherDescriptionVal as! String
        }
        if let mainVal = json.value(forKey: "main") {
            main =  mainVal as! String
        }
        if let iconVal = json.value(forKey: "icon") {
            icon =  iconVal as! String
        }
        
    }
}
