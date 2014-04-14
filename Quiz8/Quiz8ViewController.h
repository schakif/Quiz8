//
//  Quiz8ViewController.h
//  Quiz8
//
//  Created by Steve Chakif on 4/11/14.
//  Copyright (c) 2014 Steve Chakif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESView.h"

@interface Quiz8ViewController : UIViewController {
    CGFloat lastVelocity;
}

- (IBAction)addVertical:(id)sender;
- (IBAction)addHorizontal:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;

@property (weak, nonatomic) IBOutlet ESView *esView;


@end
