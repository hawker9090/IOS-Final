#import "SQLiteFunctions.h"
#import <sqlite3.h>


@implementation SQLiteFunctions
//@synthesize SQLVariable;
@synthesize query;


//------ Begining of Insertion Queries--------

// aggregateDataForMeal allows you to add all meals details to the table meal
-(void)aggregateDataForMeal: (NSArray*)foodEaten
                    andTime:(NSString*)mealTime
                   andSauce: (NSString*)sauce
                  andDrinks:(NSString*)drinks
             andDescription: (NSString*)mealDescription
                  andSpices:(NSString*)mealSpices
                    andSize:(NSString*)size
                  andCooked:(NSString*)cooked{
    query = [NSString stringWithFormat:@"INSERT INTO meal VALUES(null, \"%@\", \"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\") ", cooked, mealTime, sauce, drinks, mealDescription, mealSpices, size];
    //NSLog(@"%@ mealtime",mealTime);
    [self insertIntoDatabase:query];
    //get latest ID to insert into foodAtMeal
    int mealNumber = [self getMaxIDInMeal];
    //get meal number of latest entry (max ID)
    for (int i=0; i<[foodEaten count]; i++) {
        [self insertIntoFoodAtMeal:[foodEaten objectAtIndex:i] atMeal: mealNumber];
    }
}

// getmaxidinread can be used to find the highest value of the index in the meal table
-(int) getMaxIDInMeal{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.db"];
    int result;
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        query = @"SELECT MAX(ID) from meal";
        const char *sql = [query UTF8String];
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            // We "step" through the results - once for each row.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                // The second parameter indicates the column index into the result set.
                result = sqlite3_column_int(statement, 0);
            }
        }
        sqlite3_finalize(statement);
    } else {
        // Even though the open failed, call close to properly clean up resources.
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
    }
    sqlite3_close(database);
    NSLog(@"%d",result);
    return result;
}

// it's used for the to add meal name into the foodatmeal table
-(void)insertIntoFoodAtMeal: (NSString*)nameOfFood
                     atMeal: (int)mealNumberID{
    query = [NSString stringWithFormat:@"INSERT INTO foodAtMeal VALUES(null, \"%@\", %d)", nameOfFood, mealNumberID];
    [self insertIntoDatabase:query];
}



// add the details of timeofpain, painRating (pain details) to the pain table
-(void)insertIntoPain: (NSString*) timeOfPain
        andPainRating: (int)painRating
          andLocation: (NSString*) painLocation
       andDescription: (NSString*) painDescription;
{
    query = [NSString stringWithFormat:@"INSERT INTO pain VALUES(null, \"%@\" , %i, \"%@\", \"%@\")",timeOfPain,painRating,painLocation,painDescription];
    [self insertIntoDatabase:query];
}

// insert the account holder details into the database
-(void)insertIntoAccount: (NSString*)name
           andFamHistory:(NSString*)FamilyHistory
              andSmoking: (int) packsADay
              andAlcohol: (int) alcoholFrequency
             andAlergies: (NSString*) alergies{
    query = [NSString stringWithFormat:@"INSERT INTO account VALUES(null, \"%@\", %d, %d, \"%@\", \"%@\" )", name, alcoholFrequency, packsADay, alergies, FamilyHistory];
    [self insertIntoDatabase:query];
    
}

// insert the food name into the foodtable
-(void)insertIntoFoodTable: (NSString*)foodName{
    query = [NSString stringWithFormat:@"INSERT INTO food VALUES(\"%@\")", foodName];
    [self insertIntoDatabase:query];
}

// insert the pain details which cause bowel movement to the bowelmovement table
-(void)insertIntoBM: (NSString*) timeOfPain
            andSize:(NSString*) sizeOfBM
           andColor:(NSString*) colorOfBM
           andBlood:(int) blood
         andUrgency:(int) urgency
     andDescription:(NSString*) description
    andConstipation:(int)constipationBool
        andDiarrhea:(int)diarrheaBool{
    query = [NSString stringWithFormat:@"INSERT INTO bm VALUES(null, \"%@\", \"%@\", \"%@\", %d, %d, \"%@\", %d, %d)",timeOfPain, sizeOfBM, colorOfBM, blood, urgency, description, constipationBool, diarrheaBool];
    [self insertIntoDatabase:query];
}

// function to insert the query into the database
-(void) insertIntoDatabase: (NSString*)finalQuery{
    //get path to database
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.db"];
    //try to open sqlite
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        const char *sql = [finalQuery UTF8String];
        sqlite3_stmt *statement;
        //try to run query
        sqlite3_prepare_v2(database, sql,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE) {
            //added into database
            //code for debug
        }
        else {
            int sqlite3_errcode(sqlite3 *db);
        }
        
    }// end of update
    else{
        NSLog(@"Failed to open Database");
    }
    sqlite3_close(database);
    // return 0;
}

//----- Never used these insertion queries below --------

-(void)insertIntoColor: (NSString*)color{
    query = [NSString stringWithFormat:@"INSERT INTO color VALUES(\"%@\")", color];
    [self insertIntoDatabase:query];
}
-(void)insertIntoCooked: (NSString*) howItWasCooked{
    query = [NSString stringWithFormat:@"INSERT INTO cooked VALUES(\"%@\")", howItWasCooked];
    [self insertIntoDatabase:query];
}

-(void)insertIntoSauce: (NSString*) sauceName{
    query = [NSString stringWithFormat:@"INSERT INTO sauce VALUES(\"%@\")", sauceName];
    [self insertIntoDatabase:query];
}

-(void)insertIntoDrinks: (NSString*) drinkName{
    query = [NSString stringWithFormat:@"INSERT INTO drinks VALUES(\"%@\")", drinkName];
    [self insertIntoDatabase:query];
}

-(void)insertIntoSpices: (NSString*) spicesName{
    query = [NSString stringWithFormat:@"INSERT INTO spices VALUES(\"%@\")", spicesName];
    [self insertIntoDatabase:query];
}

-(void)insertIntoConsistency: (NSString*) consistency{
    query = [NSString stringWithFormat:@"INSERT INTO consistency VALUES(\"%@\")", consistency];
    [self insertIntoDatabase:query];
}

-(void)insertIntoSize: (NSString*) size{
    query = [NSString stringWithFormat:@"INSERT INTO size VALUES(\"%@\")", size];
    [self insertIntoDatabase:query];
}

-(void)insertIntoBlood: (NSString*) blood{
    query = [NSString stringWithFormat:@"INSERT INTO blood VALUES(\"%@\")", blood];
    [self insertIntoDatabase:query];
}
-(void)insertIntoUrgency: (NSString*) urgency{
    query = [NSString stringWithFormat:@"INSERT INTO urgency VALUES(\"%@\")", urgency];
    [self insertIntoDatabase:query];
}

-(void)insertIntoPainLocations: (NSString*)painLocation{
    query = [NSString stringWithFormat:@"INSERT INTO painLocations VALUES(\"%@\")", painLocation];
    [self insertIntoDatabase:query];
}

-(void)insertIntoMood: (NSString*)mood{
    query = [NSString stringWithFormat:@"INSERT INTO mood VALUES(\"%@\")", mood];
    [self insertIntoDatabase:query];
}

-(void)insertIntoMedName: (NSString*)medName{
    query = [NSString stringWithFormat:@"INSERT INTO medName VALUES(\"%@\")", medName];
    [self numberOfTimesEachFoodGivesPain];
}


// ------- end of insertion queries --------//

//-------- beginning of retrieval queries --------

// retrieve the number of each food that gives pain into the array (food and number of times)
-(NSArray*) numberOfTimesEachFoodGivesPain{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.db"];
    //create results array
    NSMutableArray *result = [NSMutableArray new];
    
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        NSLog(@"GET IN");
        query = [NSString stringWithFormat:@"SELECT count(fm.name) as numOfTimes, fm.name"
                 " FROM foodAtMeal fm"
                 " WHERE fm.name IN ("
                 " SELECT fm.name"
                 " FROM meal m, foodAtMeal fm"
                 " WHERE m.time IN (SELECT m.time"
                 " FROM pain p, meal m"
                 " WHERE datetime(p.time) <= (datetime(m.time, \'+12 hours\')) AND datetime(p.time) >= datetime(m.time)"
                 " GROUP BY m.time)"
                 " AND m.ID = fm.meal"
                 " ORDER BY m.time DESC"
                 " )"
                 " GROUP BY fm.name"
                 " ORDER BY fm.name DESC"]
        ;
        const char *sql = [query UTF8String];
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            // We "step" through the results - once for each row.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                // The second parameter indicates the column index into the result set.
                //get name
                NSString * temp = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                //add to object
                FoodPainAndCount* item = [[FoodPainAndCount alloc] initWith: temp andCount:sqlite3_column_int(statement, 0)];
                //add object to array
                [result addObject:item];
            }
        }
        sqlite3_finalize(statement);
        
    } else {
        // Even though the open failed, call close to properly clean up resources.
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
    }
    sqlite3_close(database);
     return result;
}

// retrieve the number of each food that gives diarreah into the array (food and number of times)

-(NSArray*) foodThatGivesDiarreah{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.db"];
    //create results array
    NSMutableArray *result = [NSMutableArray new];
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        //NSLog(@"diearrr");
        query = [NSString stringWithFormat:@"SELECT fm.name, m.time"
                 " FROM meal m, foodAtMeal fm"
                 " WHERE m.time IN (SELECT m.time"
                 " FROM bm bm, meal m"
                 " WHERE (datetime(bm.time) <= (datetime(m.time, \'+12 hours\'))) AND (datetime(m.time) <= datetime(bm.time)) AND (bm.diarrhea >= 1)"
                 " GROUP BY m.time)"
                 " AND m.ID = fm.meal"
                 " GROUP BY fm.name"
                 " ORDER BY m.time DESC"]
        ;
        const char *sql = [query UTF8String];
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            // We "step" through the results - once for each row.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                // The second parameter indicates the column index into the result set.
                //get name
                NSString * temp = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                //add result to arrray
                [result addObject:temp];
            }
        }
        sqlite3_finalize(statement);
        
    } else {
        // Even though the open failed, call close to properly clean up resources.
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
        // Additional error handling, as appropriate...
    }
    sqlite3_close(database);
     return result;
    
}

// retrieve the number of each food that causes you to go to bathroom into the array (food and number of times)
-(NSArray*) foodThatMakesGoToBathroomUrgent{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.db"];
    //create results array
    NSMutableArray *result = [NSMutableArray new];
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        query = [NSString stringWithFormat:@"SELECT fm.name, m.time"
                 " FROM meal m, foodAtMeal fm"
                 " WHERE m.time IN (SELECT m.time"
                 " FROM bm bm, meal m"
                 " WHERE datetime(bm.time) <= (datetime(m.time, \'+12 hours\')) AND datetime(m.time) <= datetime(bm.time) AND bm.urgency = 1"
                 " GROUP BY m.time)"
                 " AND (m.ID = fm.meal)"
                 " GROUP BY fm.name"
                 " ORDER BY m.time DESC"]
        ;

        const char *sql = [query UTF8String];
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            // We "step" through the results - once for each row.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                // The second parameter indicates the column index into the result set.
                //get name
                NSString * temp = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                //add result to arrray
                
                [result addObject:temp];
            }
        }
        sqlite3_finalize(statement);
        
    } else {
        // Even though the open failed, call close to properly clean up resources.
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
    }
    sqlite3_close(database);
    return result;
    
}

// retrieve the number of each food that causes constipation and put into the array (food and number of times)
-(NSArray*) foodThatGivesConstipation{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.db"];
    //create results array
    NSMutableArray *result = [NSMutableArray new];
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        query = [NSString stringWithFormat:@"SELECT fm.name, m.time"
                 " FROM meal m, foodAtMeal fm"
                 " WHERE m.time IN (SELECT m.time"
                 " FROM bm bm, meal m"
                 " WHERE (datetime(bm.time) <= (datetime(m.time, \'+12 hours\'))) AND (datetime(m.time) <= datetime(bm.time)) AND (bm.constipation >= 1)"
                 " GROUP BY m.time)"
                 " AND m.ID = fm.meal"
                 " GROUP BY fm.name"
                 " ORDER BY m.time DESC"]
        ;
        const char *sql = [query UTF8String];
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            // We "step" through the results - once for each row.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                // The second parameter indicates the column index into the result set.
                //get name
                NSString * temp = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                //add result to arrray
                NSLog(@"%@",temp);
                
                [result addObject:temp];
            }
        }
        sqlite3_finalize(statement);
        
    } else {
        // Even though the open failed, call close to properly clean up resources.
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
    }
    sqlite3_close(database);
    return result;
}


// retrieve the percentage of each food that causes you pain the array (food and percentage number of times)
-(NSArray*) percentageOfTimesFoodGivesPain{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.db"];
    //create results array for final output
    NSMutableArray *result = [NSMutableArray new];
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        query = [NSString stringWithFormat:@"SELECT count(m.ID) AS numTimes, fm.name"
                 " FROM meal m"
                 " INNER JOIN foodAtMeal fm ON (m.ID = fm.meal)"
                 " WHERE m.time IN (SELECT m.time"
                                  " FROM pain p, meal m"
                                  " WHERE (datetime(p.time) <= (datetime(m.time, \'+12 hours\'))) AND (datetime(m.time) <= datetime(p.time))"
                                  " GROUP BY m.time)"
                 " GROUP BY fm.name"
                 " ORDER BY numTimes DESC "]
        ;
        
        const char *sql = [query UTF8String];
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            // We "step" through the results - once for each row.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                // The second parameter indicates the column index into the result set.
                //get name
                NSString * temp = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                //add to object
                
                StringAndNumber * st = [[StringAndNumber alloc]initWith:temp andNumber:sqlite3_column_int(statement, 0)];
                
                //get total number of times it apears in all meals
                int totalTimes = [self numTimesSpecificFoodInMeals:[st string]];
                //calculate percentage
               // NSLog(@"%d",st.number);
                // NSLog(@"%@",temp);
                // NSLog(@"%d is the number of times",totalTimes);
                st.number = (st.number * 100)/totalTimes;
                
                [result addObject:st];
            }
        }
        sqlite3_finalize(statement);
        
    } else {
        // Even though the open failed, call close to properly clean up resources.
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
    }
    sqlite3_close(database);
      return result;
}


// retrieve the number of times of a particular food has been eatten
//used when calculating percentage
-(int) numTimesSpecificFoodInMeals: (NSString*)foodToTest{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.db"];
    //create results array
    int result;
    // Open the database. The database was \prepared outside the application.
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        query = [NSString stringWithFormat:@"SELECT count(fm.name) as numTimes, fm.name"
                 " FROM foodAtMeal fm"
                 " WHERE fm.name = \"%@\"", foodToTest]
        ;
        const char *sql = [query UTF8String];
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            // We "step" through the results - once for each row.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                // The second parameter indicates the column index into the result set.
                //get name
                result = sqlite3_column_int(statement, 0);
                //add result to arrray
            }
        }
        sqlite3_finalize(statement);
        
    } else {
        // Even though the open failed, call close to properly clean up resources.
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
    }
    sqlite3_close(database);
    return result;
    
}


// retrieve the percentage of each food that causes you diarreah into the array (food and percentage number of times)
-(NSArray*) percentageOfTimesFoodGivesDiarreah{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.db"];
    //create results array for final output
    NSMutableArray *result = [NSMutableArray new];
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        query = [NSString stringWithFormat:@"SELECT count(m.ID), fm.name"
                 " FROM meal m"
                 " INNER JOIN foodAtMeal fm ON (m.ID = fm.meal)"
                 " WHERE m.time IN (SELECT m.time"
                                  " FROM bm bm, meal m"
                                  " WHERE (datetime(bm.time) <= (datetime(m.time, '+12 hours'))) AND (datetime(m.time) <= datetime(bm.time)) AND (bm.diarrhea >= 1)"
                                  " GROUP BY m.time)"
                " GROUP BY fm.name"
                 ];
        
        const char *sql = [query UTF8String];
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            // We "step" through the results - once for each row.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                // The second parameter indicates the column index into the result set.
                //get name
                NSString * temp = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                //add to object
                StringAndNumber * st = [[StringAndNumber alloc]initWith:temp andNumber:sqlite3_column_int(statement, 0)];
                //get total number of times it apears in all meals
                int totalTimes = [self numTimesSpecificFoodInMeals:[st string]];
        //NSLog(@"%d temp",totalTimes);
                //calculate percentage
                st.number = (st.number * 100)/totalTimes;
                [result addObject:st];
            }
        }
        sqlite3_finalize(statement);
        
    } else {
        // Even though the open failed, call close to properly clean up resources.
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
    }
    sqlite3_close(database);
    return result;
}

// retrieve the percentage of each food that causes you constipation into the array (food and percentage number of times)
-(NSArray*) percentageOfTimesFoodGivesConstipation{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.db"];
    //create results array for final output
    NSMutableArray *result = [NSMutableArray new];
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        query = [NSString stringWithFormat:@" SELECT count(m.ID), fm.name"
                 " FROM meal m"
                 " INNER JOIN foodAtMeal fm ON (m.ID = fm.meal)"
                 " WHERE m.time IN (SELECT m.time"
                                  " FROM bm bm, meal m"
                                  " WHERE (datetime(bm.time) <= (datetime(m.time, '+12 hours'))) AND (datetime(m.time) <= datetime(bm.time)) AND (bm.constipation >= 1)"
                                  " GROUP BY m.time)"
                 " GROUP BY fm.name"
                 ];
        const char *sql = [query UTF8String];
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            // We "step" through the results - once for each row.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                // The second parameter indicates the column index into the result set.
                //get name
                NSString * temp = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                //add to object
                StringAndNumber * st = [[StringAndNumber alloc]initWith:temp andNumber:sqlite3_column_int(statement, 0)];
                //get total number of times it apears in all meals
                int totalTimes = [self numTimesSpecificFoodInMeals:[st string]];
                //calculate percentage
                st.number = (st.number * 100)/totalTimes;
                [result addObject:st];
            }
        }
        sqlite3_finalize(statement);
        
    } else {
        // Even though the open failed, call close to properly clean up resources.
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
    }
    sqlite3_close(database);
    return result;
    
}



// empty the tables in the database
-(void) resetDatabase{
        
        /*drop table meal, foodAtMeal, food, pain, bm, color, medTimes, cooked, sauce, drinks, spices, consistency, size, blood, urgency, painLocations, mood, medName;*/
        
    query = @"DROP TABLE meal;";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE foodAtMeal;";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE food";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE pain";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE bm";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE color";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE medTimes";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE cooked";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE sauce";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE drinks";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE spices";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE consistency";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE size";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE blood";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE urgency";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE painLocations";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE mood";
    [self insertIntoDatabase:query];
    
    query = @"DROP TABLE medName";
    [self insertIntoDatabase:query];
        
    query = @"CREATE TABLE if not EXISTS account( "
        
        " ID INTEGER PRIMARY KEY ASC,"
        " name TEXT,"
        " alcohol INTEGER, "
        "smoking INTEGER, "
        " alergies INTEGER, "
        "family_history INTEGER "
        "); ";
    [self insertIntoDatabase:query];
        
        
        
    query = @"CREATE TABLE if not EXISTS meal( "
        "ID INTEGER PRIMARY KEY AUTOINCREMENT, "
        "cooked TEXT, "
        " time TEXT, "
        "sauce TEXT, "
        "drinks TEXT, "
        " description TEXT, "
        " spices TEXT, "
        " size TEXT "
        " ); ";
    [self insertIntoDatabase:query];
        
    query = @" CREATE TABLE if not exists foodAtMeal ( "
        " ID INTEGER PRIMARY KEY AUTOINCREMENT, "
        " name TEXT, "
        " meal INTEGER "
        " ); ";
    [self insertIntoDatabase:query];
    
    query = @" CREATE TABLE IF NOT EXISTS food ( "
        " name TEXT PRIMARY KEY NOT NULL "
        " ); ";
    [self insertIntoDatabase:query];
        
    query = @" CREATE TABLE IF NOT EXISTS pain ( "
        " ID INTEGER PRIMARY KEY AUTOINCREMENT, "
        " time TEXT, "
        " rating INT, "
        " location TEXT, "
        " description TEXT "
        " ); ";
    [self insertIntoDatabase:query];
        
    query = @" CREATE TABLE IF NOT EXISTS bm ( "
        " ID INTEGER PRIMARY KEY AUTOINCREMENT, "
        " time TEXT, "
        " size TEXT, "
        " color TEXT, "
        " blood INT, "
        " urgency INT, "
        " description TEXT,"
        " constipation INT, "
        " diarrhea INT "
        " ); ";
    [self insertIntoDatabase:query];
        
    query = @" CREATE TABLE IF NOT EXISTS color( "
        " ID TEXT PRIMARY KEY NOT NULL "
        " ); ";
    [self insertIntoDatabase:query];
    
    query = @" CREATE TABLE IF NOT EXISTS medTimes( "
        " ID INTEGER PRIMARY KEY AUTOINCREMENT, "
        " name TEXT, "
        " time TEXT, "
        " day TEXT); ";
    [self insertIntoDatabase:query];
    
    query = @" CREATE TABLE IF NOT EXISTS cooked( "
        " ID text NOT NULL); ";
    [self insertIntoDatabase:query];
    
    query = @" CREATE TABLE IF NOT EXISTS sauce( "
        " ID text NOT NULL); ";
    [self insertIntoDatabase:query];
    
    query = @" CREATE TABLE IF not exists drinks (ID TEXT NOT NULL); ";
    [self insertIntoDatabase:query];
    
    query = @" CREATE TABLE IF NOT EXISTS spices (ID TEXT NOT NULL); ";
    [self insertIntoDatabase:query];
    
    query = @" CREATE TABLE IF NOT EXISTS consistency(ID TEXT NOT NULL); ";
    [self insertIntoDatabase:query];
    
    query = @" CREATE TABLE IF NOT EXISTS size(ID TEXT NOT NULL); ";
    [self insertIntoDatabase:query];
    
    query = @" CREATE TABLE IF NOT EXISTS blood (ID TEXT NOT NULL); ";
    [self insertIntoDatabase:query];
    query = @" CREATE TABLE IF NOT EXISTS urgency(ID TEXT NOT NULL); ";
    [self insertIntoDatabase:query];
        
    query = @" CREATE TABLE IF NOT EXISTS painLocations(ID TEXT NOT NULL);";
    [self insertIntoDatabase:query];
    
    query = @" CREATE TABLE IF NOT EXISTS mood(ID TEXT NOT NULL); ";
    [self insertIntoDatabase:query];
    
    query = @" CREATE TABLE IF NOT EXISTS medName(ID TEXT NOT NULL); ";
    [self insertIntoDatabase:query];
        
    
}


@end

