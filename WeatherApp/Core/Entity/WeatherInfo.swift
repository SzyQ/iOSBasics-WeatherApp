//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Work on 31/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import Foundation

@objcMembers class WeatherInfo: NSObject {
    let temperature : Int
    let pressure : Int
    let minTemperature: Int
    let maxTemperature: Int
    let imageUrl : String
    let originalJson : String
    let weatherDescription: String
    
    init(temperature: Int, pressure: Int, minTemperature: Int, maxTemperature: Int, imageUrl : String,weatherDescription: String, originalJson: String) {
        self.temperature = temperature
        self.pressure = pressure
        self.minTemperature = minTemperature
        self.maxTemperature = maxTemperature
        self.imageUrl = imageUrl
        self.originalJson = originalJson
        self.weatherDescription = weatherDescription
    }
    
    override var description: String {
        return originalJson
    }
}
