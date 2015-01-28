
#import "email_to_doc.h"

@interface email_to_doc ()


@end


@implementation email_to_doc
@synthesize sqlitefunc;
@synthesize dname_tf;
@synthesize demail_tf;
@synthesize dnote_tf;
@synthesize dataArray;

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
    // chaning view appearances
    dnote_tf.layer.cornerRadius = 5;
    dnote_tf.layer.borderWidth = 0.5f;
    dnote_tf.layer.borderColor = [[UIColor grayColor] CGColor];
 
    // tap recognizer added for dismiss keyboard purposes
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyBoard)];
    [self.view addGestureRecognizer:tap];
    
    //change background
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
    
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    
    
    dataArray = [[NSMutableArray alloc] init];
    sqlitefunc  = [[SQLiteFunctions alloc]init];

    
    // Do any additional setup after loading the view.
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

-(void)dismissKeyBoard{
    

    [demail_tf resignFirstResponder];
    [dname_tf resignFirstResponder];
    [dnote_tf resignFirstResponder];
    
}


- (IBAction)sendEmail:(id)sender {
    
    //create mailcomposeviewcontroller and load the data from the view
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init ];
    mailController.mailComposeDelegate = self;
    
    NSString *email = demail_tf.text;
    NSArray *emailArray = [[NSArray alloc] initWithObjects:email, nil];
    //get data into strings
    NSString* _name = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_name"];
    NSString* _dob = [[NSUserDefaults standardUserDefaults] objectForKey:@"DOB"];
    NSString* _diagnosed_date = [[NSUserDefaults standardUserDefaults] objectForKey:@"date_diagnosed"];
    NSString* _alcohol =[[NSUserDefaults standardUserDefaults] objectForKey:@"alcohol"];
    
    NSString* _smoking =[[NSUserDefaults standardUserDefaults] objectForKey:@"smoking"];
    NSString* _father_info = [[NSUserDefaults standardUserDefaults] objectForKey:@"father_info"];
    NSString* _mother_info = [[NSUserDefaults standardUserDefaults] objectForKey:@"mother_info"];
    NSString* _other_info = [[NSUserDefaults standardUserDefaults] objectForKey:@"other_info"];
    
    //get results from analytics
    NSMutableString* queryResults = [self formatFoods];
    
    //message in html format by Jesse
    NSString *message = [NSString stringWithFormat:@"<h1>%@'s Info</h1>Patient Name: %@<br>DOB: %@<br>Date Diganosed:%@<br><h2>Basic Health</h2> Smoking %@<br>Alcohol %@<br><h2>Family info</h2><h3>Father</h3>%@<br><h3>Mother</h3>%@<h3>Other</h3>%@<br><h2>Optional Notes</h2>%@<br>%@", _name, _name, _dob, _diagnosed_date, _smoking,_alcohol,_father_info,_mother_info, _other_info, dnote_tf.text, queryResults];
    
    [mailController setMessageBody:message isHTML:YES];
    [mailController setToRecipients:emailArray];
    [mailController setSubject:[NSString stringWithFormat:@"To Dr. %@",dname_tf.text]];
    
    // if the device is not connected to an email account, this will return an message instead of freezing.
    
    if(mailController == nil)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"We were unable to find any email accounts linked to your device. Please try again after you change your device settings and come again" delegate:self cancelButtonTitle:@"Return" otherButtonTitles: nil];
        
        [alert show];
        
    }
    
    else
    {
        
        [self presentViewController:mailController animated:YES completion:nil];
        
        
    }
    
    
    
    /*[sqlitefunc resetDatabase];
    NSArray *temparray = [sqlitefunc numberOfTimesEachFoodGivesPain];
    for (int i = 0;i < [temparray count];i++)
    {
        FoodPainAndCount *a = [temparray objectAtIndex:i];
        NSLog([NSString stringWithFormat:@"%d, %@", a.count,a.food]);
        
    }*/
    
   
}

-(void)alertView: (UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    }

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    // show an alert of the result of the email.
    
        switch(result)
    {
        case MFMailComposeResultSent:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Sent" message:@"" delegate:self cancelButtonTitle:@"Return" otherButtonTitles: nil];
            
            [alert show];
            break;
        }
        default:
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Cancelled" message:@"" delegate:self cancelButtonTitle:@"Return" otherButtonTitles: nil];
    
        [alert show];
        }
    }
    
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(NSString*)formatFoods{
    //format number of times each food gives pain
    NSString *formattedSQL = [NSString stringWithFormat:@"<h1>Analytics</h1><h2>Number of Times each Food Gives Pain</h2>"];
    //add numberOfTimesEachFoodGivesPain to result string
    NSArray *temparray = [sqlitefunc numberOfTimesEachFoodGivesPain];
    for (int counter = 0; counter < [temparray count]; counter++){
        FoodPainAndCount *a = [temparray objectAtIndex:counter];
        //to the html string and add break at end for a new line
        formattedSQL = [formattedSQL stringByAppendingString:[NSString stringWithFormat:@"%@: %d<br>", [a food], [a count]]];
    }
    
    //add percentage of times food gives pain
    formattedSQL = [formattedSQL stringByAppendingString:@"<h2>Percentage of Times Food Gives Pain</h2>"];
    temparray = [sqlitefunc percentageOfTimesFoodGivesPain];
    for (int counter = 0; counter < [temparray count]; counter++){
        StringAndNumber *a = [temparray objectAtIndex:counter];
        //to the html string and add break at end for a new line
        formattedSQL = [formattedSQL stringByAppendingString:[NSString stringWithFormat:@"%@: %d<br>", [a string], [a number]]];
    }
    
    //add percentage of time food gives diarrhea
    formattedSQL = [formattedSQL stringByAppendingString:@"<h2>Percentage of Times Food Gives Diarrhea</h2>"];
    temparray = [sqlitefunc percentageOfTimesFoodGivesDiarreah];
    for (int counter = 0; counter < [temparray count]; counter++){
        StringAndNumber *a = [temparray objectAtIndex:counter];
        //to the html string and add break at end for a new line
        formattedSQL = [formattedSQL stringByAppendingString:[NSString stringWithFormat:@"%@: %d<br>", [a string], [a number]]];
    }
    
    //add percentage of time food gives constipation
    formattedSQL = [formattedSQL stringByAppendingString:@"<h2>Percentage of Times Food Gives Constipation</h2>"];
    temparray = [sqlitefunc percentageOfTimesFoodGivesConstipation];
    for (int counter = 0; counter < [temparray count]; counter++){
        StringAndNumber *a = [temparray objectAtIndex:counter];
        //to the html string and add break at end for a new line
        formattedSQL = [formattedSQL stringByAppendingString:[NSString stringWithFormat:@"%@: %d<br>", [a string], [a number]]];
    }
    
    //NSLog(formattedSQL);
    return formattedSQL;
}
@end
