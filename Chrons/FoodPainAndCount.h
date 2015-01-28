
#import <Foundation/Foundation.h>

@interface FoodPainAndCount : NSObject
@property (strong, nonatomic) NSString* food;
@property int count;
-(id)init;
-(id)initWith: (NSString*)newFood andCount: (int) newCount;
@end
