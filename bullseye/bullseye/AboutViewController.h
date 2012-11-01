//
//  AboutViewController.h
//  bullseye
//
//  Created by Brett Rudloff on 9/25/12.
//  Copyright (c) 2012 Brett Rudloff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *webView;

- (IBAction)close;

@end
