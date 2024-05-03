//
//  ViewController.swift
//  Today's Weather
//
//  Created by Khalid Gad on 03/05/2024.
//

import UIKit
import Alamofire

class HomeVC: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var searchBTN: UIButton!
    
    @IBOutlet weak var LoaderActivityIndicator: UIActivityIndicatorView!
    
    var cityID = "360630"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // notification for change city
        NotificationCenter.default.addObserver(self, selector: #selector (changeCity), name: NSNotification.Name(rawValue: "cityValueChange"), object: nil)
            
        searchBTN.layer.cornerRadius =  searchBTN.frame.width/2
        searchBTN.layer.masksToBounds = true
  
        getCityWeatherInfo()
    }
    
    func getCityWeatherInfo(){
        LoaderActivityIndicator.isHidden = false
        LoaderActivityIndicator.startAnimating()
        
        var params = ["id":cityID, "appid": "04a389b0f2725f91e419ed9787421c51"]
     
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: params, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            //to get JSON return value
            if let result = response.value {
                let JSONDictionary = result as! NSDictionary
                let main = JSONDictionary["main"] as! NSDictionary
                var temp = main["temp"] as! Double
                temp = temp - 273.15
                temp = Double(round(1000 * temp)/1000)
                var press = main["pressure"] as! Int
                var humidity = main["humidity"] as! Int
               // print(main)
                self.LoaderActivityIndicator.stopAnimating()
                self.LoaderActivityIndicator.isHidden
                self.tempLabel.text = "\(temp)°C"
                self.pressLabel.text = "\(press)mb"
                self.humidityLabel.text = "\(humidity)%"
            }
        }
        
    }
    
    
    
    // function for change a city
    @objc func changeCity(notification: Notification){
        
        if let city = notification.userInfo?["city"] as? City {
            cityNameLabel.text = city.name
            cityID = city.id
            getCityWeatherInfo()
        }
    }
}

