//
//  WeatherDO.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import Foundation
class WeatherDO : BaseDO {
    let kAPIKey =  "789d25f2b8cfa2c3f5a045e1dec5a2a1"
    var coord : CoordBO = CoordBO()
    var weather = Array<WeatherBO>()
    var base : String = ""
    var main : MainBO = MainBO()
    var wind : WindBO = WindBO()
    var rain : RainBO = RainBO()
    var clouds : CloudsBO = CloudsBO()
    var dt : Date = Date()
    var sys : SysBO = SysBO()
    var weatherId : Int = 0
    var name : String = ""
    var cod : Int = 0
    var visibility : Int =  0
    var cityName : String = ""
    
    override func queryStringParameters()->String{
        return "q=\(cityName)&APPID=\(kAPIKey)"
    }
    override func baseURL() -> String{
        return "http://api.openweathermap.org/data/2.5/weather?"
    }

    
    override func parse(json: AnyObject) {
       let jsonDic = json as! NSDictionary
    
        if let coordVal = jsonDic.value(forKey:"coord") {
            self.coord.parse(json:coordVal as! NSDictionary)
        }
        if let weatherVal = jsonDic.value(forKey:"weather") {
            for obj in weatherVal as! NSArray {
            let weatherBO = WeatherBO()
            weatherBO.parse(json:obj as! NSDictionary)
            self.weather.append(weatherBO)
            }
        }
        if let baseVal = jsonDic.value(forKey: "base") {
            base = baseVal as! String
        }
        if let mainVal = jsonDic.value(forKey: "main") {
            main.parse(json: mainVal as! NSDictionary)
        }
        
        if let windVal = jsonDic.value(forKey: "wind") {
            wind.parse(json: windVal as! NSDictionary)
        }
        
        if let rainVal = jsonDic.value(forKey: "rain") {
            rain.parse(json: rainVal as! NSDictionary)
        }
        
        if let cloudsVal = jsonDic.value(forKey: "clouds") {
            clouds.parse(json: cloudsVal as! NSDictionary)
        }
        
        if let dtVal = jsonDic.value(forKey:"dt") {
            dt = Date(timeIntervalSince1970:dtVal as! Double)
        }
        
        if let sysVal = jsonDic.value(forKey: "sys") {
            self.sys.parse(json: sysVal as! NSDictionary)
        }
        
        if let weatherIdVal = jsonDic.value(forKey: "id") {
            self.weatherId = weatherIdVal as! Int
        }
        
        if let nameVal = jsonDic.value(forKey: "name")
        {
            self.name = nameVal as! String
        }
        
        if let codVal = jsonDic.value(forKey: "cod")
        {
            self.cod = codVal as! Int
        }
        if let visibility = jsonDic.value(forKey: "visibility"){
        self.visibility = visibility as! Int
        }
       
    }
    
    
    
    
    
    /*
    {
    "coord": {
    "lon": -0.13,
    "lat": 51.51
    },
    "weather": [
    {
    "id": 500,
    "main": "Rain",
    "description": "light rain",
    "icon": "10n"
    }
    ],
    "base": "cmc stations",
    "main": {
    "temp": 286.164,
    "pressure": 1017.58,
    "humidity": 96,
    "temp_min": 286.164,
    "temp_max": 286.164,
    "sea_level": 1027.69,
    "grnd_level": 1017.58
    },
    "wind": {
    "speed": 3.61,
    "deg": 165.001
    },
    "rain": {
    "3h": 0.185
    },
    "clouds": {
    "all": 80
    },
    "dt": 1446583128,
    "sys": {
    "message": 0.003,
    "country": "GB",
    "sunrise": 1446533902,
    "sunset": 1446568141
    },
    "id": 2643743,
    "name": "London",
    "cod": 200
    }*/
    
    /*{"coord":{"lon":-104.98,"lat":39.74},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"base":"stations","main":{"temp":277.58,"pressure":1007,"humidity":13,"temp_min":276.15,"temp_max":279.15},"visibility":16093,"wind":{"speed":1.42,"deg":304.503},"clouds":{"all":1},"dt":1488141360,"sys":{"type":1,"id":602,"message":0.0049,"country":"US","sunrise":1488116139,"sunset":1488156602},"id":5419384,"name":"Denver","cod":200}
 */
}
