#import "family_history.h"
@interface family_history ()

@end


@implementation family_history

CGSize pageSize;

@synthesize title_label;
@synthesize _scroller;

@synthesize father_info;
@synthesize mother_info;
@synthesize other_info;



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
    
    //adjust view to make it look nicer
    father_info.layer.cornerRadius = 5;
    father_info.layer.borderWidth = 0.5f;
    father_info.layer.borderColor = [[UIColor grayColor] CGColor];
    mother_info.layer.cornerRadius = 5;
    mother_info.layer.borderWidth = 0.5f;
    mother_info.layer.borderColor = [[UIColor grayColor] CGColor];
    other_info.layer.cornerRadius = 5;
    other_info.layer.borderWidth = 0.5f;
    other_info.layer.borderColor = [[UIColor grayColor] CGColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    title_label.text = @"Family medication background\n Hit Back When finished";
    //self.mother_info
    
    
    // setting scroll properties.
    
    [self._scroller setScrollEnabled:YES];
    
    [self._scroller setContentSize:(CGSizeMake(320, 800))];
    
    self._scroller.center = CGPointMake(160, 270);
  
    
    // Load from the device to from stored information, if none, the home.m has set them to @"";
    
    father_info.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"father_info"];
    mother_info.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"mother_info"];;
    other_info.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"other_info"];;
    
    // adding tap recognizer to dismiss keyboard
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
    
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    
}

-(void) dismissKeyboard
{
    [father_info resignFirstResponder];
    [mother_info resignFirstResponder];
    [other_info resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textViewDidBeginEditing:(UITextView*)textView
{
    CGPoint scrollPoint = CGPointMake(0, textView.frame.origin.y - 110);
    
    [_scroller setContentOffset:scrollPoint animated:YES];
    
}

-(void) viewDidDisappear:(BOOL)animated
{
    
    //save information
    NSString *filename = @"personal_information2.pdf";
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *pdf_location = [docPath stringByAppendingString:filename];
    
    NSLog(pdf_location); // storage location (locating the data.db)

    //stroing the user information when the back button is hit
    
    [[NSUserDefaults standardUserDefaults] setObject:father_info.text forKey: @"father_info"];
    [[NSUserDefaults standardUserDefaults] setObject:mother_info.text forKey: @"mother_info"];
    [[NSUserDefaults standardUserDefaults] setObject:other_info.text forKey: @"other_info"];
    
    

    
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

@end
