//
//  ViewController.h
//  LandscapeMp3Player
//
//  Created by Michael Nipper on 2/22/12.
//  Copyright (c) 2012 Wake Forest University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *bunnyImageView;
@property (weak, nonatomic) IBOutlet UIButton *adminCloud;
@property (weak, nonatomic) IBOutlet UIButton *nextCloud;
@property (weak, nonatomic) IBOutlet UIButton *previousCloud;
@property (weak, nonatomic) IBOutlet UIImageView *playSunButton;

- (IBAction)playSun:(id)sender;
- (IBAction)previousTrack:(id)sender;
- (IBAction)nextTrack:(id)sender;
- (IBAction)adminButton:(id)sender;
- (void)animateBunny;
- (void)bunnyHop;
- (void)bunnyShuffle;

@end
