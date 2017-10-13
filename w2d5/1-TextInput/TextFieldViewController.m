//
//  TextFieldViewController.m
//  W2D5-Demos
//
//  Created by Roland Tecson on 2017-10-10.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation TextFieldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textField.delegate = self;
    [self setupTextField];
    [self displayTopLabelText:@""];
    self.bottomLabel.text = @"";
}

- (void)setupTextField
{
    // set the keyboard type
    self.textField.keyboardType = UIKeyboardTypeDefault;
    self.textField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    NSLog(@"In setupTextField: %@", self.textField.typingAttributes);
}

// this is called by the button and gesture
- (IBAction)dismissKeyboard:(id)sender
{
    [self.textField resignFirstResponder];
    NSLog(@"In dismissKeyboard:");
}

- (void)displayTopLabelText:(NSString *)text
{
    self.topLabel.text = text;
}

#pragma mark - TextFieldDelegates

// fires when we tap on the textfield
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self displayTopLabelText:@""];
    self.bottomLabel.text = @"";
    // clears text when we begin editing (we could have set the property clearsOnBeginEditing on textfield to do this too)
    self.textField.text = @"";
    NSLog(@"In textFieldDidBeginEditing:");
}

// fires when we end editing
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self displayTopLabelText:textField.text];
    NSLog(@"In textFieldDidEndEditing:");
}

// fires when the clear button is about to fire
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"In textFieldShouldClear:");
    [self displayTopLabelText:@""];
    return YES;
}

// fires when the return key is tapped which allows us to respond accordingly
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"In textFieldShouldReturn:");
    return YES;
}

// used to handle populating the label while we type
-              (BOOL)textField:(UITextField *)textField
 shouldChangeCharactersInRange:(NSRange)range
             replacementString:(NSString *)string
{
    NSLog(@"In textField:shouldChangeCharactersInRange: range: %@", NSStringFromRange(range));
    NSLog(@"In textField:shouldChangeCharactersInRange: replacement string: %@", string);
    
    NSString *bottomLabelText = self.bottomLabel.text;
    
    // The following logic is simplified and does not account for deleting/replacing
    // more than one character at a time
    BOOL isDeleting = (range.length == 1);
    if (isDeleting) {
        // removing characters
        bottomLabelText = [bottomLabelText substringToIndex:range.location];
    }
    self.bottomLabel.text = [bottomLabelText stringByAppendingString:string];

    return YES;
}

@end
