
#import <UIKit/UIKit.h>
#import "SQLiteFunctions.h"

@interface BM : UIViewController <UITextFieldDelegate, UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *_time_button;
@property (strong, nonatomic) IBOutlet UITextField *_size_tf;
@property (strong, nonatomic) IBOutlet UITextField *_color_tf;
@property (strong, nonatomic) IBOutlet UISwitch *_blood;
@property (strong, nonatomic) IBOutlet UISwitch *_urgency;
@property (strong, nonatomic) IBOutlet UISwitch *_constipation;
@property (strong, nonatomic) IBOutlet UISwitch *_diarrhea;
@property (strong, nonatomic) IBOutlet UITextView *_description;
@property (strong, nonatomic) IBOutlet UIButton *_complete_button;
@property (strong, nonatomic) IBOutlet UIDatePicker *_date_picker;
@property (strong, nonatomic) IBOutlet UIButton *_log_button;

@property (strong, nonatomic) IBOutlet UIScrollView *_scroll;

@property (nonatomic,strong) SQLiteFunctions *sqlitefunc;


- (IBAction)_back_button:(id)sender;

- (IBAction)time_touched:(id)sender;
- (IBAction)complete_touched:(id)sender;
- (IBAction)log_touched:(id)sender;


@end
