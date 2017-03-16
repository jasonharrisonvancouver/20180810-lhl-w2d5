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
  // self.textField.keyboardType = UIKeyboardTypeNumberPad;
  self.textField.clearButtonMode = UITextFieldViewModeUnlessEditing;
}

// this is called by the button and gesture
- (IBAction)resignFirstResponder:(id)sender {
  [self.textField resignFirstResponder];
  NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)displayText:(NSString *)text {
  self.topLabel.text = text;
}

#pragma mark - TextFieldDelegates



- (void)textFieldDidBeginEditing:(UITextField *)textField {
  [self displayText:@""];
  self.bottonLabel.text = @"";
  NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
  NSLog(@"%s", __PRETTY_FUNCTION__);
  [self displayText:@""];
  return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
  [self displayText:textField.text];
  NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  NSLog(@"%s", __PRETTY_FUNCTION__);
  return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  NSLog(@"%s", __PRETTY_FUNCTION__);
  NSLog(@"range: %@",NSStringFromRange(range));
  NSLog(@"replacement string: %@", string);
  
  NSString *bottomLabelText = self.bottonLabel.text;
  
  if (range.length == 1) {
    // removing characters
    bottomLabelText = [bottomLabelText substringToIndex:range.location];
  }
  self.bottonLabel.text = [bottomLabelText stringByAppendingString:string];
  return YES;
}









@end
