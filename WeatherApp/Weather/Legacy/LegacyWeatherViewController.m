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
#import <WeatherApp-Swift.h>


@implementation LegacyWeatherViewController

@synthesize weatherView, mapView;

-(void)viewDidLoad {
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    [weatherView setHidden:true];
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
    mapView.camera = camera;
    GMSMarker *marker = [GMSMarker new];
    marker.position = location;
    marker.map = mapView;
    GetWeather *weather = [GetWeather new];
    [weather executeWithLocation:location comletion:^(WeatherInfo *info, NSError *error){
        NSLog(@"Received weather info: %@", info.description);
        __weak typeof(self) weakSelf = self;
        if(weakSelf == nil){
            return;
        }
        [weakSelf.weatherView setupWithInfo:info];
        [weakSelf.weatherView setHidden:false];
    }];
}

@end
