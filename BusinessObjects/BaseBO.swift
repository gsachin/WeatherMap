//
//  BaseBO.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import Foundation
class BaseBO : NSObject {
    
    func parameterName()->String
    {
        return ""
    }
    
    func parameters()->NSDictionary
    {
        return NSDictionary()
    }
    func parse(json:NSDictionary)
    {
        
    }
}
