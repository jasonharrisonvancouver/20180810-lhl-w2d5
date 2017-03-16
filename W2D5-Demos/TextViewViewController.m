//
//  TextViewViewController.m
//  W2D5-Demos
//
//  Created by steve on 2017-01-19.
//  Copyright © 2017 steve. All rights reserved.
//

#import "TextViewViewController.h"

@interface TextViewViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation TextViewViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.textView.text = @"";
  self.automaticallyAdjustsScrollViewInsets = NO;
}


- (IBAction)save:(UIBarButtonItem *)sender {
  NSLog(@"%s", __PRETTY_FUNCTION__);
  NSLog(@"%@", self.textView.text);
  [self.textView resignFirstResponder];
}



- (void)textViewDidBeginEditing:(UITextView *)textView {
  // clears the text
  NSLog(@"%s", __PRETTY_FUNCTION__);
  self.textView.text = @"";
}

@end
