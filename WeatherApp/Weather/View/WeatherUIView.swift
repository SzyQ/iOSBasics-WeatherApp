//
//  WeatherUIView.swift
//  WeatherApp
//
//  Created by Work on 25/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import Foundation
import UIKit

class WeatherUIView: UIView {
  
    @IBOutlet weak var weaherIcon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pressure: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    func initView() {
        guard let view = Bundle.main.loadNibNamed("WeatherUIView", owner: self, options: nil)?.first as? UIView else {return}
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        addSubview(view)
    }
    
    fileprivate func loadImage(_ url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed fetching image:", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Not a proper HTTPURLResponse or statusCode")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.weaherIcon.image = UIImage(data: data!)
            }
        }.resume()
    }
    
    @objc func setup(info: WeatherInfo) {
        guard let url = URL(string: info.iconURL) else { return }
        loadImage(url)
        
        temperature.text = String(format: NSLocalizedString("Weather.Temperature", comment: "a"), info.temp)
        maxTemperature.text = String(format: NSLocalizedString("Weather.Max", comment: "a"), info.tempMax)
        minTemperature.text = String(format: NSLocalizedString("Weather.Min", comment: "a"), info.tempMin)
        descriptionLabel.text = info.weatherDescription
        pressure.text = String(format: NSLocalizedString("Weather.Pressure", comment: "a"), info.pressure)
    }
}
