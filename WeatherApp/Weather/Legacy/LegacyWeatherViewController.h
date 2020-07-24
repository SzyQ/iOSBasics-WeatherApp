//
//  LegacyWeatherViewController.h
//  WeatherApp
//
//  Created by Work on 24/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

#ifndef LegacyWeatherViewController_h
#define LegacyWeatherViewController_h


#endif /* LegacyWeatherViewController_h */

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface LegacyWeatherViewController : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

- (void)setLocation:(CLLocationCoordinate2D)location;

@end
