//
//  BullseyeViewController.h
//  bullseye
//
//  Used to initalize functions they are handled in the .m file however
//
//  Created by Brett Rudloff on 9/24/12.
//  Copyright (c) 2012 Brett Rudloff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullseyeViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, strong) IBOutlet UISlider *slider; //program can recognize a slider now
@property (nonatomic, strong) IBOutlet UILabel *targetLabel;//program can recognize a targetLabel now
@property (nonatomic, strong) IBOutlet UILabel *scoreLabel; //program can recognize a scoreLabel now
@property (nonatomic, strong) IBOutlet UILabel *roundLabel; //program can recognize a roundLabel now

- (IBAction)showAlert;
- (IBAction)sliderMoved:(UISlider *)sender;
- (IBAction)startOver;
- (IBAction)showInfo;

@end
