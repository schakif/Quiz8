//
//  Quiz8ViewController.m
//  Quiz8
//
//  Created by Steve Chakif on 4/11/14.
//  Copyright (c) 2014 Steve Chakif. All rights reserved.
//

#import "Quiz8ViewController.h"
#import "ESView.h"

@interface Quiz8ViewController ()

@end

@implementation Quiz8ViewController
@synthesize leftView, rightView;
@synthesize esView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    lastVelocity = 0;
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addVertical:(id)sender {
    UIRotationGestureRecognizer *s = sender;
    if (lastVelocity > 0 && s.velocity < 0) {
        [self.esView saveCurrentPoint];
    }
    if (lastVelocity < 0 && s.velocity > 0) {
        [self.esView saveCurrentPoint];
    }
    self.esView.verticalAngle = s.rotation;
    self.esView.velocity = s.velocity;
    [self.esView forceRedraw];
    if (s.state == UIGestureRecognizerStateEnded) {
        [self.esView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
}

- (IBAction)addHorizontal:(id)sender {
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"%f radians horizontal", s.rotation);
    if (lastVelocity > 0 && s.velocity < 0) {
        [self.esView saveCurrentPoint];
    }
    if (lastVelocity < 0 && s.velocity > 0) {
        [self.esView saveCurrentPoint];
    }
    self.esView.horizontalAngle = s.rotation;
    self.esView.velocity = s.velocity;
    [self.esView forceRedraw];
    if (s.state == UIGestureRecognizerStateEnded) {
        [self.esView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
}
@end
