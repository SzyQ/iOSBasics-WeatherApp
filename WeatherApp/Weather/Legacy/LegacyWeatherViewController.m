//
//  LegacyWeatherViewController.m
//  WeatherApp
//
//  Created by Work on 24/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LegacyWeatherViewController.h"
#import <CoreLocation/CoreLocation.h>


@implementation LegacyWeatherViewController

-(void)viewDidLoad {
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    if([CLLocationManager locationServicesEnabled]){
        [locationManager requestLocation];
    }else {
        [self setLocation:CLLocationCoordinate2DMake(0, 0)];
        [locationManager requestWhenInUseAuthorization];
    }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse){
        [locationManager requestLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocationCoordinate2D coordinate = locations.firstObject.coordinate;
    NSLog(@"Got location! (%@)", locations);
    [self setLocation:coordinate];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Couldn't read location! (%@)", error);
}

-(void)setLocation:(CLLocationCoordinate2D)location {
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:location.latitude longitude:location.longitude zoom:10];
    _mapView.camera = camera;
    GMSMarker *marker = [GMSMarker new];
    marker.position = location;
    marker.map = _mapView;
}



@end
