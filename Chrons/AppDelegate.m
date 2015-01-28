
#import "AppDelegate.h"
#import <sqlite3.h>
@interface AppDelegate(Private)
- (void)createEditableCopyOfDatabaseIfNeeded;
- (void)initializeDatabase;
@end

@implementation AppDelegate
@synthesize sqlitefunc;
//@synthesize todos;

/*- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 {
 // Override point for customization after application launch.
 //createEditableCopyOfDatabaseIfNeeded();
 return YES;
 }*/

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	NSLog(@"Lanched");
    //sqlitefunc  = [[SQLiteFunctions alloc]init];
    
    //call create editable database
	[self createEditableCopyOfDatabaseIfNeeded];
    sqlitefunc  = [[SQLiteFunctions alloc]init];
    
    //[self sqlitefunc];
	//[self initializeDatabase];
	
	// Configure and show the window
    //	[window addSubview:[navigationController view]];
    //	[window makeKeyAndVisible];
    
    
    //update tab bar appearance - for some reason its not working on the Map tho
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor blueColor]];
    
    [[UITabBar appearance] setBackgroundColor:[UIColor colorWithRed:12.0/255.0 green:112.0/255.0 blue:204.0/255.0 alpha:1.0]];
    
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
}

- (void)createEditableCopyOfDatabaseIfNeeded {
    // First, test for existence.
    NSLog(@"EXIST");
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"data.db"];
    //test to see if there's a writable db file
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) {
        NSLog(@"Success");
        return;
    }
    // The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"data.db"];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
}

/*- (void)initializeDatabase {
    NSMutableArray *todoArray = [[NSMutableArray alloc] init];
    // self.todos = todoArray;
    //[todoArray release];
    // The database is stored in the application bundle.
    NSLog(@"HAHA");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"cappdatabase.db"];
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        // Get the primary key for all books.
        NSString *querySQL = @"SELECT ID FROM meal";
        const char *sql = [querySQL UTF8String];
        sqlite3_stmt *statement;
        //NSLog(@"ADA");
        
        // Preparing a statement compiles the SQL query into a byte-code program in the SQLite library.
        // The third parameter is either the length of the SQL string or -1 to read up to the first null terminator.
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            // We "step" through the results - once for each row.
            //  NSLog(@"damn");
            NSLog(@"IN");
            while (sqlite3_step(statement) == SQLITE_ROW) {
                // The second parameter indicates the column index into the result set.
                int primaryKey = sqlite3_column_int(statement, 0);
                NSLog(@"@%i",primaryKey);
                // We avoid the alloc-init-autorelease pattern here because we are in a tight loop and
                // autorelease is slightly more expensive than release. This design choice has nothing to do with
                // actual memory management - at the end of this block of code, all the book objects allocated
                // here will be in memory regardless of whether we use autorelease or release, because they are
                // retained by the books array.
                //    Todo *td = [[Todo alloc] initWithPrimaryKey:primaryKey database:database];
                //   [todos addObject:td];
                //  [td release];
            }
        }
        //else { NSLog(@"bye");}
        // "Finalize" the statement - releases the resources associated with the statement.
        sqlite3_finalize(statement);
    } else {
        // Even though the open failed, call close to properly clean up resources.
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
        // Additional error handling, as appropriate...
    }
	
	//NSLog([[NSString alloc] initWithFormat:@"size:%@",[[todos objectAtIndex:3] text]]);
}
*/
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
