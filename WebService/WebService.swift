//
//  WebService.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import Foundation
class WebService : NSObject {
    
    public class var shared:WebService {
        struct Singleton {
            static let instance = WebService()
        }
        return Singleton.instance
    }
    
    public class func sharedInstance()->WebService {
        return WebService.shared
    }
    
    func callService(URLString:String,methodType:String,parameters:NSDictionary, success:@escaping(_ result: Any)->Void, failer:@escaping(_ error:String)->Void)
    {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
        guard let url = URL(string: URLString) else {
            return
        }
        var urlRequest = URLRequest(url: url)
        //urlRequest.httpMethod = methodType
        var requestData : Data = Data()
        do {
            requestData = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted) as! Data
            print(String(data:requestData, encoding: .utf8)!)
            
        } catch {
            
        }
        urlRequest.httpBody = requestData as! Data
        let task = session.dataTask(with: urlRequest){
            (data, response, error) in
            guard error == nil else {
                return
            }
            do
            {
                let   json = try JSONSerialization.jsonObject(with: data!, options: [])
                success(json)
                print(json)
            }
            catch
            {
                return
            }
        }
        task.resume()
        
    }
    
    func callServiceWithQueryString(URLString:String,queryStringParams:String, success:@escaping(_ result: Any)->Void, failer:@escaping(_ error:String)->Void){
        let urlPath = "\(URLString)\(queryStringParams)"
        let url = NSURL(string: urlPath)
        let session = URLSession.shared
        let task = session.dataTask(with: url! as URL, completionHandler: {data, response, error -> Void in
            guard error == nil else {
                failer("Server error")
                return
            }
            do
            {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    success(json)
                
            }
            catch
            {
                return
                    failer("Data parsing error")
            }
            
        })
        
        task.resume()
    }

    
}

