
#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "SQLiteFunctions.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    sqlite3 *database;
    NSMutableArray *todos;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) SQLiteFunctions *sqlitefunc;
@end
