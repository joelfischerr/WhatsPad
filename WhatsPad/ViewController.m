//
//  ViewController.m
//  WhatsPad
//
//  Created by Joel Fischer on 22/09/15.
//  Copyright (c) 2015 Joel Fischer. All rights reserved.
//

#import "ViewController.h"
#import "Webkit/Webkit.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize JFwebView;



- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSString *userAgent = @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12";

    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    
    JFwebView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];
    
    JFwebView.navigationDelegate = self;
    
    JFwebView.customUserAgent = userAgent;
    
    [self.view addSubview:JFwebView];
    
    [self loadWhatsappWeb];
    
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(handleOrientationChangeNotification:) name: UIDeviceOrientationDidChangeNotification object: nil];

    
}

- (void)loadWhatsappWeb {
    
    
    NSURL *nsurl=[NSURL URLWithString:@"http://web.whatsapp.com"];
    
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    
    [JFwebView loadRequest:nsrequest];
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error

{
    
    if (error)
        
    {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
        
        
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
}

- (void)handleOrientationChangeNotification:(NSNotification *)notification {
    
    JFwebView.frame = self.view.frame;
    
}



- (BOOL)prefersStatusBarHidden {
    
    
    
    return YES;
    
}

- (void)webView:(WKWebView * _Nonnull)webView
didCommitNavigation:(WKNavigation * _Null_unspecified)navigation {
    
    
    NSLog(@"Did commit Navigation to url %@", webView.URL);
    
    NSString *string = [NSString stringWithFormat:@"%@", webView.URL];
    
    if ([string containsString:@"web.whatsapp.com"]) {
        
        NSLog(@"on whatsapp web");
        
        [self.view bringSubviewToFront:self.JFwebView];
        
    } else {
        
        NSLog(@"left whatsapp web");
        
        [self.view bringSubviewToFront:self.backButton];
        
    }
    
    
}






- (IBAction)goBackToWhatsappWeb:(id)sender {
    
    [self loadWhatsappWeb];
    
    
}
@end

