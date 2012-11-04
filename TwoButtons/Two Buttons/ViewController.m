//
//  ViewController.m
//  Two Buttons
//
//  Created by Jessica Reinhardt on 11/2/12.
//  Copyright (c) 2012 Jessica Reinhardt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)writeStringToFile:(NSString*)aString {
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *fileName = @"twoButtons.txt";
    NSString *fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]){
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    [[aString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
    
}

- (IBAction)showAlertLeft
{
    // Get current datetime
    NSDate *currentDateTime = [NSDate date];
    
    // Instantiate a NSDateFormatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    // Set the dateFormatter format
    [dateFormatter setDateFormat:@"MM-dd-yyyy HH:mm:ss"];
    
    // Get the date time in NSString
    NSString *dateInString = [dateFormatter stringFromDate:currentDateTime];


    
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Time Stamp"
                                  message:dateInString
                                  delegate:nil
                                  cancelButtonTitle:@"Awesome!"
                                  otherButtonTitles:nil];
                                  [alertView show];
    [self writeStringToFile:dateInString];


}

- (IBAction)showAlertRight
{
    // Get current datetime
    NSDate *currentDateTime = [NSDate date];
    
    // Instantiate a NSDateFormatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    // Set the dateFormatter format
    [dateFormatter setDateFormat:@"MM-dd-yyyy HH:mm:ss"];
    
    // Get the date time in NSString
    NSString *dateInString = [dateFormatter stringFromDate:currentDateTime];
    
    
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Time Stamp"
                              message:dateInString
                              delegate:nil
                              cancelButtonTitle:@"Awesome!"
                              otherButtonTitles:nil];
    [alertView show];
    
}

@end
