//
//  CommonMethods.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import Foundation
class CommonMethods {
public class var shared:CommonMethods {
    struct Singleton {
        static let instance = CommonMethods()
    }
    return Singleton.instance
}

public class func sharedInstance()->CommonMethods {
    return CommonMethods.shared
}

func saveValue(value:AnyObject,key:String) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}

func readValue(key:String)->AnyObject {
    
    if let value = UserDefaults.standard.object(forKey: key)
    {
        return value as AnyObject
    } else {
        return "" as AnyObject
    }
}
}
