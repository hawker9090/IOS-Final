#import "BM.h"
#import "SQLiteFunctions.h"

@interface BM ()

@end
// haha hihi
@implementation BM

NSString* _storing_time_data;
NSDate* _storing_date_data;


@synthesize _time_button;
@synthesize _log_button;
@synthesize _date_picker;
@synthesize _complete_button;
@synthesize _blood;
@synthesize _color_tf;
@synthesize _constipation;
@synthesize _description;
@synthesize _diarrhea;
@synthesize _scroll;
@synthesize _size_tf;
@synthesize _urgency;
@synthesize sqlitefunc;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    //adjust mainstoryboard to look better
    
    _description.layer.cornerRadius = 5;
    _description.layer.borderWidth = 0.5f;
    _description.layer.borderColor = [[UIColor grayColor] CGColor];
    
    //adjust switches
    _blood.layer.cornerRadius = 16.0;
    _blood.onTintColor = [UIColor colorWithRed:12.0/255.0 green:112.0/255.0 blue:204.0/255.0 alpha:1.0];
    _urgency.layer.cornerRadius = 16.0;
    _urgency.onTintColor = [UIColor colorWithRed:12.0/255.0 green:112.0/255.0 blue:204.0/255.0 alpha:1.0];
    _constipation.layer.cornerRadius = 16.0;
    _constipation.onTintColor = [UIColor colorWithRed:12.0/255.0 green:112.0/255.0 blue:204.0/255.0 alpha:1.0];
    _diarrhea.layer.cornerRadius = 16.0;
    _diarrhea.onTintColor = [UIColor colorWithRed:12.0/255.0 green:112.0/255.0 blue:204.0/255.0 alpha:1.0];
    _complete_button.tintColor = [UIColor colorWithRed:12.0/255.0 green:112.0/255.0 blue:204.0/255.0 alpha:1.0];
    
    
    [super viewDidLoad];
    [super viewDidLoad];
    [self._scroll setScrollEnabled:YES];
    
    // adjust scroll properties
    [self._scroll setContentSize:(CGSizeMake(320, 800))];
    self._scroll.center = CGPointMake(160, 260);
    
    // adding tap feature for dismissing keyboard, and putting in swipe features
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyBoard)];
    UISwipeGestureRecognizer *_swipeL = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    UISwipeGestureRecognizer *_swipeR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    
    [_swipeL setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [_swipeR setDirection:(UISwipeGestureRecognizerDirectionRight)];
    
    [self.view addGestureRecognizer:_swipeR];
    [self.view addGestureRecognizer:_swipeL];
    
    [self.view addGestureRecognizer:tap];
    
    //pikcer view will be shown when the proper button is tapped
    _complete_button.hidden = true;
    _date_picker.hidden = true;

    //add background image
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
    
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
}


-(void)swipeLeft
{
    //segue to pain input
    [self performSegueWithIdentifier:@"bm_to_pain" sender:self];
    
}


-(void)swipeRight
{
    //segue to meal input
    [self performSegueWithIdentifier:@"bm_to_meal" sender:self ];
    
}


-(void)dismissKeyBoard{
    
    [_description resignFirstResponder];
    [_color_tf resignFirstResponder];
    [_size_tf resignFirstResponder];
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)_back_button:(id)sender {
    //inserted due to swipe features
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)time_touched:(id)sender {
    
    // appear scroll, hide textfield for better view.
    [self dismissKeyBoard];
    [_scroll    setScrollEnabled:FALSE];
    _complete_button.hidden = false;
    _date_picker.hidden = false;
    _log_button.hidden = true;
    _description.hidden = true;
}

- (IBAction)complete_touched:(id)sender {
    
    //saving the values from the picker as well as showing the selected time on the button.
    [self _change_default_view];
    
    //get date
    NSDate* chosen = [_date_picker date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    [dateFormatter setDateFormat:@"hh:mm a"];
    
    NSString* formattedDateString = [dateFormatter stringFromDate:chosen];
    
    //change button to the formatted string
    _time_button.titleLabel.text = formattedDateString;
    //store time data
    _storing_time_data = [NSString stringWithFormat: formattedDateString];
    //store date data
    _storing_date_data = chosen;
    
    
}

-(void) _change_default_view
{
    //hide or reveal things
    [_scroll setScrollEnabled:TRUE];
    _complete_button.hidden = true;
    _date_picker.hidden = true;
    _log_button.hidden = false;
    _description.hidden = false;

}

//delegates functions for the text field.

-(void)textFieldDidBeginEditing: (UITextField *)textField{
    //change scroll on page
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y - 40);
    
    
    [_scroll setContentOffset:scrollPoint animated:YES];
    [self _change_default_view];
    
}


-(void)textFieldDidEndEditing:(UITextField *) textField{
    [_scroll setContentOffset:CGPointZero animated: YES];
    
}

-(void)textViewDidBeginEditing:(UITextView*)textView
{
    //change scroll on page
    CGPoint scrollPoint = CGPointMake(0, textView.frame.origin.y - 110);
    
    [_scroll setContentOffset:scrollPoint animated:YES];
    [self _change_default_view];

    
}

-(void)textViewDidEndEditing:(UITextView*) textView
{
    [textView resignFirstResponder];
    
}

// once logged is pressed, alert pops up to make sure, and returns back to the main page.
- (IBAction)log_touched:(id)sender {
    
    //NSLog(@"Button Pressed");
    
    //alert view pops up
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Is this the correct information?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"Cancel", nil];
    
    [alert show];
    
    

}


-(void)alertView: (UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == 0) // click yes (need to modify to SQL (MODIFIED))
    {
        //get the datestring formatted how we want it
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        
        NSString* formattedDateString = [dateFormat stringFromDate:date];
        
        sqlitefunc = [[SQLiteFunctions alloc]init];
        
        NSDateFormatter *dateFormatter =[[NSDateFormatter alloc]init];
        
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateFormat:@"HH:mm"];
        
        //get the time string we need to insert into the database
        NSString* time_format = [dateFormatter stringFromDate:_storing_date_data];
        
        //combine date and time into one string
        formattedDateString = [NSString stringWithFormat:@"%@ %@",formattedDateString,time_format];
        
        //call method to insert into database
        [sqlitefunc insertIntoBM:formattedDateString andSize:_size_tf.text andColor:_color_tf.text andBlood:_blood.on andUrgency:_urgency.on andDescription:_description.text andConstipation:_constipation.on andDiarrhea:_diarrhea.on];
        
        
        
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        
    }
    
    
    
}

@end
