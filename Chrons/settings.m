

#import "settings.h"


@interface settings()

@property (strong, nonatomic) NSArray* smoking_array;
@property (strong, nonatomic) NSArray* drinking_array;

    


@end


@implementation settings

int picker_index;
float picker_coor_y;
float complete_button_y;

bool DOB_chosen;


NSMutableArray* day_array;
NSMutableArray* year_array;
NSArray* month_array;


@synthesize sqlitefunc;
@synthesize _picker_title;
@synthesize _picker;
@synthesize smoking_button;
@synthesize complete_button;
@synthesize smoking_array;
@synthesize drinking_array;
@synthesize alcohol_button;
@synthesize name_tf;
@synthesize DOB_button;
@synthesize diagnosed_button;


-(void) viewDidLoad{
    
    
    
    

    [super viewDidLoad];
    
    sqlitefunc  = [[SQLiteFunctions alloc]init];
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyBoard)];
    
    
    [self.view addGestureRecognizer:tap];
    // setting the arrays for the pickerview, this one is a pickerview, not a date pickerview
    
    complete_button.hidden = TRUE;
    _picker_title.hidden = TRUE;
    
    smoking_array = [[NSArray alloc] initWithObjects:@"None",@"< half a pack", @"Half a pack", @"1 pack", @"1~2 packs", @"more than 2 packs", nil];
    
    drinking_array = [[NSArray alloc] initWithObjects:@"None", @"1~3 per week", @"3~5 per week", @"More than 5 per week", nil];

    
    day_array = [[NSMutableArray alloc] init];
    
    for(int i = 1; i <= 31 ; i++)
    {
        [day_array addObject:[NSString stringWithFormat:@"%d",i]];
        
    }
    
    month_array = [[NSArray alloc] initWithObjects:@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec", nil];
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy"];
    NSString *yearString = [dateFormat stringFromDate:today];
    
    // make an integer to change it to string for pickerview
    int temp;
    
    year_array = [[NSMutableArray alloc] init];
    
    for(int i =0; i < 100; i++)
    {
        temp = [yearString intValue] - i;
        [year_array addObject: [NSString stringWithFormat:@"%d",temp]];
        
    }
    
    
    
    _picker.hidden = TRUE;
    
    //load information from the standardUserDefaults with corresponding keys
    name_tf.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_name"];
    DOB_button.titleLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"DOB"];
    diagnosed_button.titleLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"date_diagnosed"];
    [alcohol_button setTitle: [[NSUserDefaults standardUserDefaults] objectForKey:@"alcohol"]forState:UIControlStateNormal];
    
    [smoking_button setTitle:[[NSUserDefaults standardUserDefaults] objectForKey:@"smoking"]
                    forState:UIControlStateNormal];

    
    
    //create background
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
    
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    
}

-(void) viewDidDisappear:(BOOL)animated
{
    
    // this part is our initial idea to make a pdf instead of an html for the email, however we kept this to keep track of the location the file is stored.
    NSString *filename = @"personal_information.pdf";
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *pdf_location = [docPath stringByAppendingString:filename];
    
    NSLog(pdf_location);
    
    [[NSUserDefaults standardUserDefaults] setObject:name_tf.text forKey:@"user_name" ];
    [[NSUserDefaults standardUserDefaults] setObject:DOB_button.titleLabel.text forKey:@"DOB"];
    [[NSUserDefaults standardUserDefaults] setObject:diagnosed_button.titleLabel.text forKey:@"date_diagnosed"];
    [[NSUserDefaults standardUserDefaults] setObject:alcohol_button.titleLabel.text forKey:@"alcohol"];
    [[NSUserDefaults standardUserDefaults] setObject:smoking_button.titleLabel.text forKey:@"smoking"];
    
    

    
}

-(void) _button_pushed
{
    [self dismissKeyBoard];

}

-(void)dismissKeyBoard{
    
    [name_tf resignFirstResponder];
    
}

// loading the picker with different arrays, the picker_index is shared to adjust the components of the picker
- (IBAction)DOB_pressed:(id)sender {
    
    [self _button_pushed];
    DOB_chosen = true;
    picker_index = 1;
    [_picker reloadAllComponents];
    
    _picker.hidden = false;
    _picker_title.hidden = false;
    
    _picker_title.text = @"DOB";
    
    complete_button.hidden = false;
    _resetButton.hidden = true;
    
    
}

- (IBAction)diagnosed_pressed:(id)sender {
    
    
    [self _button_pushed];
    DOB_chosen = false;
    picker_index = 1;
    [_picker reloadAllComponents];
    
    _picker.hidden = false;
    _picker_title.hidden = false;
    _picker_title.text = @"Diagnosed Date";
    
    complete_button.hidden = false;
    _resetButton.hidden = true;
    
    

    
}

- (IBAction)smoking_pressed:(id)sender {
    
    [self _button_pushed];
    
    
    picker_index = 3;
    [_picker reloadAllComponents];
    

    _picker.hidden = false;
    _picker_title.hidden = false;
    _picker_title.text = @"Smoking";
    
    complete_button.hidden = false;
    _resetButton.hidden = true;
    
    
}



- (IBAction)alcohol_pressed:(id)sender {
    
    [self _button_pushed];
    
    picker_index = 2;
    [_picker reloadAllComponents];
    

    _picker.hidden = false;
    _picker_title.hidden = false;
    _picker_title.text = @"Alcohol";
    complete_button.hidden = false;
    _resetButton.hidden = true;
}

// complete, and store to the appropriate location.
- (IBAction)complete_pressed:(id)sender {
    
    _picker.hidden = true;
    _picker_title.hidden = true;
    complete_button.hidden = true;
    _resetButton.hidden = false;
    NSString* _select;
    
    NSString* day_select;
    NSString* month_select;
    NSString* year_select;
    
    if(picker_index == 3)
    {
        _select = [smoking_array objectAtIndex:[_picker selectedRowInComponent:0]];
        
        [smoking_button setTitle:_select forState:UIControlStateNormal];
         
        
    }
    else if (picker_index == 2)
    {
        _select = [drinking_array objectAtIndex: [_picker selectedRowInComponent:0]];
        
        if([_picker selectedRowInComponent:0] == [drinking_array count] - 1)
        {
            [alcohol_button setTitle:@"> 5 drinks per week" forState:UIControlStateNormal];
            
        }
        else
        [alcohol_button setTitle:_select forState:UIControlStateNormal];
        
    }
    
    else
    {
        
        month_select = [month_array objectAtIndex:[_picker selectedRowInComponent:0]];
        day_select = [day_array objectAtIndex:[_picker selectedRowInComponent:1]];
        year_select = [year_array objectAtIndex:[_picker selectedRowInComponent:2]];
        
        
        _select = [NSString stringWithFormat:@"%@/%@/%@",month_select,day_select,year_select];
        
        if(DOB_chosen == true)
        {
            
            [DOB_button setTitle:_select forState:UIControlStateNormal];
            
        }
        
        else
        {
            [diagnosed_button setTitle:_select forState:UIControlStateNormal];
        }
        
        
        
        
        
    }
    
    
    
    
}

- (IBAction)resetDatabasePressed:(id)sender {
    [self _button_pushed];
    sqlitefunc  = [[SQLiteFunctions alloc]init];
    [[self sqlitefunc] resetDatabase];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    _picker.hidden = true;
    _picker_title.hidden = true;
    complete_button.hidden = true;

}


#pragma mark Picker Data Source Methods

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
        if(picker_index == 1)
        {
            return 3;
        }
        else
        return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(picker_index == 3)
    return [smoking_array count]; //returns the number of rows in each component
    else if(picker_index == 2)
        return [drinking_array count];
    else
    {
            if(component == 0)
                return [month_array count];
            else if(component == 1)
                return [day_array count];
            else
                return [year_array count];
        
    }
}

#pragma mark Picker Delegate Methods

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(picker_index == 3)
    return [smoking_array objectAtIndex:row];
    else if(picker_index ==2)
        return [drinking_array objectAtIndex:row];
    else
    {
        if(component == 0)
            return [month_array objectAtIndex:row];
        else if(component ==1)
            return [day_array objectAtIndex:row];
        else
            return [year_array objectAtIndex:row];
    }
}


@end
