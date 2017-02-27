//
//  SummaryCellTableViewCell.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class SummaryCellTableViewCell: UITableViewCell {

    @IBOutlet weak var dt: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var base: UILabel!
    
    @IBOutlet weak var visibility: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindCell(name:String,base:String,date:String,visibility:Int){
    self.name.text = name
    self.dt.text =  date
    self.base.text = base
    self.visibility.text = String(visibility)

    }
    
}
