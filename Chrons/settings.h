#import "SQLiteFunctions.h"
#import <UIKit/UIKit.h>


@interface settings : UIViewController < UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *_picker;

@property (strong, nonatomic) IBOutlet UIButton *smoking_button;
@property (strong, nonatomic) IBOutlet UIButton *complete_button;
@property (strong, nonatomic) IBOutlet UIButton *alcohol_button;

@property (strong, nonatomic) IBOutlet UIButton *DOB_button;
@property (strong, nonatomic) IBOutlet UIButton *diagnosed_button;

@property (strong, nonatomic) IBOutlet UITextField *name_tf;
@property (weak, nonatomic) IBOutlet UILabel *_picker_title;
@property (weak, nonatomic) IBOutlet UIButton* resetButton;
@property (strong, nonatomic) SQLiteFunctions *sqlitefunc;

- (IBAction)DOB_pressed:(id)sender;
- (IBAction)diagnosed_pressed:(id)sender;
- (IBAction)smoking_pressed:(id)sender;
- (IBAction)alcohol_pressed:(id)sender;
- (IBAction)complete_pressed:(id)sender;
- (IBAction)resetDatabasePressed:(id)sender;


@end
