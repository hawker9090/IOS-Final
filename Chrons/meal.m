#import "meal.h"

@implementation meal

NSDate* _storing_chosen_date;

@synthesize _food;
@synthesize _prepared;
@synthesize _size;
@synthesize _sauces;
@synthesize _drinks;
@synthesize _spices;
@synthesize _description;
@synthesize sqlitefunc;

@synthesize myscroller;

@synthesize _time_button;
@synthesize _complete_button;
@synthesize _date_picker;
@synthesize __log_button;



-(void) viewDidLoad
{
    [super viewDidLoad];
    
    // set scroll property and view appearances
    
    //change scroll view to make it start at the right part
    [self.myscroller setScrollEnabled:YES];
    [self.myscroller setContentSize:(CGSizeMake(320, 800))];
    self.myscroller.center = CGPointMake(160, 270);
    
    _description.layer.cornerRadius = 5;
    _description.layer.borderWidth = 0.5f;
    _description.layer.borderColor = [[UIColor grayColor] CGColor];
    
  
    
    //add gesture recognizer for swipe and dismiss key board purposes
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyBoard)];
    
    UISwipeGestureRecognizer *_swipeL = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    UISwipeGestureRecognizer *_swipeR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    
    [_swipeL setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [_swipeR setDirection:(UISwipeGestureRecognizerDirectionRight)];
    
    [self.view addGestureRecognizer:_swipeR];
    [self.view addGestureRecognizer:_swipeL];
    [self.view addGestureRecognizer:tap];
    
    
    //don't show the picker and complete button initially.
    _complete_button.hidden = true;
    _date_picker.hidden = true;

    //create background image
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    
}

-(void)swipeLeft
{

    [self performSegueWithIdentifier:@"meal_to_bm" sender:self];
    
}


-(void)swipeRight
{
    [self performSegueWithIdentifier:@"meal_to_pain" sender:self ];
    
}

- (IBAction)log_button:(id)sender {
    
    
    NSLog(@"Button Pressed");
    // show warning before logging in the information to the database
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Is this the correct information?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"Cancel", nil];
    
    [alert show];
    
    
    
}

// alert actions
-(void)alertView: (UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == 0) // click yes (need to modify to SQL(Modified!))
    {
        
        NSDate *date = [NSDate date];
        
        //create date format
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        
        NSString* formattedDateString = [dateFormat stringFromDate:date];
        // storing information into database
        int len = [self._food.text length];
        NSMutableString *tempString= [NSMutableString stringWithCapacity:1000];
        NSMutableArray *arrayOfFood = [[NSMutableArray alloc] init];
        int counter = 0;
        
        //step trhough and take out whitespace and separate input into multiple food items
        for (int i = 0;i < len;i++)
        {
            unichar ch = [self._food.text characterAtIndex:i];
            if (ch == ' ')
            {
                counter++;
                [arrayOfFood addObject:tempString];
                // NSLog(@"%@",arrayOfFood);
                tempString  = [[NSMutableString alloc]init];
                [tempString setString:@""];
            }
            else {
                if ((ch != ',')||(ch != '.'))
                {
                    [tempString appendString:[NSString stringWithCharacters:&ch length:1]];
                }
            }
        }
        
        if ([tempString length] != 0)
        {
            [arrayOfFood addObject:tempString];
        }
        
        
        sqlitefunc  = [[SQLiteFunctions alloc]init];
        
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        
        
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        
        [dateFormatter setDateFormat:@"HH:mm"];
        
        //create time formatted string
        NSString* time_format= [dateFormatter stringFromDate:_storing_chosen_date];
        
        
        //create complete time and date formatted string
        formattedDateString = [NSString stringWithFormat:@"%@ %@",formattedDateString,time_format];
        
        //insert into sqlite database
        [sqlitefunc aggregateDataForMeal:arrayOfFood andTime:formattedDateString andSauce:_sauces.text andDrinks:_drinks.text andDescription:_description.text andSpices:_spices.text andSize:_size.text andCooked:_prepared.text];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        
    }
    
    
    
}

//show datepicker to input time
- (IBAction)time_pressed:(id)sender {
    
    [myscroller setScrollEnabled:FALSE];
    _complete_button.hidden = false;
    _date_picker.hidden = false;
    __log_button.hidden = true;
    _description.hidden = true;
    
    
}

//store time value from picker
- (IBAction)complete_pressed:(id)sender {
    
    [self change_default_view];
    NSDate* chosen = [_date_picker date];
    _storing_chosen_date = chosen;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    [dateFormatter setDateFormat:@"hh:mm a"];
    
    NSString* formattedDateString = [dateFormatter stringFromDate:chosen];
    
    //show formatted time that they chose
    _time_button.titleLabel.text = formattedDateString;
    
    
    
}

// used whenever a picker is in use
-(void) change_default_view
{
    [myscroller setScrollEnabled:TRUE];
    _complete_button.hidden = true;
    _date_picker.hidden = true;
    __log_button.hidden = false;
    _description.hidden = false;
    
}

//dismiss the keyboard
-(void)dismissKeyBoard{
    
    [_food resignFirstResponder];
    [_prepared resignFirstResponder];
    [_size resignFirstResponder];
    [_drinks resignFirstResponder];
    [_sauces resignFirstResponder];
    [_spices resignFirstResponder];
    [_description resignFirstResponder];
    
}

// delegate methods for textfield and text view (mostly to get rid of key board and moving scrolls when textfield is clicked)
-(void)textFieldDidBeginEditing: (UITextField *)textField{
    [self change_default_view];
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y - 70);
    [myscroller setContentOffset:scrollPoint animated:YES];
    
}


-(void)textFieldDidEndEditing:(UITextField *) textField{
    [myscroller setContentOffset:CGPointZero animated: YES];
}

-(void)textViewDidBeginEditing:(UITextView*)textView
{
    [self change_default_view];
    //change scroller
    CGPoint scrollPoint = CGPointMake(0, textView.frame.origin.y - 110);
    
    [myscroller setContentOffset:scrollPoint animated:YES];
    
}

-(void)textViewDidEndEditing:(UITextView*) textView
{
    [textView resignFirstResponder];
    
}

// added after inserting swipe features
- (IBAction)_back_button:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
