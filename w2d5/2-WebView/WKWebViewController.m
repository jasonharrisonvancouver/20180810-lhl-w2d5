//
//  WKWebViewController.m
//  W2D5-Demos
//
//  Created by Roland Tecson on 2017-10-10.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import "WKWebViewController.h"

// Required for WKWebView
@import WebKit;

@interface WKWebViewController ()<WKNavigationDelegate>
@property (nonatomic) UIView *containerView;
@property (nonatomic) WKWebView *webView;
@property (nonatomic) UIActivityIndicatorView *activityIndicator;
@end

#define tag 200

@implementation WKWebViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.containerView = [self.view viewWithTag:tag];
  self.webView = [[WKWebView alloc] initWithFrame:CGRectZero];
  self.webView.navigationDelegate = self;
  [self.containerView addSubview:self.webView];
  [self.webView addObserver:self forKeyPath:@"loading" options:NSKeyValueObservingOptionNew context:nil];
  [self createActivityIndicator];
}

- (void)createActivityIndicator {
  self.activityIndicator = [[UIActivityIndicatorView alloc] init];
  self.activityIndicator.hidesWhenStopped = YES;
  [self.activityIndicator startAnimating];
  self.activityIndicator.color = [UIColor redColor];
  [self.webView addSubview:self.activityIndicator];
}

- (void)viewDidLayoutSubviews {
  self.webView.frame = self.containerView.frame;
  self.activityIndicator.center = self.view.center;
}

- (void)viewWillAppear:(BOOL)animated {
  NSURL *url = [NSURL URLWithString:@"https://stackoverflow.com"];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [self.webView loadRequest:request];
}

// Example of KVO (Key Value Observing)
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
  if ([keyPath isEqualToString:@"loading"]) {
    NSLog(@"%@", change);
    if ([change[@"new"] isEqualToNumber:@1]) {
      [self.activityIndicator startAnimating];
    } else {
      [self.activityIndicator stopAnimating];
    }
  }
}

- (void)dealloc {
  [self.webView removeObserver:self forKeyPath:@"loading"];
}







@end
