//
//  WebViewController.m
//  W2D5-Demos
//
//  Created by steve on 2017-01-19.
//  Copyright © 2017 steve. All rights reserved.
//

#import "WebManagerViewController.h"
@import SafariServices;


@interface WebManagerViewController ()<SFSafariViewControllerDelegate>
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *test;

@end

@implementation WebManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

 /*
  SFSafariViewController
 If your app lets users view websites from anywhere on the Internet, use the SFSafariViewController class. If your app customizes, interacts with, or controls the display of web content, use the WKWebView class.
 
 */

- (IBAction)safariVCTapped:(UIButton *)sender {
  // must add SafariServices for this to work
  NSURL *url = [NSURL URLWithString:@"https://www.thestar.com"];
  SFSafariViewController *sfVC = [[SFSafariViewController alloc] initWithURL:url];
  [self presentViewController:sfVC animated:YES completion:nil];
}

@end
