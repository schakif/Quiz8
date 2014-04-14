//
//  ESView.h
//  Quiz8
//
//  Created by Steve Chakif on 4/14/14.
//  Copyright (c) 2014 Steve Chakif. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESView : UIView

- (void) saveCurrentPoint;
- (void) forceRedraw;


@property (nonatomic) CGPoint currentPoint;
@property (nonatomic, strong) NSMutableArray *allPoints;

@property(nonatomic) CGFloat horizontalAngle;
@property(nonatomic) CGFloat velocity;
@property(nonatomic) CGFloat verticalAngle;

@end
