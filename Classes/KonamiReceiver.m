//
//  KonamiReceiver.h
//  Konami Code Recognizing View Controller
//
//  Created by Erran Carey on 4/25/12.
//  Copyright (c) 2012 @ipwnstuff. All rights reserved.
//

#import "KonamiReceiver.h"
#import "ViewController.h"

@interface KonamiReceiver ()

@end

@implementation KonamiReceiver

@synthesize upSwipes;
@synthesize downSwipes;
@synthesize leftSwipes;
@synthesize rightSwipes;
@synthesize bBool;
@synthesize aBool;
@synthesize b;
@synthesize a;
@synthesize konamiInt;

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    upSwipes = 0;
    downSwipes = 0;
    leftSwipes = 0;
    rightSwipes = 0;
    bBool = 0;
    aBool = 0;
    konamiInt = 0;
    [self addRecognizers];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (void)addRecognizers{
    UISwipeGestureRecognizer *up = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(upSwiped:)] autorelease];
    UISwipeGestureRecognizer *down = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(downSwiped:)] autorelease];
    UISwipeGestureRecognizer *left = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwiped:)] autorelease];
    UISwipeGestureRecognizer *right = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwiped:)] autorelease];
    up.direction = UISwipeGestureRecognizerDirectionUp;
    down.direction = UISwipeGestureRecognizerDirectionDown;
    left.direction = UISwipeGestureRecognizerDirectionLeft;
    right.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:up];
    [self.view addGestureRecognizer:down];
    [self.view addGestureRecognizer:left];
    [self.view addGestureRecognizer:right];
}
- (void)upSwiped:(UIGestureRecognizer *)recognizer {
    if (downSwipes == 0 && leftSwipes == 0 && rightSwipes == 0){
        upSwipes++;
    }
    else {
        upSwipes = 0;
        downSwipes = 0;
        leftSwipes = 0;
        rightSwipes = 0;
    }
    NSLog(@"Up swiped. Total Up = %i",upSwipes);
}
- (void)downSwiped:(UIGestureRecognizer *)recognizer {
    if (upSwipes == 2 && leftSwipes == 0 && rightSwipes == 0){
        downSwipes++;
    }
    else {
        [self toggleVisibility];
    }
    NSLog(@"Down swiped. Total Down = %i",downSwipes);
}

- (void)leftSwiped:(UIGestureRecognizer *)recognizer {
    if (downSwipes == 2 && upSwipes == 2 && rightSwipes == 0){
        leftSwipes++;
    }
    else if (downSwipes == 2 && upSwipes == 2 && rightSwipes == 1 && leftSwipes == 1) {
        leftSwipes++;
    }
    else {
        [self toggleVisibility];
    }
    NSLog(@"Left swiped. Total Left = %i",leftSwipes);
}

- (void)rightSwiped:(UIGestureRecognizer *)recognizer {
    if (downSwipes == 2 && upSwipes == 2 && rightSwipes == 0){
        rightSwipes++;
    }
    else if (downSwipes == 2 && upSwipes == 2 && rightSwipes == 1 && leftSwipes == 2) {
        rightSwipes++;
        [self toggleVisibility];
    }
    else {
        [self toggleVisibility];
    }
    NSLog(@"Right swiped. Total Right = %i",rightSwipes);
}

- (IBAction)bPressed{
    if(aBool == 0){
        bBool = 1;
    }
    else {
        b.hidden = YES;
        a.hidden = YES;
    }
}
- (IBAction)aPressed{
    if (bBool == 1) {
        aBool = 1;
        [self konami];
    }
    else {
        b.hidden = YES;
        a.hidden = YES;
    }
}
-(void)konami{
    NSLog(@"Konami Code");
    konamiInt++;
    b.hidden = YES;
    a.hidden = YES;    
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Konami Code Entered" message:@"Do you want to do something cool?" delegate:self cancelButtonTitle:@"Nah." otherButtonTitles:@"Sure!", nil] autorelease];
    [alert show];
}

- (void)toggleVisibility{
    NSLog(@"Tried to toggle");
    if (upSwipes == 2 && downSwipes == 2 && leftSwipes == 2 && rightSwipes == 2) {
        b.hidden = NO;
        a.hidden = NO;
    }
    upSwipes = 0;
    downSwipes = 0;
    leftSwipes = 0;
    rightSwipes = 0;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1){
        //Do Something.
    }
}


@end