//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Work on 24/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import Foundation

protocol WeatherRepository {
    
    func getWeatherInfo(latitude: Double, longnitude: Double, completion: @escaping (WeatherInfo?, Error?) -> Void)
}
