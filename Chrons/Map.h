
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPoint.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)


#define kGOOGLE_API_KEY @"AIzaSyCrOWKSZnOQd1Fdt6KWAWJAuUNllHmSv6g"



@interface Map : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    
    
    NSString *imageName;
    BOOL firstLaunch;
    
    CLLocationCoordinate2D currentCentre;
    int currenDist;
    
    
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;


@end
