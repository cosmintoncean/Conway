//
//  GOLGameView.h
//  GameOfLife
//
//  Created by Cosmin Toncean on 19/01/14.
//  Copyright (c) 2014 Cosmin Toncean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GOLDot.h"

@interface GOLGameView : UIView

- (void)setupGrid;
- (GOLDot *)gameDotForX:(int)xPos andY:(int)yPos;

@end
