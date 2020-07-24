//
//  LegacyWeatherViewController.m
//  WeatherApp
//
//  Created by Work on 24/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LegacyWeatherViewController.h"

@implementation LegacyWeatherViewController

-(void)viewDidLoad {
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:0 longitude:0 zoom:1];
    _mapView.camera = camera;
}

@end
