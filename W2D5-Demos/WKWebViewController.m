//
//  WKWebViewController.m
//  W2D5-Demos
//
//  Created by steve on 2017-01-19.
//  Copyright © 2017 steve. All rights reserved.
//

#import "WKWebViewController.h"
@import WebKit; // you have to import webkit

@interface WKWebViewController ()
@property (nonatomic) UIView *containerView;
@property (nonatomic) WKWebView *webView;
@end

#define tag 200

@implementation WKWebViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.containerView = [self.view viewWithTag:tag];
  self.webView = [[WKWebView alloc] initWithFrame:CGRectZero];
  [self.containerView addSubview:self.webView];
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  self.webView.frame = self.containerView.frame;
}

- (void)viewWillAppear:(BOOL)animated {
  NSURL *url = [NSURL URLWithString:@"https://www.thestar.com"];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [self.webView loadRequest:request];
}



@end
