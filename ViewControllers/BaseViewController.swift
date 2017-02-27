//
//  BaseViewController.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    class BaseViewController: UIViewController {
        var actInd = UIActivityIndicatorView(frame:CGRect(x:0,y:0, width:50, height:50))
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        func startActivitIndicator() {
            // actInd =  as UIActivityIndicatorView
            actInd.center = self.view.center
            actInd.hidesWhenStopped = true
            actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(actInd)
            actInd.startAnimating()
        }
        
        func stopActivitIndicator(){
            actInd.stopAnimating()
        }
    }

}
