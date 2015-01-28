#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "SQLiteFunctions.h"
#import "FoodPainAndCount.h"
#import "StringAndNumber.h"

@interface email_to_doc : UIViewController  <MFMailComposeViewControllerDelegate>{
}


@property (weak, nonatomic) IBOutlet UITextField *dname_tf;
@property (weak, nonatomic) IBOutlet UITextField *demail_tf;
@property (weak, nonatomic) IBOutlet UITextView *dnote_tf;
@property (strong, nonatomic) IBOutlet UITextView *report;
@property (nonatomic, strong) SQLiteFunctions *sqlitefunc;
@property (nonatomic, strong) NSMutableArray *dataArray;;


- (IBAction)sendEmail:(id)sender;

@end
