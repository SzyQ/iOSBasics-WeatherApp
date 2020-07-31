//
//  SimpleDI.swift
//  WeatherApp
//
//  Created by Work on 31/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import Foundation

class SimpleDI {
    
    private init() {}
    
    static let weatherRepo : WeatherRepository = NetworkWeatherRepository.shared
}
