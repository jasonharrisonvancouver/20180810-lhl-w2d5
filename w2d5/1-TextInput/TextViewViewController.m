//
//  TextViewViewController.m
//  W2D5-Demos
//
//  Created by Roland Tecson on 2017-10-10.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import "TextViewViewController.h"

@interface TextViewViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation TextViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTextView];
}

#pragma mark - Setup

- (void)setupTextView
{
    self.textView.text = @"";
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - Save

- (IBAction)save:(UIBarButtonItem *)sender
{
    NSLog(@"In save: %@", self.textView.text);
    [self.textView resignFirstResponder];
}

#pragma mark - Delegate Methods

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    // clears the text
    NSLog(@"In textViewDidBeginEditing:");
    self.textView.text = @"";
}

-         (BOOL)textView:(UITextView *)textView
 shouldChangeTextInRange:(NSRange)range
         replacementText:(NSString *)text
{
    NSLog(@"In textView:shouldChangeTextInRange: %@", text);
    BOOL result = YES;
    // validation prevents inserting ! in the input field
    if ([text isEqualToString:@"!"]) {
        result = NO;
    }
    return result;
}

- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"In textViewDidChange: %@", textView.text);
}

@end
