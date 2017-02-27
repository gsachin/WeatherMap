//
//  MainBO.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class MainBO: BaseBO {
  var temp : Double = 0.0
  var pressure : Double = 0.0
  var humidity : Double = 0.0
  var temp_min : Double = 0.0
  var temp_max : Double = 0.0
  var sea_level : Double = 0.0
  var grnd_level : Double = 0.0

    override func parse(json: NSDictionary) {
        if let tempVal = json.value(forKey: "temp"){
         temp = tempVal as! Double
        }
        if let pressureVal = json.value(forKey: "pressure")
        {
         pressure = pressureVal   as! Double
        }
        if let humidityVal = json.value(forKey: "humidity") {
            humidity = humidityVal as! Double
        }
        if let temp_minVal = json.value(forKey: "temp_min")
        {
           temp_min = temp_minVal as! Double
        }
        
        if let temp_maxVal = json.value(forKey: "temp_max") {
            temp_max = temp_maxVal as! Double
        }
        if let sea_levelVal = json.value(forKey: "sea_level")
        {
            sea_level = sea_levelVal as! Double
        }
        if let grnd_levelVal = json.value(forKey: "sea_level") {
            grnd_level = grnd_levelVal as! Double
        }
    }
}
