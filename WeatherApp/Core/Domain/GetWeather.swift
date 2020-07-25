//
//  GetWeather.swift
//  WeatherApp
//
//  Created by Work on 25/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import Foundation
import CoreLocation

class GetWeather: NSObject {
    
    var repo = SimpleDI.weatherRepo
    
    @objc func execute(location: CLLocationCoordinate2D, comletion: @escaping (WeatherInfo?, Error?) -> Void) {
        repo.getWeatherInfo(latitude: location.latitude, longnitude: location.longitude) { (info, error) in
            comletion(info,error)
        }
    }
}
