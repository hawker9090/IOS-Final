

#import "Home.h"


@interface Home ()


@end

@implementation Home



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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarController.title = @"Home";
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
    
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    
    
    //when first loaded it seeks the standarduserdefault, if empty it stores the intial information data for settings.m & familyinfo.m
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"user_name" ]== NULL)
        {
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"user_name" ];
            [[NSUserDefaults standardUserDefaults] setObject:@"Choose Date" forKey:@"DOB"];
            [[NSUserDefaults standardUserDefaults] setObject:@"Choose Date" forKey:@"date_diagnosed"];
            [[NSUserDefaults standardUserDefaults] setObject:@"None" forKey:@"alcohol"];
            [[NSUserDefaults standardUserDefaults] setObject:@"None" forKey:@"smoking"];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey: @"father_info"];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey: @"mother_info"];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey: @"other_info"];
            
            NSLog(@"Information logged");
        }
    
    /*else
        {
            NSLog(@"already there");
        }
    */
    
    //[backgroundImage release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
    [self viewDidLoad];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
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
