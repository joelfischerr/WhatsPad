//
//  ViewController.h
//  WhatsPad
//
//  Created by Joel Fischer on 22/09/15.
//  Copyright © 2015 Joel Fischer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <WKNavigationDelegate>

@property WKWebView *webView;



@end

