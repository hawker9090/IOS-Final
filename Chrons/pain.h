
#import <UIKit/UIKit.h>
#import "SQLiteFunctions.h"

@interface pain : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UISlider *_slider_outlet;

@property (strong, nonatomic) IBOutlet UITextField *severity;
@property (strong, nonatomic) IBOutlet UITextView *description;
@property (strong, nonatomic) IBOutlet UIButton *_time_button;

@property (strong, nonatomic) IBOutlet UITextField *location_tf;

@property (strong, nonatomic) IBOutlet UIDatePicker *_date_picker;
@property (strong, nonatomic) IBOutlet UIButton *_complete_button;

@property (strong, nonatomic) IBOutlet UIScrollView *_scroller;

@property (strong, nonatomic) IBOutlet UIButton *_log_button;

- (IBAction)log:(id)sender;
- (IBAction)complete_pressed:(id)sender;
- (IBAction)time_pressed:(id)sender;
- (IBAction)_back_button:(id)sender;


@property (nonatomic,strong) SQLiteFunctions *sqlitefunc; //updated brandon
- (IBAction)sliding:(id)sender;

@end
