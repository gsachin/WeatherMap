//
//  ImageViewExtention.swift
//  WeatherMap
//
//  Created by A1 on 26/02/17.
//  Copyright © 2017 ABC. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
    func getDataFromUrl(url:String, completion: @escaping ((_ data: NSData?) -> Void)) {
        URLSession.shared.dataTask(with: NSURL(string: url)! as URL) { (data, response, error) in
            completion(NSData(data: data!))
            }.resume()
    }
    
    func downloadImage(url:String){
        getDataFromUrl(url: url) { data in
            DispatchQueue.main.async {
                self.contentMode = UIViewContentMode.scaleAspectFill
                self.image = UIImage(data: data! as Data)
            }
        }
    }
}
