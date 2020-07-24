//
//  Build.swift
//  WeatherApp
//
//  Created by Work on 24/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import Foundation

class Build: NSObject {
    private override init() {
    }
    
    static let WEATHER_API_KEY = Bundle.main.object(forInfoDictionaryKey: "Weather Api Key") as! String
    static let MAPS_API_KEY = Bundle.main.object(forInfoDictionaryKey: "Maps Api Key") as! String
}
