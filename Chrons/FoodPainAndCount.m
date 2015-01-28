
#import "FoodPainAndCount.h"

@implementation FoodPainAndCount
@synthesize food;
@synthesize count;

-(id)init{
    return[self initWith: @"This doesn't Work" andCount:1];
}

-(id)initWith: (NSString*)newFood andCount: (int) newCount{
    NSLog(@"%@",newFood);
    NSLog(@"%d",newCount);
    self.food = newFood;
    self.count = newCount;
    return self;
}

@end
