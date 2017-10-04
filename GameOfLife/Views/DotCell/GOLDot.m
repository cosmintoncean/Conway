//
//  GOLDot.m
//  GameOfLife
//
//  Created by Cosmin Toncean on 18/01/14.
//  Copyright (c) 2014 Cosmin Toncean. All rights reserved.
//

#import "GOLDot.h"


@implementation GOLDot

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame xPosition:(int)x yPosition:(int)y {
    self = [super initWithFrame:frame];
    if (self) {
        self.xPosition = x;
        self.yPosition = y;
        self.layer.cornerRadius = 10.0f;
        self.layer.borderWidth = 2.0f;
        self.layer.borderColor = [[UIColor grayColor] CGColor];
//        
//        UILabel *xyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//        xyLabel.numberOfLines = 0;
//        xyLabel.text = [NSString stringWithFormat:@" %d \n %d", x, y];
//        
//        [self addSubview:xyLabel];
        [self dotIsDead];
    }
    return self;
}

#pragma mark -
#pragma mark - Dot State handling

- (void)dotIsDead {
    self.backgroundColor = [UIColor whiteColor];
    self.lifeState = kDotStateOFF;
}

- (void)dotIsAlive {
    self.backgroundColor = [UIColor blackColor];
    self.lifeState = kDotStateON;
}

- (void)changeStateTo:(DotState)newState {
    switch (newState) {
        case kDotStateOFF:
            [self dotIsDead];
            break;
        case kDotStateON:
            [self dotIsAlive];
            break;
        
        default:
            break;
    }
}

- (void)changeLifestate {
    if (self.lifeState == kDotStateOFF) {
        [self changeStateTo:kDotStateON];
    } else {
        self.lifeState = kDotStateOFF;
        [self changeStateTo:kDotStateOFF];
    }
}

#pragma mark - 
#pragma mark - Touch handling

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self changeLifestate];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

#pragma mark -

@end
