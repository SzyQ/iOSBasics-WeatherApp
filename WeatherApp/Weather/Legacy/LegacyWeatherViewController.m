//
//  LegacyWeatherViewController.m
//  WeatherApp
//
//  Created by Work on 30/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

#import "LegacyWeatherViewController.h"
#import <GoogleMaps/GoogleMaps.h>

//@interface LegacyWeatherViewController (MyAwesomeExtension)
//
//
//
//@end

@implementation LegacyWeatherViewController

@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    
    if([locationManager locationServicesEnabled]) {
        [locationManager requestLocation];
    } else {
        CLLocationDegrees latitude = 50.0836041;
        CLLocationDegrees longitude = 19.9738516;
        [self setLocation:latitude longitude:longitude];
        [locationManager requestWhenInUseAuthorization];
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse){
        [locationManager requestLocation];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = locations.firstObject;
    CLLocationCoordinate2D coordinates = location.coordinate;
    [self setLocation:coordinates.latitude longitude:coordinates.longitude];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Oh noooo! %@", error);
    
}

-(void)setLocation:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude {
    mapView.camera = [GMSCameraPosition cameraWithLatitude:latitude longitude:longitude zoom:11];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
