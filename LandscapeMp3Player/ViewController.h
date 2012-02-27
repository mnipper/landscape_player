//
//  ViewController.h
//  LandscapeMp3Player
//
//  Created by Michael Nipper on 2/22/12.
//  Copyright (c) 2012 Wake Forest University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController
{
    MPMusicPlayerController *musicPlayer;
}

@property (weak, nonatomic) IBOutlet UIButton *sunButton;
@property (weak, nonatomic) IBOutlet UIImageView *bunnyImageView;
@property (weak, nonatomic) IBOutlet UIButton *adminCloud;
@property (weak, nonatomic) IBOutlet UIButton *nextCloud;
@property (weak, nonatomic) IBOutlet UIButton *previousCloud;
@property (nonatomic, retain) MPMusicPlayerController *musicPlayer; 
@property (weak, nonatomic) IBOutlet UIButton *shuffleButton;

- (IBAction)playSun:(id)sender;
- (IBAction)previousTrack:(id)sender;
- (IBAction)nextTrack:(id)sender;
- (IBAction)adminButton:(id)sender;
- (void)animateBunny:(int)seconds;
- (void)bunnyHop:(double)seconds;
- (void)bunnyShuffle;

- (IBAction)playOrPauseSong:(id) sender;
- (IBAction)playNext:(id) sender;
- (IBAction)playPrevious:(id) sender;
- (IBAction) openMediaPicker: (id) sender;
- (IBAction) shuffle: (id) sender;

@end
