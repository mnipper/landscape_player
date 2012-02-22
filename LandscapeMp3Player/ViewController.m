//
//  ViewController.m
//  LandscapeMp3Player
//
//  Created by Michael Nipper on 2/22/12.
//  Copyright (c) 2012 Wake Forest University. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize adminCloud;
@synthesize nextCloud;
@synthesize previousCloud;
@synthesize playSunButton;

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
}

- (void)viewDidUnload
{
    [self setPlaySunButton:nil];
    [self setPlaySunButton:nil];
    [self setPreviousCloud:nil];
    [self setNextCloud:nil];
    [self setAdminCloud:nil];
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
    // Return YES for supported orientations
    return YES;
}

- (IBAction)playSun:(id)sender {
    
    NSLog(@"Play.");
    
}

- (IBAction)previousTrack:(id)sender {
    
    NSLog(@"Previous Track.");
    
}

- (IBAction)nextTrack:(id)sender {
    
    NSLog(@"Next Track.");
    
}

- (IBAction)adminButton:(id)sender {
    
    NSLog(@"Admin Button.");
    
}

@end
