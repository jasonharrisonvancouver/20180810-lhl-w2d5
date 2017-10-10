//
//  CoreGraphicsViewController.m
//  W2D5-Demos
//
//  Created by Roland Tecson on 2017-10-10.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import "CoreGraphicsViewController.h"
#import "TopView.h"
#import "BottomView.h"

@interface CoreGraphicsViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet BottomView *bottomView;
@property (weak, nonatomic) IBOutlet TopView *topView;
@end

@implementation CoreGraphicsViewController

- (IBAction)clear {
  [self.bottomView clear];
}


@end
