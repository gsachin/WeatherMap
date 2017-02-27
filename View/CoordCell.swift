//
//  CoordCell.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class CoordCell: UITableViewCell {

    @IBOutlet weak var longitude: UILabel!
  
    @IBOutlet weak var latitude: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindCell(lat:String,long:String){
        latitude.text = lat
        longitude.text = long
    }
    
}
