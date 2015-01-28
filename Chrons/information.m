

#import "information.h"

@interface information ()
{
    NSMutableArray* chapters;
}
@end

@implementation information

@synthesize _table;


-(void) viewDidLoad
{
    self.tabBarController.title = @"Information";
    
    //set background image
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
    
    
    _table.backgroundView = backgroundImage;
    _table.opaque = NO;
    
    
    chapters = [[NSMutableArray alloc]initWithObjects:@"General Information",@"Nutrition", @"Medicine", nil];
    
    _table.contentInset = UIEdgeInsetsZero;
    
    
    [super viewDidLoad];
    
    
}

-(void) viewDidAppear:(BOOL)no{
    self.tabBarController.title = @"Information";
    
    _table.contentInset = UIEdgeInsetsZero;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [chapters count];
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    //get value from the array chapters
    NSString *cellValue = [chapters objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.opaque = NO;
    
    
    
    
    
    
    return cell;
    
    
}



//instead of using textfields, we used dreamweaver to build, the format, and inserted html instead.
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedCell = nil;
    
    selectedCell = [chapters objectAtIndex:indexPath.row];
    
    NSString* htmlCode;
    
    
    if(indexPath.row == 0)
    {
        htmlCode = @"<html><body background = \"http://i60.tinypic.com/zocpk2.png\">\
        <h1 dir=\"ltr\">General Information</h1>\
        <br />\
        <p dir=\"ltr\">Crohn's disease is an inflammatory bowel disease (IBD). It causes inflammation of the lining of your digestive tract, which can lead to abdominal pain, severe diarrhea and even malnutrition. Inflammation caused by Crohn's disease can involve different areas of the digestive tract in different people and affects more than 770,000 Americans.</p>\
        <p dir=\"ltr\">The inflammation caused by Crohn's disease often spreads deep into the layers of affected bowel tissue. Like ulcerative colitis, another common IBD, Crohn's disease can be both painful and debilitating, and sometimes may lead to life-threatening complications.</p>\
        <p dir=\"ltr\">While there's no known cure for Crohn's disease, therapies can greatly reduce the signs and symptoms of Crohn's disease and even bring about long-term remission. With treatment, many people with Crohn's disease are able to function well.</p>\
        <html></body>";
        
        
    }
    
    else if(indexPath.row == 1)
    {
        htmlCode = @"<html><body background = \"http://i60.tinypic.com/zocpk2.png\">\
        <h2 dir=\"ltr\">Nutrition</h2>\
        <h3 dir=\"ltr\">General</h3>\
        <ul>\
        <li dir=\"ltr\">\
        <p dir=\"ltr\">You may not be able to digest and absorb the food you eat.</p>\
        </li>\
        <li dir=\"ltr\">\
        <p dir=\"ltr\">You may need more of some vitamins and minerals.</p>\
        </li>\
        <li dir=\"ltr\">\
        <p dir=\"ltr\">Some of the medicines you take may affect your ability to eat.</p>\
        </li>\
        <li dir=\"ltr\">\
        <p dir=\"ltr\">Eat small meals ever 3 - 4 hours.</p>\
        </li>\
        <li dir=\"ltr\">\
        <p dir=\"ltr\">Drink 8 cups of fluids each day</p>\
        </li>\
        <li dir=\"ltr\">\
        <p dir=\"ltr\">Eat foods that have added probiotics and prebiotics</p>\
        </li>\
        </ul>\
        <br />\
        <h3 dir=\"ltr\">Low Residue Diets</h3>\
        <p dir=\"ltr\">A low-residue diet reduces the frequency and volume of stools. This </p>\
        <p dir=\"ltr\">lessens irritation of the gastrointestinal (GI) tract and can help it heal</p>\
        <h4 dir=\"ltr\">Tips</h4>\
        <p dir=\"ltr\">• Try to limit milk and milk products, caffeine, and prune juice. </p>\
        <p dir=\"ltr\">• If you are lactose intolerant, you may need to avoid dairy foods completely. </p>\
        <p dir=\"ltr\">• Try to limit fruits and vegetables while on this diet. </p>\
            <p dir=\"ltr\">• Take supplements if they are recommended by your doctor or dietitian. </p>\
                <h4 dir=\"ltr\">Recommended Foods</h4>\
                <h5 dir=\"ltr\">Milk and Milk Products </h5>\
                <p dir=\"ltr\">Limited milk (less than 2 cups/day) </p>\
                <p dir=\"ltr\">Lactose-free milk </p>\
                <p dir=\"ltr\">Yogurt or soy yogurt </p>\
                <p dir=\"ltr\">Mild cheese </p>\
                <p dir=\"ltr\">Cottage cheese </p>\
                <p dir=\"ltr\">Soy milk, Rice milk, or Almond milk </p>\
                <p dir=\"ltr\">Sherbert </p>\
                <br />\
                <h5 dir=\"ltr\">Meat and Other Protein Foods </h5>\
                <p dir=\"ltr\">Tender, ground, and well-cooked beef and poultry </p>\
                <p dir=\"ltr\">Tofu </p>\
                <p dir=\"ltr\">Fish </p>\
                <p dir=\"ltr\">Eggs </p>\
                <p dir=\"ltr\">Smooth nut butters (such as peanut, soy, almond, or </p>\
                                                 <p dir=\"ltr\">sunflower) </p>\
                <h5 dir=\"ltr\">Grains Refined </h5>\
                <p dir=\"ltr\">white flour products </p>\
                <p dir=\"ltr\">Cream of wheat </p>\
                <p dir=\"ltr\">Grits (fine-ground) </p>\
                <p dir=\"ltr\">White bread </p>\
                <p dir=\"ltr\">White pasta </p>\
                <h5 dir=\"ltr\">Vegetables </h5>\
                <p dir=\"ltr\">Canned and well-cooked vegetables </p>\
                <p dir=\"ltr\">Mashed potatoes </p>\
                <p dir=\"ltr\">Vegetables that do not cause gas </p>\
                    <p dir=\"ltr\">Vegetables without skins, seeds, or pulp </p>\
                    <p dir=\"ltr\">Vegetable juice (no more than 4 oz/day) </p>\
                    <h5 dir=\"ltr\">Fruit </h5>\
                    <p dir=\"ltr\">Juice without pulp </p>\
                    <p dir=\"ltr\">Applesauce </p>\
                    <p dir=\"ltr\">Peeled fruit without pulp </p>\
                    <p dir=\"ltr\">Canned fruit in light syrup or juice </p>\
                    <h5 dir=\"ltr\">Fat/Oils</h5>\
                    <p dir=\"ltr\">Oils, butter, cream, cream cheese, margarine, mayonnaise </p>\
                    <h5 dir=\"ltr\">Other </h5>\
                    <p dir=\"ltr\">Broth and strained soups made from allowed foods </p>\
                    <p dir=\"ltr\">Puréed or blended chicken noodle soup</p>\
                    <br />\
                    <h4 dir=\"ltr\">Not Recommended Foods </h4>\
                    <h5 dir=\"ltr\">Milk and Milk Products </h5>\
                    <p dir=\"ltr\">Avoid milk and foods made with milk if you are lactose </p>\
                        <p dir=\"ltr\">intolerant </p>\
                        <h5 dir=\"ltr\">Meat and other protein sources </h5>\
                        <p dir=\"ltr\">No crunchy nut butters </p>\
                        <p dir=\"ltr\">No tough meat or meat with gristle </p>\
                        <p dir=\"ltr\">No beans </p>\
                        <h5 dir=\"ltr\">Grains </h5>\
                        <p dir=\"ltr\">No whole grains </p>\
                        <p dir=\"ltr\">Vegetables No raw vegetables </p>\
                        <p dir=\"ltr\">No cooked greens or spinach </p>\
                        <h5 dir=\"ltr\">Fruit </h5>\
                        <p dir=\"ltr\">No dried fruit </p>\
                        <p dir=\"ltr\">No pulp </p>\
                        <p dir=\"ltr\">No skin of fruit </p>\
                        <p dir=\"ltr\">Fat/Oils When possible, choose healthy oils and fats, such as canola </p>\
                        <p dir=\"ltr\">and olive oils. </p>\
                        <h5 dir=\"ltr\">Beverages </h5>\
                        <p dir=\"ltr\">No or limited caffeine </p>\
                        <p dir=\"ltr\">No alcohol<br />\
                        </p>\
                        </body>\
                        </html>";
        
    }
    

    
    
    if(indexPath.row != 2)
    {
        //load as web view
        UIWebView *wv = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 580)];
        [wv loadHTMLString:htmlCode baseURL:nil];
    
        UIViewController* nvc = [[UIViewController alloc] init];
        [nvc.view addSubview:wv];
        
        [self.navigationController pushViewController:nvc animated:YES];
     }
    
    else{
        //push med_info_list
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"med_info_list"];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
                                              
    
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 0;
}



@end
