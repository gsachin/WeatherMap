//
//  SysCell.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class SysCell: UITableViewCell {

    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var sunRise: UILabel!
    @IBOutlet weak var sunSet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindCell(country:String,sunrise:String,sunset:String){
    self.country.text = country
        self.sunRise.text = sunrise
        self.sunSet.text = sunset
    }
    
}
