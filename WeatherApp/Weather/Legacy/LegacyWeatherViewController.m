//
//  LegacyWeatherViewController.m
//  WeatherApp
//
//  Created by Work on 30/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

#import "LegacyWeatherViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <WeatherApp-Swift.h>


//@interface LegacyWeatherViewController (MyAwesomeExtension)
//
//
//
//@end

@implementation LegacyWeatherViewController

@synthesize mapView, weatherView;

- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    
    [locationManager requestWhenInUseAuthorization];
    
    if([CLLocationManager locationServicesEnabled]) {
        [locationManager requestLocation];
    } else {
        CLLocationDegrees latitude = 50.0836041;
        CLLocationDegrees longitude = 19.9738516;
        [self setLocation:latitude longitude:longitude];
        
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
    GMSMarker *marker = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(latitude, longitude)];
    marker.map = mapView;
    
    GetWeatherInfo *getWeatherInfo = [GetWeatherInfo new];
    [getWeatherInfo invokeWithLatitude:latitude longitude:longitude completion:^(WeatherInfo *weatherInfo, NSError *error) {
        __weak typeof(self) vc = self;
        if(vc == nil){
            return;
        }
        [vc.weatherView setInfoWithWeatherInfo:weatherInfo];
    }];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier  isEqual: @"introduction"]){
        IntroductionViewController *vc = (IntroductionViewController *)segue.destinationViewController;
        vc.name = @"Hi, I'm Simon!";
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
