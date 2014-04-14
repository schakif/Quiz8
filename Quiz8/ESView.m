//
//  ESView.m
//  Quiz8
//
//  Created by Steve Chakif on 4/14/14.
//  Copyright (c) 2014 Steve Chakif. All rights reserved.
//

#import "ESView.h"

@implementation ESView
@synthesize allPoints, currentPoint;
@synthesize horizontalAngle, verticalAngle, velocity;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        allPoints = [[NSMutableArray alloc] init];
        NSValue *startingPoint = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
        [allPoints addObject:startingPoint];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        allPoints = [[NSMutableArray alloc] init];
        [allPoints addObject:[NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)]];
        [self setBackgroundColor:[UIColor lightGrayColor]];
    }
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [self becomeFirstResponder];
    return self;
}

- (void)forceRedraw {
    [self setNeedsDisplay];
}

-(BOOL) canBecomeFirstResponder {
    return YES;
}

- (void)saveCurrentPoint {
    NSValue *newPoint = [NSValue valueWithCGPoint:currentPoint];
    [allPoints addObject:newPoint];
    verticalAngle = 0;
    horizontalAngle = 0;
    velocity = 0;
}

- (void)drawCurrentPoint {
    [[UIColor whiteColor] setStroke];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:currentPoint];
    [path setLineWidth:4];
    CGPoint p = CGPointMake(currentPoint.x - 2, currentPoint.y - 2);
    [path addLineToPoint:p];
    p.x += 4.0;
    [path addLineToPoint:p];
    p.y += 4.0;
    [path addLineToPoint:p];
    p.x -= 4.0;
    [path addLineToPoint:p];
    p.y -= 4.0;
    [path addLineToPoint:p];
    [path stroke];
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bz = [[UIBezierPath alloc] init];
    [bz setLineWidth:3.0];
    [[UIColor blackColor] setStroke];
    [bz moveToPoint:[[allPoints firstObject] CGPointValue]];
    for (id point in allPoints) {
        [bz addLineToPoint:[point CGPointValue]];
    }
    CGPoint lastPoint = [[allPoints lastObject] CGPointValue];
    currentPoint = CGPointMake(lastPoint.x + self.horizontalAngle*10.0,
                               lastPoint.y + self.verticalAngle*10.0);
    if (currentPoint.x < 0) {
        currentPoint.x = 0;
    }
    if (currentPoint.y < 0) {
        currentPoint.y = 0;
    }
    if (currentPoint.x > self.bounds.size.width) {
        currentPoint.x = self.bounds.size.width;
    }
    if (currentPoint.y > self.bounds.size.height) {
        currentPoint.y = self.bounds.size.height;
    }
    
    [bz addLineToPoint:currentPoint];
    [self saveCurrentPoint];
    [bz stroke];
    
    [self drawCurrentPoint];
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.subtype == UIEventSubtypeMotionShake) {
        [allPoints removeAllObjects];
        [allPoints addObject:[NSValue valueWithCGPoint:currentPoint]];
        [self setNeedsDisplay];
    }
    if ([super respondsToSelector:@selector(motionEnded:withEvent:)]) {
        [super motionEnded:motion withEvent:event];
    }
}

@end
