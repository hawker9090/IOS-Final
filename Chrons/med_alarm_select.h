
#import <UIKit/UIKit.h>

@interface med_alarm_select : UIViewController <UITextFieldDelegate>

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)toggleEnabledForOption:(id)sender;
- (IBAction)selectSegment:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *itemText;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISwitch *option;
@property (weak, nonatomic) IBOutlet UILabel *frequencyLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *dailyWeekly;

@end
