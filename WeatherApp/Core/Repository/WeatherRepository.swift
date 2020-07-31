//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Work on 24/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherRepository {
    
    func getWeatherInfo(latitude: CLLocationDegrees, longitude: CLLocationDegrees,  completion: @escaping (WeatherInfo?, Error?) -> Void)
}
