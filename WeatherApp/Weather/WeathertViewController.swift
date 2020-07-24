//
//  FirstViewController.swift
//  WeatherApp
//
//  Created by Work on 15/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import UIKit
import GoogleMaps

class WeatherViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let position = GMSCameraPosition(latitude: 0, longitude: 0, zoom: 1)
        mapView.camera = position
    }

}
