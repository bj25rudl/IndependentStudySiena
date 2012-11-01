//
//  BullseyeViewController.m
//  bullseye
//
//  Handles the functions that are initalized in the .h
//
//  Created by Brett Rudloff on 9/24/12.
//  Copyright (c) 2012 Brett Rudloff. All rights reserved.
//

#import "BullseyeViewController.h"
#import "AboutViewController.h"


@interface BullseyeViewController ()

@end

@implementation BullseyeViewController {
    int currentValue; //stores the current value of the slider
    int targetValue; //stores what value the game wants the user to hit
    int score; //score that is stored for all rounds combined until the user starts over
    int round; //current round that the user is on
}

/**
 syntesize needs to be used when the user puts a property in the .h file and connects it in the nib.
 This way the program will recognize it when it is used
 */
@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;
@synthesize roundLabel;

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];//updates target
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];//updates score
    self.roundLabel.text = [NSString stringWithFormat:@"%d", round];//updates round
}

- (void)startNewGame
{
    round = 0;//intitalizes round to 0
    score = 0;//initializes score to 0
    [self startNewRound];//runs startNewRound method
}

- (void)startNewRound
{
    round += 1;//increments round by one
    
    targetValue = 1 + (arc4random() % 100);//sets target value to random number between 1 and 100
    
    currentValue = self.slider.value;//sets slider to whatever value it ended at
    self.slider.value = currentValue;//sets slider value
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
	[self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
	UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
	[self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    
	UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
	[self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    
	UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
	[self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];

    
    [self startNewGame];//runs startNewGame method
    [self updateLabels];//runs updateLabels method
}

- (void)viewDidUnload
{
    [super viewDidUnload];//ends program
    self.slider = nil;//uninitializes slider
    self.targetLabel = nil;//uninitializes targetLabel
    self.scoreLabel = nil;//uninitializes scoreLabel
}

/*
 Sets the orientation of the phone so that it is always running in landscape
 */
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation); //makes sure it is a landscape orientation
}

- (IBAction)startOver
{
    [self startNewGame];//runs startNewGame method
    [self updateLabels];//runs updateLabels method
}

/**
 Users a webpage to show the info
 */
- (IBAction)showInfo
{
    AboutViewController *controller = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:controller animated:YES completion:nil];
}

/**
 When the hit me button is hit all this is run and then the alert shows
 */
- (IBAction)showAlert
{
    int difference = abs(targetValue - currentValue);//gets how far the slider is from target and puts it in distance
    int points = 100 - difference;//sets points to 100-difference
    score += points;//adds points to current score
    
    NSString *title;//initializes a string called title
    if (difference == 0) {
        title = @"Perfect!";//sets title to perfect if it is
        points += 100;//bonus 100 points if it is perfect
    } else if (difference < 5) {
        if (difference == 1) {
            points += 50;//bonus 50 points if it's within one high or low
        }
        title = @"You almost had it!";//sets title to this
    } else if (difference < 10) {
        title = @"Pretty good!";//sets title to this if within 10
    } else {
        title = @"Not even close...";//if over ten then this is the title
    }
    score += points;
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];//%d changes according to points
        
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title //uses title initialized earlier
                                                   message:message//uses message initialized earlier
                                                  delegate:self
                                              cancelButtonTitle:@"Next Round!"//text inside the cancel button
                                              otherButtonTitles:nil];
    [alertView show];//shows alert with *alertView information
    
}

/**
 runs after cancelButton is done
 */
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self startNewRound];//runs startNewRound method
    [self updateLabels];//runs updateLabels method
}

/*
 runs when the slider is moved
 */
- (IBAction)sliderMoved:(UISlider *)sender {
    currentValue = lroundf(sender.value);//sets slider when it is moved 
}


@end
