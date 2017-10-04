//
//  GOLEngine.m
//  GameOfLife
//
//  Created by Cosmin Toncean on 19/01/14.
//  Copyright (c) 2014 Cosmin Toncean. All rights reserved.
//

#import "GOLEngine.h"
#import "GOLDot.h"

@implementation GOLEngine


- (id)initWithGameBoard:(GOLGameView *)gameBoard {
    self = [super init];
    if (self) {
        gameView = gameBoard;
        gameBoardCopy = [NSMutableArray array];
    }
    return self;
}

- (void)iterateOnDotsArray:(NSArray *)array {
    [self clearSecondGameBoard];
    gameBoardCopy = [NSMutableArray arrayWithArray:array];
    
    for (GOLDot *dot in array) {
        int aliveNeighbours = [self aliveNeighboursForDot:dot];
        
        if (dot.lifeState == kDotStateON) {
            if (!(aliveNeighbours == 2 || aliveNeighbours == 3)) {
                [dot changeStateTo:kDotStateOFF];
            }
        } else {
            if (aliveNeighbours == 3) {
                [dot changeStateTo:kDotStateON];
            }
        }
    }
}

- (void)clearSecondGameBoard {
    if (gameBoardCopy) {
        [gameBoardCopy removeAllObjects];
        gameBoardCopy = nil;
    }
}

- (NSNumber *)intNumber:(int)intValue {
    return [NSNumber numberWithInt:intValue];
}

- (int)aliveNeighboursForDot:(GOLDot *)dot {
    int aliveOnes = 0;
    
    int xNeighbour = dot.xPosition - 1;
    int yNeighbour = dot.yPosition - 1;
    
    for (int i = xNeighbour; i < xNeighbour + 3; i++) {
        for (int j = yNeighbour; j < yNeighbour + 3; j++) {
            if (i == dot.xPosition && j == dot.yPosition) {
                //do nothing, position of the evaluated Dot
            } else {
                if (i >= 0 && j >= 0 && i <= kMaxIndex && j <= kMaxIndex) {
                    GOLDot *evaluatedDot = [gameView gameDotForX:i andY:j];
                    
//                    evaluatedDot.backgroundColor = [UIColor cyanColor];
                    
                    if (evaluatedDot.lifeState == kDotStateON) {
                        aliveOnes++;
                    }
                }
            }
        }
    }
    
    return aliveOnes;
}


@end
