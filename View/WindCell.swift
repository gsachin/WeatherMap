//
//  WindCell.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class WindCell: UITableViewCell {

    @IBOutlet weak var deg: UILabel!
    @IBOutlet weak var speed: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindCell(speed:String,deg:String) {
    self.speed.text = speed
    self.deg.text = deg
    }
    
}
