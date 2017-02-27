//
//  WeatherCell.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit
let kIconURL = "http://openweathermap.org/img/w/"
class WeatherCell: UITableViewCell {

    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindCell(icon:String, desc:String){
        imageIcon.downloadImage(url:"\(kIconURL)\(icon).png")
        self.desc.text = desc
    }
    
}
