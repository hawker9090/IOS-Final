
#import <Foundation/Foundation.h>
#import "FoodPainAndCount.h"
#import "StringAndNumber.h"
#import <sqlite3.h>


@interface SQLiteFunctions : NSObject{
    sqlite3 *database;
}
+(void) initializeDatabase;
@property (strong, nonatomic) NSString *query;

//-------- start of insertion queries----------
-(void)insertIntoAccount: (NSString*)name
           andFamHistory:(NSString*)FamilyHistory
              andSmoking: (int) packsADay
              andAlcohol: (int) alcoholFrequency
             andAlergies: (NSString*) alergies;

-(void)aggregateDataForMeal: (NSArray*)foodEaten
                    andTime:(NSString*)mealTime
                   andSauce: (NSString*)sauce
                  andDrinks:(NSString*)drinks
             andDescription: (NSString*)mealDescription
                  andSpices:(NSString*)mealSpices
                    andSize:(NSString*)size
                  andCooked:(NSString*)cooked;

-(void)insertIntoFoodAtMeal: (NSString*)nameOfFood
                     atMeal: (int)mealNumberID;

-(void)insertIntoFoodTable: (NSString*)foodName;

-(void)insertIntoPain: (NSString*) timeOfPain
        andPainRating: (int)painRating
          andLocation: (NSString*) painLocation
       andDescription: (NSString*) painDescription;

-(void)insertIntoBM: (NSString*) timeOfPain
            andSize:(NSString*) sizeOfBM
           andColor:(NSString*) colorOfBM
           andBlood:(int) blood
         andUrgency:(int) urgency
     andDescription:(NSString*) description
    andConstipation:(int)constipationBool
        andDiarrhea:(int)diarrheaBool;

-(void)insertIntoColor: (NSString*)color;

/*will take all inputs (different days of week and different medtimes)
 and then call the insertion method depending on the values
 */
-(void)aggregateDataForMedTimes: (NSString*) medName
                       andTimes:(NSArray*) medTimes
                        andDays:(NSArray*) daysOfWeek;

-(void)insertIntoMedTimes: (NSString*) medName
                  andTime: (NSString*) medTime
                   andDay:(NSString*) dayOfWeek;

-(void)insertIntoCooked: (NSString*) howItWasCooked;

-(void)insertIntoSauce: (NSString*) sauceName;

-(void)insertIntoDrinks: (NSString*) drinkName;

-(void)insertIntoSpices: (NSString*) spicesName;

-(void)insertIntoConsistency: (NSString*) consistency;

-(void)insertIntoSize: (NSString*) size;

-(void)insertIntoBlood: (NSString*) blood;

-(void)insertIntoUrgency: (NSString*) urgency;

-(void)insertIntoPainLocations: (NSString*)painLocation;

-(void)insertIntoMood: (NSString*)mood;

-(void)insertIntoMedName: (NSString*)medName;


//-----end of insertion queries-----


//-----start of retrieval queries-----

//encapsulate calls to database in here so just returning the actual array or value needed
-(int) percentageOfMealsWithPainAfterward;
-(NSArray*) numberOfTimesEachFoodGivesPain;
-(NSArray*) foodThatGivesDiarreah;
-(NSArray*) foodThatGivesConstipation;
-(NSArray*) foodThatMakesGoToBathroomUrgent;
-(NSArray*) percentageOfTimesFoodGivesPain;
-(NSArray*) percentageOfTimesFoodGivesDiarreah;
-(NSArray*) percentageOfTimesFoodGivesConstipation;
//-----end of retrieval queries------

-(void) resetDatabase;

@end




