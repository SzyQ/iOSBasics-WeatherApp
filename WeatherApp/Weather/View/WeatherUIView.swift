//
//  WeatherUIView.swift
//  WeatherApp
//
//  Created by Work on 30/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import UIKit

@objcMembers class WeatherUIView: UIView {

    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    @IBOutlet weak var pressure: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        let parent = Bundle.main.loadNibNamed("WeatherUIView", owner: self, options: nil)?.first as! UIView
        parent.frame = self.bounds
        parent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(parent)
    }
    
    @objc func setInfo(weatherInfo: WeatherInfo) {
        temperature.text = String(format: NSLocalizedString("Weather.Temperature", comment: ""), weatherInfo.temperature)
        minTemperature.text = String(format: NSLocalizedString("Weather.Min", comment: ""), weatherInfo.minTemperature)
        maxTemperature.text = String(format: NSLocalizedString("Weather.Max", comment: ""), weatherInfo.maxTemperature)
        pressure.text = String(format: NSLocalizedString("Weather.Pressure", comment: ""), weatherInfo.pressure)
        
        URLSession.shared.dataTask(with: URL(string:weatherInfo.imageUrl)!) { (data, response, error) in
            if error != nil {
                print("Failed fetching image:", error.debugDescription)
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Not a proper HTTPURLResponse or statusCode")
                return
            }

            DispatchQueue.main.async {
                self.weatherIcon.image = UIImage(data: data!)
            }
        }.resume()

    }
}
