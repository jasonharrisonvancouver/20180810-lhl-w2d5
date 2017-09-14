//
//  ViewController.m
//  Notifications2
//
//  Created by steve on 2017-03-17.
//  Copyright © 2017 steve. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// outlet to bottom constraint
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xConstraint;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupObserver];
}

- (void)setupObserver {
  NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
  [center addObserver:self selector:@selector(keyboardUp:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyboardUp:(NSNotification *)notification {
  CGFloat height = [self keyboardHeightFromNotification:notification];
  NSLog(@"%@", @(height));
//  [self adjustBoundsForKeyboardHeight:height];
  [self adjustBottomConstraintForKeyboardHeight:height];
}

- (CGFloat)keyboardHeightFromNotification:(NSNotification *)notification {
  NSValue *value = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
  CGRect rect = [value CGRectValue];
  return rect.size.height;
}

// Bounds Way
- (void)adjustBoundsForKeyboardHeight:(CGFloat)height {
  CGRect bounds = self.view.bounds;
  CGFloat yOrigin = bounds.origin.y;
  yOrigin += height;
  CGRect newBounds = CGRectMake(bounds.origin.x, yOrigin, bounds.size.width, bounds.size.height);
  self.view.bounds = newBounds;
}

// Constraint Way
- (void)adjustBottomConstraintForKeyboardHeight:(CGFloat)height {
    CGFloat xConstant = self.xConstraint.constant;
    xConstant -= height;
    self.xConstraint.constant = xConstant;
}

- (void)dealloc {
  NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
  [center removeObserver:self];
}



@end
