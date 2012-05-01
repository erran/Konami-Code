//
//  KonamiReceiver.h
//  Konami Code Recognizing View Controller
//
//  Created by Erran Carey on 4/25/12.
//  Copyright (c) 2012 @ipwnstuff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KonamiReceiver : UIViewController<UIAlertViewDelegate>{}


@property int upSwipes;
@property int downSwipes;
@property int leftSwipes;
@property int rightSwipes;
@property int konamiInt;
@property BOOL bBool;
@property BOOL aBool;

@property (strong, nonatomic) IBOutlet UIButton *b;
@property (strong, nonatomic) IBOutlet UIButton *a;

- (void)addRecognizers;
- (void)upSwiped:(UIGestureRecognizer *)recognizer;
- (void)downSwiped:(UIGestureRecognizer *)recognizer;
- (void)leftSwiped:(UIGestureRecognizer *)recognizer;
- (void)rightSwiped:(UIGestureRecognizer *)recognizer;
- (IBAction)bPressed;
- (IBAction)aPressed;
- (void)toggleVisibility;
- (void)konami;

@end