//
//  LegacyWeatherViewController.h
//  WeatherApp
//
//  Created by Work on 30/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LegacyWeatherViewController : UIViewController <CLLocationManagerDelegate>{
    CLLocationManager *locationManager;
}

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@end

NS_ASSUME_NONNULL_END
