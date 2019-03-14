//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    //Conforms to rules of CLLocationManagerDelegate, and ChangeCityDeleagte protocol from second view controller
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "31f396e0ef0b4cf0ce7cf0ee266556d5"
    /***Get your own App ID at https://openweathermap.org/appid ****/
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    //setting up location manager
    let weatherDataModel = WeatherDataModel()
    //setting up weatherDataModel
    var isToggled : Bool = true
    

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!


    @IBAction func changeTemp(_ sender: UISwitch) {
        
        if sender.isOn == true{
            
            temperatureLabel.text = "\(weatherDataModel.temperatureCel)°C"
            
            isToggled = true
            
        }
        else{
            
            temperatureLabel.text = "\(weatherDataModel.temperatureFah)°F"
            
            isToggled = false
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO:Set up the location manager here.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        //accuracy of location
        locationManager.requestWhenInUseAuthorization()
        //authorization for location, add properties to plist
        locationManager.startUpdatingLocation()
        
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    func getWeatherData(url: String, parameters: [String: String]) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success!")
                //prints success to console if alamofire request works
                
                let weatherJSON : JSON = JSON(response.result.value!)
                self.updateWeatherData(json: weatherJSON)
                //pulls json data from request
                
            }
            else {
                print("Error\(String(describing: response.result.error))")
                self.cityLabel.text = "Connection Issues"
                //prints error to console and to UI if unable to get data from request
            }
        }
        
    }
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    
    func updateWeatherData(json : JSON) {
        //class to parse json data
        if let tempResult = json["main"]["temp"].double {
            //optional binding to avoid crashes
            weatherDataModel.temperatureCel = Int(tempResult - 273.15)
        //gets tempresult from json -> gets set to temp variable from weatherdatamodel class and gets converted to int and correct temperature
            weatherDataModel.temperatureFah = Int(tempResult*9/5 - 460);
        
        weatherDataModel.city = json["name"].stringValue
        //gets city from json, converted to string
        
        weatherDataModel.condition = json["weather"]["0"]["id"].intValue
        //gets condition from json, converted to int
        
        weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
        //gets id from weather condition, gets stored in weatherIconName which is then used to display image of weather
     
            updateUIWithWeatherData()
            
    }
        else {
            cityLabel.text = "Weather Unavailable."
        }
    }
    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    func updateUIWithWeatherData() {
        
        cityLabel.text = weatherDataModel.city
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
        if isToggled {
            
            temperatureLabel.text = "\(weatherDataModel.temperatureCel)°C"
            
        }
        else {
            
            temperatureLabel.text = "\(weatherDataModel.temperatureFah)°F"
            
        }
        
    }
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            print("longitutde = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lon" : longitude, "lat" : latitude, "appid" : APP_ID]
            
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
        
    }
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Error getting location"
    }
    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    func userEnteredANewCityName(city: String) {
       
        let params : [String : String] = ["q" : city, "appid" : APP_ID]
        //parameters set by API to get searched location weather

        getWeatherData(url: WEATHER_URL, parameters: params)
        //calling getWeatherData method using params
        
    }
    //method/func for the ChangeCity protocol,
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "changeCityName" {
            
            let destinationVC  = segue.destination as! ChangeCityViewController
        
            destinationVC.delegate = self
            
        }

    }
    
}


