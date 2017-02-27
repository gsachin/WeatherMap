//
//  SysBO.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class SysBO: BaseBO {
    var type : Int = 0
    var sysId : Int = 0
    var message : Double = 0.0
    var country : String = ""
    var sunrise : Date = Date()
    var sunset : Date = Date()
    override func parse(json: NSDictionary) {
        if let typeVal = json.value(forKey: "type") {
        type = typeVal as! Int
        }
        if let sysIdVal = json.value(forKey: "id") {
            sysId = sysIdVal as! Int
        }
        if let messageVal = json.value(forKey: "message") {
            message = messageVal as! Double
        }
        if let countryVal = json.value(forKey: "country") {
            country = countryVal as! String
        }
        if let sunriseVal = json.value(forKey: "sunrise")
        {
            let timeInt:TimeInterval = TimeInterval(sunriseVal as! Double)
            sunrise = Date(timeIntervalSince1970:timeInt)
        }
        if let sunsetVal = json.value(forKey: "sunset") {
            sunset = Date(timeIntervalSince1970:sunsetVal as! TimeInterval)
        }
        
    }
}
