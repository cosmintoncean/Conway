//
//  GOLGameView.m
//  GameOfLife
//
//  Created by Cosmin Toncean on 19/01/14.
//  Copyright (c) 2014 Cosmin Toncean. All rights reserved.
//

#import "GOLGameView.h"

@implementation GOLGameView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    self.backgroundColor = [UIColor grayColor];
}

- (void)setupGrid {
    int noCells = 10;
    float cellHeight = self.frame.size.height / noCells;
    
    for (int i = 0; i < noCells; i++) {
        for (int j = 0; j < noCells; j++) {
            GOLDot *newDot = [[GOLDot alloc] initWithFrame:CGRectMake(i * cellHeight, j * cellHeight, cellHeight, cellHeight) xPosition:i yPosition:j];
            [self addSubview:newDot];
        }
    }
}

- (GOLDot *)gameDotForX:(int)xPos andY:(int)yPos {

    for (GOLDot *aDot in self.subviews) {
        if (aDot.xPosition == xPos && aDot.yPosition == yPos) {
            return aDot;
        }
    }
    
    return NULL;
}

@end
