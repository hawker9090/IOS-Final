//

#import "pain.h"

@implementation pain

NSString* _storing_time_data;
NSDate* _storing_date_data;

@synthesize severity;
@synthesize description;
@synthesize location_tf;

@synthesize _time_button;
@synthesize _date_picker;
@synthesize _complete_button;
@synthesize _scroller;
@synthesize _log_button;
@synthesize _slider_outlet;

@synthesize sqlitefunc;

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    //setting appearances of the view
    description.layer.cornerRadius = 5;
    
    //alter scroller
    [self._scroller setScrollEnabled:YES];
    [self._scroller setContentSize:(CGSizeMake(320,500))];
    
    self._scroller.center = CGPointMake(160,240);

    //alter description text box
    description.layer.cornerRadius = 5;
    description.layer.borderWidth = 0.5f;
    description.layer.borderColor = [[UIColor grayColor] CGColor];
    
    //put int background image
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
    
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    

    //adding gesture recognizer for dismissing keyboard and swipes
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyBoard)];
    UISwipeGestureRecognizer *_swipeL = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    UISwipeGestureRecognizer *_swipeR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    
    [_swipeL setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [_swipeR setDirection:(UISwipeGestureRecognizerDirectionRight)];
    
    [self.view addGestureRecognizer:_swipeR];
    [self.view addGestureRecognizer:_swipeL];

    
    [self.view addGestureRecognizer:tap];
    [self._scroller addGestureRecognizer:tap];
    _complete_button.hidden = true;
    _date_picker.hidden = true;
  
    

    
    severity.text = @"0";
    
}

// inputting swipes
-(void)swipeLeft
{
    
    [self performSegueWithIdentifier:@"pain_to_meal" sender:self];
    
}


-(void)swipeRight
{
    [self performSegueWithIdentifier:@"pain_to_bm" sender:self ];
    
}


// removing keyboard
-(void)dismissKeyBoard
{
    [severity resignFirstResponder];
    [description resignFirstResponder];
    [location_tf resignFirstResponder];
    
}

- (IBAction)log:(id)sender {
    
    NSLog(@"Button Pressed");
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Is this the correct information?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"Cancel", nil];
    
    [alert show];
    
    
}


// a method to call whenever user choose to decide the textfield while picker view.
-(void) change_default_view
{
    [_scroller setScrollEnabled:true];
    _complete_button.hidden = true;
    _date_picker.hidden = true;
    _log_button.hidden = false;
    description.hidden = false;
}

//storing the information from the pickerview
- (IBAction)complete_pressed:(id)sender {

    [self change_default_view];
    //get date from date picker
    NSDate* chosen = [_date_picker date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    [dateFormatter setDateFormat:@"hh:mm a"];

    NSString* formattedDateString = [dateFormatter stringFromDate:chosen];
    //display formatted time string
    _time_button.titleLabel.text = formattedDateString;
    
    _storing_time_data = [NSString stringWithFormat: formattedDateString];
    
    _storing_date_data = chosen;
    
}

// loading the pickerview for time
- (IBAction)time_pressed:(id)sender {
    
    [self dismissKeyBoard];
    [_scroller setScrollEnabled:false];
    _complete_button.hidden = false;
    _date_picker.hidden = false;
    _log_button.hidden = true;
    description.hidden = true;
    
}


// inserted due to swipe
- (IBAction)_back_button:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

// confirmation before inputting data
-(void)alertView: (UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    // if yes, store the information into the database
    if(buttonIndex == 0)
    {
        
        
        
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        
        NSString* formattedDateString = [dateFormat stringFromDate:date];
        
        
        sqlitefunc  = [[SQLiteFunctions alloc]init];
        
        
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        
        
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        
        [dateFormatter setDateFormat:@"HH:mm"];
        
        NSString* time_format= [dateFormatter stringFromDate:_storing_date_data];
        
        int sever_rating_int = [severity.text intValue];
        
        
        formattedDateString = [NSString stringWithFormat:@"%@ %@",formattedDateString,time_format];
        
        
        //insert into database
        [sqlitefunc insertIntoPain:formattedDateString andPainRating:sever_rating_int andLocation:location_tf.text andDescription:description.text];
        
        
        
        
        [self.navigationController popToRootViewControllerAnimated:YES];

        
        
        
    }
}

// text fields delegate, and move the scroll up to the point
-(void)textFieldDidBeginEditing: (UITextField *)textField{
    [self change_default_view];
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y - 50);
    [_scroller setContentOffset:scrollPoint animated:YES];
    
}


-(void)textFieldDidEndEditing:(UITextField *) textField{
    [_scroller setContentOffset:CGPointZero animated: YES];
}

-(void)textViewDidBeginEditing:(UITextView*)textView
{
    CGPoint scrollPoint = CGPointMake(0, textView.frame.origin.y - 50);
    
    [_scroller setContentOffset:scrollPoint animated:YES];
        [self change_default_view];
    
}

-(void)textViewDidEndEditing:(UITextView*) textView
{
    [textView resignFirstResponder];
    
}


// slider for pain.
- (IBAction)sliding:(id)sender {
    
    int sliding_value = _slider_outlet.value;
    
    severity.text = [NSString stringWithFormat:@"%i",sliding_value];
    
    
}
@end
