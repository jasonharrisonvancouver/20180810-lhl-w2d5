//
//  TextFieldViewController.m
//  W2D5-Demos
//
//  Created by steve on 2017-01-19.
//  Copyright © 2017 steve. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottonLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.textField.delegate = self;
  [self setupTextField];
  [self displayText:@""];
  self.bottonLabel.text = @"";
}

- (void)setupTextField {
  // set the keyboard type
  self.textField.keyboardType = UIKeyboardTypeNumberPad;
  self.textField.clearButtonMode = UITextFieldViewModeUnlessEditing;
}

// this is called by the button and gesture
- (IBAction)resignFirstResponder:(id)sender {
  [self.textField resignFirstResponder];
  NSLog(@"%d: %s",__LINE__, __PRETTY_FUNCTION__);
}

- (void)displayText:(NSString *)text {
  self.topLabel.text = text;
}

#pragma mark - TextFieldDelegates

// fires when we tap on the textfield
- (void)textFieldDidBeginEditing:(UITextField *)textField {
  [self displayText:@""];
  self.bottonLabel.text = @"";
  // clears text when we begin editing (we could have set a property on textfield to do this too)
  self.textField.text = @"";
  NSLog(@"%d: %s", __LINE__, __PRETTY_FUNCTION__);
}

// fires when we end editing
- (void)textFieldDidEndEditing:(UITextField *)textField {
  [self displayText:textField.text];
  NSLog(@"%d: %s", __LINE__, __PRETTY_FUNCTION__);
}

// fires when the clear button is about to fire
- (BOOL)textFieldShouldClear:(UITextField *)textField {
  NSLog(@"%d: %s", __LINE__, __PRETTY_FUNCTION__);
  [self displayText:@""];
  return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  NSLog(@"%d: %s",__LINE__, __PRETTY_FUNCTION__);
  return YES;
}


// Info on NSRange: http://nshipster.com/nsrange/

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  NSLog(@"%d: %s", __LINE__, __PRETTY_FUNCTION__);
  NSLog(@"%d: range: %@",__LINE__, NSStringFromRange(range));
  NSLog(@"%d: replacement string: %@", __LINE__, string);
  
  NSString *bottomLabelText = self.bottonLabel.text;
  
  if (range.length == 1) {
    // removing characters
    bottomLabelText = [bottomLabelText substringToIndex:range.location];
  }
  self.bottonLabel.text = [bottomLabelText stringByAppendingString:string];
  return YES;
}

@end
