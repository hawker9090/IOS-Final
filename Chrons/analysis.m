

#import "analysis.h"

@interface analysis ()


@end

@implementation analysis
{
    NSArray* chapters;
    
    
}

@synthesize sqlitefunc;

- (void)viewDidLoad
{
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
    mainTable.backgroundView = backgroundImage;

    
    self.tabBarController.title = @"Analytics";
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[self->mainTable reloadData];
    //Initialize the dataArray
    dataArray = [[NSMutableArray alloc] init];
    sqlitefunc  = [[SQLiteFunctions alloc]init];
    NSArray *temparray = [sqlitefunc numberOfTimesEachFoodGivesPain];
    NSMutableArray *myArray = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0;i < [temparray count];i++)
    {
        FoodPainAndCount *a = [temparray objectAtIndex:i];
        [myArray addObject:[NSString stringWithFormat:@"%d\t\t\t\t\t\t%@", a.count,a.food]];
        
    }
    NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:myArray forKey:@"data"];
    //First section data
    //  NSArray *firstItemsArray = [[NSArray alloc] initWithObjects:@"Item 1", @"Item 2", @"Item 3", nil];
    //NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:firstItemsArray forKey:@"data"];
    [dataArray addObject:firstItemsArrayDict];
    
    NSArray *temparray1 = [sqlitefunc foodThatGivesDiarreah ];
    // NSMutableArray *myArray1 = [NSMutableArray arrayWithCapacity:100];
    NSDictionary *secondItemsArrayDict = [NSDictionary dictionaryWithObject:temparray1 forKey:@"data"];
    
    //Second section data
    // NSArray *secondItemsArray = [[NSArray alloc] initWithObjects:@"Item 4", @"Item 5", @"Item 6", @"Last Item", nil];
    //NSDictionary *secondItemsArrayDict = [NSDictionary dictionaryWithObject:secondItemsArray forKey:@"data"];
    [dataArray addObject:secondItemsArrayDict];
    
    NSArray *temparray2 = [sqlitefunc foodThatMakesGoToBathroomUrgent];
    NSDictionary *thirdItemsArrayDict = [NSDictionary dictionaryWithObject:temparray2 forKey:@"data"];
    [dataArray addObject:thirdItemsArrayDict];
    
    NSArray *temparray3 = [sqlitefunc foodThatGivesConstipation];
    NSDictionary *fourItemsArrayDict = [NSDictionary dictionaryWithObject:temparray3 forKey:@"data"];
    [dataArray addObject:fourItemsArrayDict];
    
    NSArray *temparray4 = [sqlitefunc percentageOfTimesFoodGivesPain];
    NSMutableArray *myArray1 = [NSMutableArray arrayWithCapacity:100];
    for (int i =0; i < [temparray4 count];i++) {
        StringAndNumber *a = [temparray4 objectAtIndex:i];
        if (a.number!= 100)
        {
            [myArray1 addObject:[NSString stringWithFormat:@"%d %% \t\t \t\t\t%@", a.number,a.string]];
        }
        else {
            [myArray1 addObject:[NSString stringWithFormat:@"%d %% \t \t\t\t%@", a.number,a.string]];
        }
        
    }
    NSDictionary *fifthItemsArrayDict = [NSDictionary dictionaryWithObject:myArray1 forKey:@"data"];
    [dataArray addObject:fifthItemsArrayDict];
    
    NSArray *temparray5 = [sqlitefunc percentageOfTimesFoodGivesDiarreah];
    NSMutableArray *myArray2 = [NSMutableArray arrayWithCapacity:100];
    for (int i =0; i < [temparray5 count];i++) {
        StringAndNumber *a = [temparray5 objectAtIndex:i];
        if (a.number!= 100)
        {
            [myArray2 addObject:[NSString stringWithFormat:@"%d %% \t\t \t\t\t%@", a.number,a.string]];
        }
        else {
            [myArray2 addObject:[NSString stringWithFormat:@"%d %% \t \t\t\t%@", a.number,a.string]];
        }
        
    }
    NSDictionary *sixthItemsArrayDict = [NSDictionary dictionaryWithObject:myArray2 forKey:@"data"];
    [dataArray addObject:sixthItemsArrayDict];
    
    
    
    NSArray *temparray6 = [sqlitefunc percentageOfTimesFoodGivesConstipation];
    NSMutableArray *myArray3 = [NSMutableArray arrayWithCapacity:100];
    for (int i =0; i < [temparray6 count];i++) {
        StringAndNumber *a = [temparray6 objectAtIndex:i];
        if (a.number!= 100)
        {
            [myArray3 addObject:[NSString stringWithFormat:@"%d %% \t\t \t\t\t%@", a.number,a.string]];
        }
        else {
            [myArray3 addObject:[NSString stringWithFormat:@"%d %% \t \t\t\t%@", a.number,a.string]];
        }
        
    }
    NSDictionary *sevenItemsArrayDict = [NSDictionary dictionaryWithObject:myArray3 forKey:@"data"];
    [dataArray addObject:sevenItemsArrayDict];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //Number of rows it should expect should be based on the section
    NSDictionary *dictionary = [dataArray objectAtIndex:section];
    NSArray *array = [dictionary objectForKey:@"data"];
    return [array count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	if(section == 0)
		return @"Frequency \t\t \t Food that gives pain";
    if(section == 1)
		return @"Foods that cause diarrhea";
    if (section == 2)
        return @"Foods that cause BATHROOM URGENCY";
    if (section == 3)
        return @"Foods that cause CONSTIPATION";
    if (section == 4)
        return @"Percentage \t \t \t Food that gives Pain";
    if (section == 5)
        return @"Percentage \t\t Food that gives Diarrea";
    if (section == 6)
        return @"Percentage \t\t Food that gives Constipation";
    
    return nil;
}



- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	
	if(section != 6){
		return @" "; //@"End of Section";
    } else {
        return @" "; //@"End of Chron's Analysis";
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //[mainTable reloadData];
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dictionary = [dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.opaque = NO;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	

    
    NSString *selectedCell = nil;
    NSDictionary *dictionary = [dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    selectedCell = [array objectAtIndex:indexPath.row];
    
    NSLog(@"%@", selectedCell);
    
    [mainTable deselectRowAtIndexPath:indexPath animated:YES];
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    [self viewDidLoad];
    [mainTable reloadData];
}

@end

