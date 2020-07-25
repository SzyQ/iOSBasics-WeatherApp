//
//  NetworkWeatherRepository.swift
//  WeatherApp
//
//  Created by Work on 25/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import Foundation
import AFNetworking

class NetworkWeatherRepository: WeatherRepository {
    
    static let shared = NetworkWeatherRepository()
    
    private let config : URLSessionConfiguration
    private let manager : AFHTTPSessionManager
    
    init() {
        config = URLSessionConfiguration.default
        manager = AFHTTPSessionManager(baseURL: URL(string: Build.WEATHER_BASE_URL)!, sessionConfiguration: config)
    }
    
    func getWeatherInfo(latitude: Double, longnitude: Double, completion: @escaping (WeatherInfo?, Error?) -> Void) {
        let url = "/data/2.5/weather"
        let parameters = ["lat" : String(latitude), "lon" : String(longnitude), "appid" : Build.WEATHER_API_KEY]
        manager.get(url, parameters: parameters,headers: nil, progress: nil, success: { (task, response) in
            guard let dictionary = response as? NSDictionary else {
                completion(nil,nil)
                return
            }
            completion(dictionary.toWeatherInfo(),nil)
        }) { (task, error) in
            completion(nil, error)
            
        }
    }
    
}

fileprivate extension NSDictionary {
    
    func toWeatherInfo() -> WeatherInfo {
        let main = self["main"] as! NSDictionary
        let tempMax = main["temp_max"] as! NSNumber
        let tempMin = main["temp_min"] as! NSNumber
        let temp = main["temp"] as! NSNumber
        let pressure = main["pressure"] as! NSNumber
        let weather = self["weather"] as! NSArray
        let weatherInfo = weather.firstObject as! NSDictionary
        let description = weatherInfo["description"] as! String
        let icon = weatherInfo["icon"] as! String
        let iconURL = "https://openweathermap.org/img/w/\(icon).png"
        return WeatherInfo(
            tempMax: tempMax.intValue, tempMin: tempMin.intValue, temp: temp.intValue, pressure: pressure.doubleValue, description: description, iconURL: iconURL, originalJson: self.description
        )
    }
}
