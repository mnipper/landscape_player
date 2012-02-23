//
//  ViewController.m
//  LandscapeMp3Player
//
//  Created by Michael Nipper on 2/22/12.
//  Copyright (c) 2012 Wake Forest University. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController;
@synthesize bunnyImageView;
@synthesize adminCloud;
@synthesize nextCloud;
@synthesize previousCloud;
@synthesize playSunButton;
@synthesize musicPlayer;

NSTimer *timer;
BOOL playing = NO;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
    [self.musicPlayer setQueueWithQuery: [MPMediaQuery songsQuery]];
    [self.musicPlayer stop];
    //[self handleNowPlayingItemChanged:nil];
    //[self handlePlaybackStateChanged:nil];
    //[self handleExternalVolumeChanged:nil]; 
}

- (void)viewDidUnload
{
    [self setPlaySunButton:nil];
    [self setPlaySunButton:nil];
    [self setPreviousCloud:nil];
    [self setNextCloud:nil];
    [self setAdminCloud:nil];
    [self setBunnyImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    if (interfaceOrientation == UIInterfaceOrientationPortrait
        || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown
        || interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        return NO;
    if (interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        return YES;
    
    return NO;
    
}

- (IBAction)playSun:(id)sender {
    
    [self playOrPauseSong:self];
    
}

- (IBAction)previousTrack:(id)sender {
    
    [self playPrevious:self];
    
}

- (IBAction)nextTrack:(id)sender {
    
   [self playNext:self];
    
}

- (IBAction)adminButton:(id)sender {
    
    [self openMediaPicker:self];
    
}

- (void)animateBunny:(int)seconds {
    
    double durationUnit = seconds / 200.0;
    
    // This is the method that makes the bunny hop up and down.
    [self bunnyHop:durationUnit*2];
    
    // This is the timer that makes the bunny hop right.
    timer = [NSTimer scheduledTimerWithTimeInterval:durationUnit target:self selector:@selector(bunnyShuffle:) userInfo:nil repeats:YES];
}

- (void)bunnyHop:(double)seconds
{
    UIImage *bunny1 = [UIImage imageNamed:@"bunny_0011_Frame-1.png"];
    UIImage *bunny2 = [UIImage imageNamed:@"bunny_0010_Frame-2.png"];
    UIImage *bunny3 = [UIImage imageNamed:@"bunny_0009_Frame-3.png"];
    UIImage *bunny4 = [UIImage imageNamed:@"bunny_0008_Frame-4.png"];
    UIImage *bunny5 = [UIImage imageNamed:@"bunny_0007_Frame-5.png"];
    UIImage *bunny6 = [UIImage imageNamed:@"bunny_0006_Frame-6.png"];
    UIImage *bunny7 = [UIImage imageNamed:@"bunny_0005_Frame-7.png"];
    UIImage *bunny8 = [UIImage imageNamed:@"bunny_0004_Frame-8.png"];
    UIImage *bunny9 = [UIImage imageNamed:@"bunny_0003_Frame-9.png"];
    UIImage *bunny10 = [UIImage imageNamed:@"bunny_0002_Frame-10.png"];
    UIImage *bunny11 = [UIImage imageNamed:@"bunny_0001_Frame-11.png"];
    UIImage *bunny12 = [UIImage imageNamed:@"bunny_0000_Frame-12.png"];
    
    // Set the animation to continuously animate every 1.2 seconds.
    self.bunnyImageView.animationImages = [[NSArray alloc] initWithObjects:bunny1, bunny2, bunny3, bunny4, bunny5, bunny6, bunny7, bunny8, bunny9, bunny10, bunny11, bunny12, nil];
    self.bunnyImageView.animationRepeatCount = 0;
    self.bunnyImageView.animationDuration = seconds;
    [self.bunnyImageView startAnimating];
}

- (void)bunnyShuffle:(NSTimer*)theTimer
{
    // Make the bunny hop 5 pixels right every time this method is called.
    self.bunnyImageView.center = CGPointMake(self.bunnyImageView.center.x + 5, self.bunnyImageView.center.y);
    
    // Stop the bunny if he reaches the end of the world, 920 pixels.
    if (self.bunnyImageView.center.x >= 920) {
        [timer invalidate];
        [self.bunnyImageView stopAnimating];
    }
    
}

//play/pause functionality

- (IBAction) playOrPauseSong:(id)sender{

    if (playing == YES) {
        
        [timer invalidate];
        [self.bunnyImageView stopAnimating];
        [self.musicPlayer pause];
        playing = NO;
        
    } else {
        
        [timer invalidate];
        [self.musicPlayer play];
        int trackLength = [[[musicPlayer nowPlayingItem] valueForProperty: @"playbackDuration"] intValue];
        [self animateBunny:trackLength];
        playing = YES;
        
    } 
    
} 

//action to be tied to "Next" Button

-(IBAction) playNext:(id)sender {
    
    [timer invalidate];
    [self.musicPlayer skipToNextItem];
    [self.musicPlayer play];
    self.bunnyImageView.center = CGPointMake(70, self.bunnyImageView.center.y);
    int trackLength = [[[musicPlayer nowPlayingItem] valueForProperty: @"playbackDuration"] intValue];
    [self animateBunny:trackLength];
    playing = YES;
    
} 

//action to be tied to "Previous" Button

-(IBAction) playPrevious: (id) sender {
    
    [timer invalidate];
    [self.musicPlayer skipToPreviousItem];
    [self.musicPlayer play];
    self.bunnyImageView.center = CGPointMake(70, self.bunnyImageView.center.y);
    int trackLength = [[[musicPlayer nowPlayingItem] valueForProperty: @"playbackDuration"] intValue];
    [self animateBunny:trackLength];
    playing = YES;
    
} 

-(IBAction)openMediaPicker:(id)sender {
    
    MPMediaPickerController *mediaPicker = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    
    mediaPicker.delegate = self;
    
    mediaPicker.allowsPickingMultipleItems = YES;
    
    [self presentModalViewController:mediaPicker animated:YES];
        
} 

- (void)mediaPicker:(MPMediaPickerController*)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
    
    [self dismissModalViewControllerAnimated: YES];
    
    [self.musicPlayer setQueueWithItemCollection:mediaItemCollection];
    
    [self.musicPlayer stop];
    
    
} 

- (void) mediaPickerDidCancel: (MPMediaPickerController*)mediaPicker {
    
    [self dismissModalViewControllerAnimated:YES];
    
} 

@end
