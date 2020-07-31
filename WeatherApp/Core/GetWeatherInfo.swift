//
//  GetWeatherInfo.swift
//  WeatherApp
//
//  Created by Work on 31/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import Foundation
import CoreLocation

class GetWeatherInfo: NSObject {
    
    private let repository = SimpleDI.weatherRepo
    
    @objc func invoke(latitude: CLLocationDegrees, longitude: CLLocationDegrees,  completion: @escaping (WeatherInfo?, Error?) -> Void) {
        return repository.getWeatherInfo(latitude: latitude, longitude: longitude, completion: completion)
    }
}
