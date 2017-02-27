//
//  BaseDO.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import Foundation
class BaseDO {
    
    var webService = WebService()
    func parameters()->NSDictionary
    {
        return NSDictionary()
    }
    func queryStringParameters()->String{
        return ""
    }
    func mathodType()->String {
        return "POST"
    }
    func methodName()->String
    {
        return ""
    }
    
    func baseURL() -> String{
        return ""
    }
    
    
    func parse(json:AnyObject)
    {
        //return BaseDO()
    }
    
    func callServiceWithQueryString(success:@escaping(_ result: BaseDO)->Void, failer:@escaping(_ error:String)->Void){
        // self.webService
        self.webService.callServiceWithQueryString(URLString: baseURL(),  queryStringParams:queryStringParameters(), success: { (successResponse) in
            self.parse(json:successResponse as AnyObject)
            success(self)
        }) { (error) in
            failer(error)
        }
        
    }
    func urlEncodedString(str:String)->String {
        return str.replacingOccurrences(of:" ", with: "+").addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
    
    func callService(success:@escaping(_ result: BaseDO)->Void, failer:@escaping(_ error:String)->Void) {
        self.webService.callService(URLString: baseURL(), methodType: mathodType(), parameters: parameters(), success: { (successResponse) in
            self.parse(json:successResponse as AnyObject)
            success(self)
        }) { (error) in
            failer(error)
        }
    }

}
