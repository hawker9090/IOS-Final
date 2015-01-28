#import "med_alarm_select.h"

@interface med_alarm_select ()

@property (nonatomic, assign) NSInteger daily;
@end


@implementation med_alarm_select
@synthesize option;
@synthesize frequencyLabel;
@synthesize dailyWeekly;
@synthesize daily;

//
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
// modifier for the toggleEnabled
-(IBAction)toggleEnabledForOption:(id)sender
{
    //if the switch it on
    if(option.on)
    {
        //show the frequency modifiers
        frequencyLabel.hidden = FALSE;
        dailyWeekly.hidden = FALSE;
    }
    else {
        //else hide them
        frequencyLabel.hidden = TRUE;
        dailyWeekly.hidden = TRUE;
    }
}
// decide whether the alarm will be repeated daily
-(IBAction)selectSegment:(id)sender{
    NSInteger selectedSegment = dailyWeekly.selectedSegmentIndex;
    if (selectedSegment == 0)
    {
        daily = 1;
    }
    else
        daily = 0;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.itemText.delegate = self;
    
    option.layer.cornerRadius = 16.0;
    
    //modify background
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
    
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    
    NSLog(@"cancel");
 
    [self.navigationController popViewControllerAnimated:YES];
    
     
}

- (IBAction)save:(id)sender {
    
    [self.itemText resignFirstResponder];
    
    // Get the current date
    NSDate *pickerDate = [self.datePicker date];
    
    // Schedule the notification
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = self.itemText.text;
    localNotification.alertAction = @"Show me the item";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    // sound of the alarm
    localNotification.soundName = @"submarin.caf";
    if (option.on)
    {
        if (daily == 0)
            //schedule it every day
            localNotification.repeatInterval = NSWeekCalendarUnit;
        else {
            //schedule every wk
            localNotification.repeatInterval = NSWeekdayCalendarUnit;
        }
    }
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    // Request to reload table view data
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
    
    // Dismiss the view controller
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.itemText resignFirstResponder];
    return NO;
}
@end
