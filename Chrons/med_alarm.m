
#import "med_alarm.h"


@interface med_alarm ()
- (void)reloadTable;

@end

@implementation med_alarm
// initialization
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadTable)
                                                 name:@"reloadData"
                                                object:nil];
    //create background
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[UIApplication sharedApplication] scheduledLocalNotifications] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Get list of local notifications and store it inside the table
    NSMutableArray *localNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
    //get notification
    UILocalNotification *localNotification = [localNotifications objectAtIndex:indexPath.row];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    // Display notification info
    [cell.textLabel setText:localNotification.alertBody];
    [cell.detailTextLabel setText:[formatter stringFromDate:localNotification.fireDate]];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.opaque = NO;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSMutableArray *Arr=[[NSMutableArray alloc] initWithArray:[[UIApplication sharedApplication]scheduledLocalNotifications]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    //get local notification
    UILocalNotification *localNotification = [Arr objectAtIndex:indexPath.row];
    NSString *compareString = [formatter stringFromDate:localNotification.fireDate];
    
    // delete notification once the user remove it
    for (int k=0;k<[Arr count];k++) {
        UILocalNotification *not=[Arr objectAtIndex:k];
        NSString *dateString = [formatter stringFromDate:not.fireDate];
        NSLog(@"%@",dateString);
        if([dateString isEqualToString:compareString])
        {
            [[UIApplication sharedApplication] cancelLocalNotification:not];
        }
    }
    [self.tableView reloadData];
}

- (void)reloadTable
{
    [self.tableView reloadData];
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [self viewDidLoad];
    [self.tableView reloadData];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
