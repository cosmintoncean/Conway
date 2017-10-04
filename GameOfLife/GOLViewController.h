//
//  GOLViewController.h
//  GameOfLife
//
//  Created by Cosmin Toncean on 18/01/14.
//  Copyright (c) 2014 Cosmin Toncean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GOLGameView.h"
#import "GOLEngine.h"

@interface GOLViewController : UIViewController {
    GOLGameView *gGameView;
    GOLEngine *gameEngine;
    
    BOOL shouldAnimate;
}

- (IBAction)runSimulationButtonPressed:(id)sender;

@end
