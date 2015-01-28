
#import "StringAndNumber.h"

@implementation StringAndNumber
@synthesize string;
@synthesize number;

-(id)init{
    return[self initWith: @"This doesn't Work" andNumber:1];
}

-(id)initWith: (NSString*)newString andNumber: (int) newNumber{
    self.string = newString;
    self.number = newNumber;
    return self;
}
@end
