//
//  ViewController.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    let wOptions = ["summary","coord","weather","main","wind","clouds","sys"]
    //let wOptions = ["coord","weather","main","wind","clouds","sys"]
    var weather = WeatherDO()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        self.title = "Weather Report"
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return wOptions[section] 
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0;
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44.0;
        let cityName = CommonMethods.shared.readValue(key: "CityName") as! String
        if cityName != "" {
        self.searchBar.text = cityName
        self.weather.cityName = cityName
        self.weather.callServiceWithQueryString(success: { (baseDO) in
            DispatchQueue.main.async {
                () -> Void in
                self.tableView.reloadData()
            }
            print(baseDO)
        }) { (error) in
            print(error)
        }
        }
    
    }
    
    func registerCells(){
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        self.tableView.register(UINib(nibName: "SummaryCellTableViewCell", bundle: nil), forCellReuseIdentifier: "SummaryCellTableViewCell")
        
        self.tableView.register(UINib(nibName: "CoordCell", bundle: nil), forCellReuseIdentifier: "CoordCell")
        self.tableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
        self.tableView.register(UINib(nibName: "MainCell", bundle: nil), forCellReuseIdentifier: "MainCell")
        self.tableView.register(UINib(nibName: "WindCell", bundle: nil), forCellReuseIdentifier: "WindCell")
        self.tableView.register(UINib(nibName: "CloudsCell", bundle: nil), forCellReuseIdentifier: "CloudsCell")
        self.tableView.register(UINib(nibName: "SysCell", bundle: nil), forCellReuseIdentifier: "SysCell")
    }
    func bindData() {
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return wOptions.count
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        
        if self.weather.cityName == "" {
            return 0
        }else if wOptions[section] == "weather" {
            return self.weather.weather.count
        }
        return 1
    }
    //@available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //track names, artist name, album name
        //let scell = UITableViewCell(style:.plain, reuseIdentifier:"SummaryCellTableViewCell" )
        //self.tableView.register(scell, forCellReuseIdentifier: "SummaryCellTableViewCell")

//        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell")
//        return cell!
        
        if self.wOptions[indexPath.section] == "summary" {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCellTableViewCell") as! SummaryCellTableViewCell
        
        cell.bindCell(name: self.weather.name, base: self.weather.base, date: self.weather.dt.description, visibility: self.weather.visibility)
            return cell;
        }
        else if self.wOptions[indexPath.section] == "coord" {
    
            let cell = tableView.dequeueReusableCell(withIdentifier: "CoordCell") as! CoordCell
            cell.bindCell(lat: String(self.weather.coord.lat), long: String(self.weather.coord.lon))
            return cell;
        } else if self.wOptions[indexPath.section] == "weather" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherCell
            cell.bindCell(icon: self.weather.weather[indexPath.row].icon, desc: self.weather.weather[indexPath.row].weatherDescription)
            return cell;
        } else if self.wOptions[indexPath.section] == "main" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as! MainCell
            cell.bindCell(temp: String(self.weather.main.temp), pressure: String(self.weather.main.pressure), humidity: String(self.weather.main.humidity), minTemp: String(self.weather.main.temp_min), maxTemp:String(self.weather.main.temp_max))
            return cell;
        } else if self.wOptions[indexPath.section] == "wind" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "WindCell") as! WindCell
            cell.bindCell(speed: String(self.weather.wind.speed), deg: String(self.weather.wind.deg))
            return cell;
        } else if self.wOptions[indexPath.section] == "clouds" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CloudsCell") as! CloudsCell
            cell.bindCell(all:String(self.weather.clouds.all))
            return cell;
        } else if self.wOptions[indexPath.section] == "sys" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SysCell") as! SysCell
            cell.bindCell(country: String(self.weather.sys.country), sunrise: String(describing:self.weather.sys.sunrise), sunset: String(describing: self.weather.sys.sunset))
            return cell;
        }

       
        //["summary","coord","weather","main","wind","clouds","sys"]
        return UITableViewCell()
//        let song = songList.songs[indexPath.row]
//        cell.fillCell(track: song.trackName,
//                      album: song.collectionName,
//                      artist:song.artistName,
//                      albumImageUrl:song.artworkUrl60)
       // return cell
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        self.view.endEditing(true)
        if searchBar.text == "" {
            return
        }
        self.weather.cityName = searchBar.text!
        CommonMethods.shared.saveValue(value: searchBar.text! as AnyObject, key: "CityName")
    self.weather.callServiceWithQueryString(success: { (baseDO) in
    DispatchQueue.main.async {
    () -> Void in
    self.tableView.reloadData()
    }
    print(baseDO)
    }) { (error) in
    print(error)
    }
    }

}

