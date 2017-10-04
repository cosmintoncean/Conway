//
//  GOLEngine.h
//  GameOfLife
//
//  Created by Cosmin Toncean on 19/01/14.
//  Copyright (c) 2014 Cosmin Toncean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GOLGameView.h"

@interface GOLEngine : NSObject {
    GOLGameView *gameView;
    NSMutableArray *gameBoardCopy;
}

- (id)initWithGameBoard:(GOLGameView *)gameBoard;
- (void)iterateOnDotsArray:(NSArray *)array;

@end
