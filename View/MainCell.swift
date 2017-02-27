//
//  MainCell.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    @IBOutlet weak var temp: UILabel!

    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindCell(temp:String,pressure:String,humidity:String,minTemp:String,maxTemp:String){
    self.temp.text = temp
    self.pressure.text = pressure
    self.humidity.text = humidity
    self.minTemp.text = minTemp
    self.maxTemp.text =  maxTemp
    }
    
}
