
#import <Foundation/Foundation.h>

@interface StringAndNumber : NSObject
@property (strong, nonatomic) NSString* string;
@property int number;
-(id)init;
-(id)initWith: (NSString*)newString andNumber: (int) newNumber;
@end
