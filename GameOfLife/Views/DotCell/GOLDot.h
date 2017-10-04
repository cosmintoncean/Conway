//
//  GOLDot.h
//  GameOfLife
//
//  Created by Cosmin Toncean on 18/01/14.
//  Copyright (c) 2014 Cosmin Toncean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GOLDot : UIView

@property (nonatomic) int xPosition;
@property (nonatomic) int yPosition;
@property (nonatomic) DotState lifeState;

- (id)initWithFrame:(CGRect)frame xPosition:(int)x yPosition:(int)y;
- (void)changeStateTo:(DotState)newState;
- (void)changeLifestate;

@end
