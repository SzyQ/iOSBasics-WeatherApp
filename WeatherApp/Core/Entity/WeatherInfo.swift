//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Work on 25/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import Foundation

class WeatherInfo : NSObject {
    let tempMax: Int
    let tempMin: Int
    let temp: Int
    let pressure: Double
    let weatherDescription: String
    let iconURL: String
    let originalJson: String
    
    init(
        tempMax: Int,
        tempMin: Int,
        temp: Int,
        pressure: Double,
        description: String,
        iconURL: String,
        originalJson: String
    ) {
        self.tempMax = tempMax
        self.tempMin = tempMin
        self.temp = temp
        self.pressure = pressure
        self.weatherDescription = description
        self.iconURL = iconURL
        self.originalJson = originalJson
    }

    override var description: String {
        return originalJson
    }
}
