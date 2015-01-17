//
//  WebViewController.m
//  Cities
//
//  Created by Gabriel Borri de Azevedo on 1/16/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"%@", self.city.name);

    NSURL *url = [NSURL URLWithString:self.city.url];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (IBAction)onCloseButtonTapped:(UIButton *)sender
{
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}


@end
