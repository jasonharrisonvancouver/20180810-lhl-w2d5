//
//  WebViewController.m
//  W2D5-Demos
//
//  Created by steve on 2017-01-19.
//  Copyright © 2017 steve. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation WebViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setup];
}

- (void)setup {
  NSURL *url = [NSURL URLWithString:@"https://stackoverflow.com"];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [self.webView loadRequest:request];
  self.webView.delegate = self;
}

#pragma mark - Delegate Methods

- (void)webViewDidStartLoad:(UIWebView *)webView {
  [self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
  [self.activityIndicator stopAnimating];
}




@end
